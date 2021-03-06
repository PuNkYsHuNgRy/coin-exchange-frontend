<!--
***************************************************************************** 
* Copyright 2016 Aurora Solutions 
* 
*    http://www.aurorasolutions.io 
* 
* Aurora Solutions is an innovative services and product company at 
* the forefront of the software industry, with processes and practices 
* involving Domain Driven Design(DDD), Agile methodologies to build 
* scalable, secure, reliable and high performance products.
* 
* Coin Exchange is a high performance exchange system specialized for
* Crypto currency trading. It has different general purpose uses such as
* independent deposit and withdrawal channels for Bitcoin and Litecoin,
* but can also act as a standalone exchange that can be used with
* different asset classes.
* Coin Exchange uses state of the art technologies such as ASP.NET REST API,
* AngularJS and NUnit. It also uses design patterns for complex event
* processing and handling of thousands of transactions per second, such as
* Domain Driven Designing, Disruptor Pattern and CQRS With Event Sourcing.
* 
* Licensed under the Apache License, Version 2.0 (the "License"); 
* you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at 
* 
*    http://www.apache.org/licenses/LICENSE-2.0 
* 
* Unless required by applicable law or agreed to in writing, software 
* distributed under the License is distributed on an "AS IS" BASIS, 
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and 
* limitations under the License. 
*****************************************************************************
-->


<div class="slider" id="tradelist-wrap">
  <div class="transfer" style="width: 1900px;">
    <div class="frame" style="width: 950px;">
      <div id="table-tradelist-wrap" class="vmarg40bot" ng-controller="TradesController">
        <h4 class="title">Trades</h4>

        <div class="form-inline" role="grid">
          <div class="row" ng-hide="loaded">
            <p style="text-align: center">
              <i class="icon-spinner icon-spin icon-large icon-5x"></i>
              Loading...
            </p>
          </div>

          <table class="table table-hover table-striped dataTable" ng-show="loaded">
            <thead>
            <tr role="row">
              <th ng-click="updateSorting('TradeId')" class="lalign nw"
                  ng-class="getSortingClass('TradeId')" style="width: 55px;">Trade</th>
              <th ng-click="updateSorting('ExecutionDateTime')" class="lalign nw"
                  ng-class="getSortingClass('ExecutionDateTime')" style="width: 160px;">Executed</th>
              <th ng-click="updateSorting('Price')" class="ralign nw"
                  ng-class="getSortingClass('Price')" style="width: 80px;">Price</th>
              <th ng-click="updateSorting('Volume')" class="ralign"
                  ng-class="getSortingClass('Volume')" style="width: 115px;">Volume</th>
              <th ng-click="updateSorting('CurrencyPair')" class="lalign"
                  ng-class="getSortingClass('CurrencyPair')" style="width: 50px;">Pair</th>
              <th ng-click="updateSorting('Cost')" class="ralign" style="width: 115px;"
                  ng-class="getSortingClass('Cost')">Cost</th>
            </tr>
            </thead>

            <tbody>
            <tr ng-repeat="trade in filteredTrades"
                ng-class="{even: $even, odd: $odd}" ng-cloak>
              <td class="nw" ng-click="setTradeIdAsUrlParameter(trade.TradeId)" tab-right-click="setTradeIdAsUrlParameter(trade.TradeId)" ng-class="{active: ('account.trade.tradeDetails' | routeSegmentStartsWith)}">
                 <a href="{{locationPath}}" >{{trade.TradeId | limitTo : 8}}</a>
              </td>
              <td class="lalign" ng-bind="trade.ExecutionDateTime | date : 'MM-dd-yy HH:mm:ss'" ng-class="{'changeralign': trade.ChangeColor}"></td>
              <td class="nw ralign" ng-bind="trade.Price" ng-style="customStyle.style" ng-class="{'changeralign': trade.ChangeColor}"></td>
              <td class="ralign" ng-bind="trade.Volume" ng-style="customStyle.style" ng-class="{'changeralign': trade.ChangeColor}"></td>
              <td class="lalign" ng-bind="trade.CurrencyPair" ng-style="customStyle.style" ng-class="{'changeralign': trade.ChangeColor}"></td>
              <td class="ralign" ng-bind="trade.Cost" ng-style="customStyle.style" ng-class="{'changeralign': trade.ChangeColor}"></td>
            </tr>

            <tr class="odd" ng-hide="trades.length">
              <td valign="top" colspan="5" class="dataTables_empty">No trades yet.</td>
            </tr>
            </tbody>
          </table>

          <div ng-show="loaded">
            <div class="pull-right">
              <pagination total-items="totalItems" ng-model="currentPage" num-pages="numPages"
                          previous-text="&lsaquo;" next-text="&rsaquo;" first-text="&laquo;" last-text="&raquo;"
                          max-size="maxSize" class="pagination-sm" ng-change="pageChanged()"
                          boundary-links="true" rotate="false"></pagination>
            </div>

            <div class="pull-left">
              <div class="dataTables_info" ng-cloak>
                {{currentMinIndex + 1}} - {{currentMaxIndex}} of {{totalItems}} trades
              </div>
            </div>
          </div>

          <div class="row">
            <div class="span3">
              <div class="dataTables_info"></div>
            </div>

            <div class="span5 offset1"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
