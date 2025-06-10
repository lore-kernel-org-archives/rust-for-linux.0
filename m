Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1AA219FC
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 02:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522813; cv=fail; b=nZsAt68tvRSeYRSsesc6m44+RfPrlQxgzHGBn/0rb240lIcl1efKFBJRa0+f1hiJlw7ckDKQ3OGqo4N04Ev2SOuExaZlYxuoOFgY1zUisfiW+QszzqH+H6QuIGwv4uWNx8TVP5fU1duSScb92OPtadt+baccH6WjMALvWJ5LxnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522813; c=relaxed/simple;
	bh=VXeZLGiaGEQzZjUSxzy3Rdeblg5nNmjvwN5oBqa9hEA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c6Q4/d6y3ehsdzEsMTVX17Txtem2OoB/voM55aCHrhv4GoV76csjBKwmf9McsntAZFjMSZ8i58gbYdZSHfkGrKWO66VyV7d01/CnPaW/MJ6TAoPXrGneYnZYm8vyELPGWcepPpQoH/QQeOIDocptwHPOOjJKboQp7txCIyJqtQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U8zRrp22; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U8zRrp22"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cml9uWspSVcybfSGfr4ITcGTf+u++1fk+p85w6rQsdgcgChuulb0SarR19lVLQgww8IVdcq6LNF+KZd6W1bKWb8/SX3IAyPr5wWuzFiQguKAq+apINiNJtTITpOAiSGDAzVL2WJkjRfUGWmQVSPvyA+vnuCkqqfbDFUWTpVDtrSjln/J5PFNt8EnuHP7NNSAUuqIifx8ghDDUhszbRVpE/bpGbkgGC9XTMdBrVOKbj39sb7NEVqAQjBg4PwGbXxjqLRqwJ9T5A6zrLN7TtWe37mL9S0JFRPgC9HPt6gyvJQxwztzAkTEY0ugj5HivvW0x1+Il1cH71rxbO3cCQPjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUF8N4EnBxTziRBMIYiB/qpHulKGxc46M+J/9fxDfrI=;
 b=tQI+GW4MZdImbQSQT/bPhYJdpsmHzyD+RR/WbulEPyOd9IxSbvZkBZIPEnpXBG0N1Dh6BAJK5vDoW5T8fTihehEuqivTO9mRT9JobMy4ZOtB2iK/elyt7Br0paMQucnE2+dYLCsjY+aP+w3u6HkGDtteyeQ1qvbPRO3EeDFAq3vYhdoDhEETB59WDnBt84kG4jBU+sEx9wddKvFmjMK6vQBG/+nYz5lZQlbhPS7Qia3iPvMTx5KOAWEY2woUbl5YVQafqKVcR9Y/ze4fPzFweb5n79wIlF5U+EL77MQuX6nx6TERXmuJZL5TReDbMBSvutVHDasid7WDAOKEtYh8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUF8N4EnBxTziRBMIYiB/qpHulKGxc46M+J/9fxDfrI=;
 b=U8zRrp22eUuLsEwvHRHqtjT37doTpMgTdoYIvHYe/etA6hmxke5hDZEFS8H7s4H3owSNpWpEbuL3DfiE963ilE+7fBPEP0OQ0ZGis8+c1gl7uslLGpp4rGtECnKCoPhnuHqRkyk0s3j4XTp6FSliHDNfJEuTImqLHbO4Y+EJQeFyxpTdcTdJJ5T9/hRX2nZpnx5AgMElLvT6WYYyQ2alkkecuDDCJKzNkCAzhRkJg74mhCIPKPlgM0M3sa1Aksgzw9tQMIo2wZfgy8mzV729ZRtzIkwOMSAUs7kW1vuj7ToIb42MbEjSFR9ZsvQ+3AFeH0OUREu2trLn/fbpIju32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 10 Jun
 2025 02:33:28 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8792.035; Tue, 10 Jun 2025
 02:33:27 +0000
Message-ID: <14dce552-c69a-460a-a54e-924423ab569b@nvidia.com>
Date: Mon, 9 Jun 2025 19:33:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20250609223606.2897030-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250609223606.2897030-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 160e1d34-fbbf-4522-055c-08dda7c72e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVNkNjZmTkFWTHdIVWpNLzgyRVRlU29sSU1ZRThiSW0vUnVrbXZPNzhVTUFS?=
 =?utf-8?B?YkhMTnVuNFIxb0lVVzNtWi9UNk10eUtUWm0rWWk2VysrUjM2WUozbjBTUVdT?=
 =?utf-8?B?Z05oeDlRQ0gvamNjQ3JGVFhqRmZnTzV1YjZ0ZTZVQmtMaXVEM1BvWTgrcDcx?=
 =?utf-8?B?OThYbFhjY0F6Q1VTbjlDS3d5NDJLb0Y1c2NhZFZ0Tk03by9ENHhXcGhmUjd0?=
 =?utf-8?B?VXAwbzB2ay8wei9yZE5XWUc4MVU1c1UzNWNDcUEzWUVuazB2SzNQVExNRUgv?=
 =?utf-8?B?Y1UrNWd1SDRyWXZjdHBUREM3VUVUK01CdnJxQjZZOTZOcHRFSThFTnF6aFRU?=
 =?utf-8?B?d1NkaUpqRXNoYTB0dXdFTjRiSUl4Sjc5QXFGU2N6TVVORUZ0MXNYLzloRFVP?=
 =?utf-8?B?MWFObG5HUU9zNkduUmdTa0dNeHI5YUVEVjkrZXMwK2V6QUYrRlE3ajByVklK?=
 =?utf-8?B?d3RhMkdRejg5Rk5ScjlXSmx4WmFXZEtkeUdKU3c5ZkNuM0ExTzEyeEN0NXFX?=
 =?utf-8?B?cDZiUGs3ejBZYy9PWDE2MjNFb1AxUnJaV2FydjgwQlJjaWJLVGliNEVMTHVk?=
 =?utf-8?B?cmttT3drNHBpRmhVQTVYWFRXRnB2d1VmWjA5L25aaUVRZ2ViTnQ1bll2N0xI?=
 =?utf-8?B?VXZuTVl4eGFSZE9JQlZld3RNb2FzbmRTdUo2RFZTTVFVUHNyYzVrS3NrN3NS?=
 =?utf-8?B?SC9acE41V1FmNUZlOC93ekUyTUc4S054TGFrZ2QvTEdFWGRMN1IxQW9VTTVj?=
 =?utf-8?B?d3ZRMmVjZU96QTNZcmJjbVVySk8yMzVjcTdFWkkyeEhySkJzR3FJckw1Z05w?=
 =?utf-8?B?bmowdXFtSkpVU2NSMFU4VjFYazQrbjRiTHNyVHJCTUFEUnQ4SXhJK0NZUWhK?=
 =?utf-8?B?Y3d3djd3YXNTbjNJVFU1VitXV1N4UzNPRjNlR1B0RDJxWVMxZ0UrVXBjVS9I?=
 =?utf-8?B?V0UzMnZFT1hCQnU2RWkvMmUvSHBEUFVBNCtJWUtjbFRQanpCZW12RlRTdTBs?=
 =?utf-8?B?amRNVjFkcWpjaFVQa0JkcFg4U2kvdXc0QVI0azdTaFg0cnQ5ZEE2UGNoaGFF?=
 =?utf-8?B?S2x0citwWndsazZnS01kZVFuRHl2dkw2eE56WjE2QlhJYnpBSVFyN2Z3bzF2?=
 =?utf-8?B?akw0SW0xSXJVYjN4LzBoM1dTeGNrcC85QjIwandLZTVFa2FFMlZhWDVhR1hu?=
 =?utf-8?B?RWp4R2NnS3Joc0M3UEdmSy9LL3M5TTdXaUFoeWlBSHlxQkdLL01EUTJMYmVS?=
 =?utf-8?B?REVNL29Nd2E2bWhqYjNZd1VHR3FLZ3hXQllZb3FpZlZEeVhLSWh4SjNrRTZR?=
 =?utf-8?B?c0l3blBRTzYya1hoSmpmRVZxanU4cmN4VHc3WUxwL0VwUUZwZ0hZbkhsMlhn?=
 =?utf-8?B?Nmx4SkJVREZiajFSb1BRRnVIbzNpT3EzNUFkTVRCdFJrNUtnT2xmclk1NHh1?=
 =?utf-8?B?KzZwR0FDSE9jMzNXN0N2ODJmWGFkZ3hId251amRTZ1V4U1dJNUxzdGxJdFlB?=
 =?utf-8?B?Ukg4TWdBV3J3SGtncHBBUkxNclJmclFTQmhxaXhJWUhmK242WWY1enUydU9m?=
 =?utf-8?B?YkNFeDZTSnJSOFBmZWNXVE1PKzVmcllHandaK092YlVkR0N2S01RQisyVVM3?=
 =?utf-8?B?OUZtSFdVbzRIY2hQTVJJUmlBUU1UN1F2K3ZWMFJxMDd3Q1pJRStFS3MyQURQ?=
 =?utf-8?B?MHNyaXFsSTcwSnQwTUkxejBoR0hHVUVmZkxkN3lHZVRBcWlwWWZrVjF3Y2NF?=
 =?utf-8?B?UE1DVDBXQ3N1KzRMWW14S0JXY0E4Vi9YVkV3bFJ2YlNqYldBeHRNZE1XM2Mv?=
 =?utf-8?B?S3JaSFpqOS9wU0lPZ1lydWFBKzZJdzRSZG1ybEYxMVZ3eGFiSFlwNmNKbitL?=
 =?utf-8?B?bUh2dVZUMWhTb1pSVXJMcS8vNTFyMVJPMWdxbnFnNDFsb0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVrZUhYVmc4M0l6dEs5bUlnMGZtc2F4b0xZVG95NC9qV0xGTm40eWhjVkcr?=
 =?utf-8?B?Y2xueVdxUFdSMnVuVTQxbDRNZHI5akNxeVdEUVlQZXc1QjlxT3dRUEh6Zitw?=
 =?utf-8?B?c2dSRU5MeUVTMElueEo1b1V3cy9pM1BVNU1VMThacXRIQkk5UVdLcEMvVlZs?=
 =?utf-8?B?MWx3VkZjK2swbFlBT2thUS9sOWpIOXdpbzRmYVVtaDVHaG1heTFBYkVOSjdt?=
 =?utf-8?B?R05CZUQ5WDBqd3Baa3poYmV0RGZlWktiNVJEaCtGMDd4YytUNWFTcXFiRm9u?=
 =?utf-8?B?czN0b3piQU1jcXN3L2hDVUpidk1UNG5tM3FvcWVzK0RPMk5DQ01XNVVQMHpi?=
 =?utf-8?B?K1l5Q2c3WGRJMEJLWTRMVUpSb1Y5TjZlV1JFUUJvbGV6a00zTEhZa0thSytG?=
 =?utf-8?B?RUxRM2ZSTHorcDVuVGtqTE11L1BDRTlQSGRDQlhlV0dFeW1wc1p2ZlUrc05T?=
 =?utf-8?B?QnMzSjVMNkI5eGRVWWNuNENxcXZhSGFCclFtN0tOcTRXQ2VnUjZ1d2VUL3Ji?=
 =?utf-8?B?azRTTDlBaUVvS2VTTU5oYWkvbjMxVy92TDI0QVpJNnpLU0xDb1VFN2ttdVRm?=
 =?utf-8?B?MzhSN2ZUKzF1Qk1ReE1IYmE1RHNjOWtSM3lCVmx5M0ZLMHk3OFVweGw3N2pZ?=
 =?utf-8?B?NURXcjY3WnpJVkJ0T2pVS0ppRVRCWGdHQU5XT3dOSEU3YittUkxFY2ZqdDlm?=
 =?utf-8?B?b1hHVFJSekZNcGYvWHMwSTZkeGlTYjcveHp3RXVQYm9RRytXRThzaUptMkVK?=
 =?utf-8?B?NWJ5eDZnRzBMM0cvNTd4RUhnMEkxNHpQMWw3Q0J2VUJGVzR1SzdERmhiRGpF?=
 =?utf-8?B?K2dTMm81UUpJL3E3dnl6T3diNVFDQ3dBSU1Eamw3SDUvU3RLVk1Kb3hmZmZs?=
 =?utf-8?B?YTIxdGhwZFdyajNoNW1kOTF1VktJU1poSXZXRGtlTzM1K0wyQUxvb2d0a0Vq?=
 =?utf-8?B?WHhjT0xsUXVIbjVCQjl0V1FNS1hKZm9ES0xEekd2b0tWWTBxSXZGZDNobDUr?=
 =?utf-8?B?RlVBaFBHYXZhT3BUaGpYTXdCL2NTbjg4c3NERUNzUGh0cFoyQ1ZacThrMWNw?=
 =?utf-8?B?cXZaYXZJZmpsbmpxN2FNeHhKdEpINS9iQnl4V3dGSXFhb2pva09jWWNsZ2th?=
 =?utf-8?B?RG5iY2tEcUk1eFEzc0J5VnlZQldMVW44eFFSMXBYVTRueVV2TG1QUFRXSXBF?=
 =?utf-8?B?WGs1YjlVYjltOTkxeWx6T1FqUzFwbjVyRlk5ZFRpelYzS0lxNTZxVXZXRGF2?=
 =?utf-8?B?NS9aTVRoMDhWbmJTQXlpVmdBT3oyeDVWY094K2Jlb0RZaTNEanlHMzNtK1RH?=
 =?utf-8?B?V0N1UUY5c25TV1RvWGxGRUVzVHh1Y0JVVXNQQ0EvUTZlbm9UbS9TelRCWXhB?=
 =?utf-8?B?Sy84Zzl5UktONVJsanZZckFDTUUvKzJtUkVsMkZYUUhRZDQyQ0dmUm9kV21p?=
 =?utf-8?B?Y3hwWlRtTFN3TW0wMDg1NVFIcWJNbVNxREJpaDhjTWZoelYzQkFBblVaT01I?=
 =?utf-8?B?dWJrVmR5VEszWXNKdjVkcmlPNkVYTVA5OXp0MkZ3M3RpNG5VS0szOUo0MW9p?=
 =?utf-8?B?dDh5SzVWYVhmK3ZuRm9PQkc1cS8zQ282UC9IRVlhelE4UmZyTFNtcVVNb2tC?=
 =?utf-8?B?RjNFQ1Q0VkJSTUdMdXh3MGFVVUNoandrYS9FT0Y0VnNLY3dpTkdnRVJUOXdO?=
 =?utf-8?B?Y3IwVWdnbTdFRTZQUUhXYUwyVGJhekk2Y1dpRlEyTWtHQWRzLzJ5QXdmU0hV?=
 =?utf-8?B?RHpIV3AvRGhaK2tMOG1iY0ZjUmprdEh3ckNkamFkVHB2bUJIUlUrMmJJZHp6?=
 =?utf-8?B?L3B6MkFYa1Nvajlla3p1MWtmU3RBMDRSTVVVRWhDS01XbWk5V0xpMmxuWlds?=
 =?utf-8?B?TmIzRDZGc1VOYWJzZUNYcDlsanNldmVWZUhFTFp3Vnd0TmdsOXpFRGxiVzB4?=
 =?utf-8?B?VldIdGZrK0p3MDVqVzRQMEpya29hR0R6Yi9CaWdRQmNwdFZQdEFYZmxZeUF1?=
 =?utf-8?B?TldFOWF6SHNvKzc4YXhuRXpFS3J2OUV6SG03SEZLOW9GZkU1UTk2bGNUOXln?=
 =?utf-8?B?citWVTdONldCSmsrNUVDUXJUY2NQNk8yT245aFJhL3V2ejk1Z3dQMHJoLzVx?=
 =?utf-8?Q?nDqcx6Fb4nvKod6UTpJh1mI85?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160e1d34-fbbf-4522-055c-08dda7c72e85
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 02:33:27.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfIjpHQh9/4m3orD350FZkNQ7ausAkSdeMZHI24an2ejrcdjZjN+YpewL+l8gM830EB2l4vl7DLjK+XOmBUzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959

On 6/9/25 3:36 PM, Timur Tabi wrote:
> Introduce the sfile (short file) macro that returns the stem of
> the current source file filename.
> 
> Rust provides a file!() macro that is similar to C's __FILE__ predefined
> macro.  Unlike __FILE__, however, file!() returns a full path, which is
> klunky when used for debug traces such as
> 
> 	pr_info!("{}:{}\n", file!(), line!());
> 
> sfile!() can be used in situations instead, to provide a more compact
> print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
> returns just "print".
> 
> The macro avoids str::rfind() because currently, that function is not
> const.  The compiler emits a call to memrchr, even when called on string
> literals.  Instead, the macro implements its own versions of rfind(),
> allowing the compiler to generate the slice at compile time.
> 
> The macro also uses some unsafe functions in order to avoid indexing
> into a str, which is necessary to fully support const contexts.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/print.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 9783d960a97a..5b0c36481e95 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -423,3 +423,69 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>      )
>  );
> +/// Returns the index of the last occurrence of `needle` in `haystack`, or zero.
> +///
> +/// Identical to [`str::rfind()`], but unlike that function, this one is const.
> +/// That is, the compiler can inline it when called with a string literal.
> +#[inline]
> +pub const fn rfind_const(haystack: &str, needle: char) -> Option<usize> {
> +    let bytes = haystack.as_bytes();

Silly nit: "bytes" is just adding an unnecessary variable that also has
a non-informative name. Just delete it...

> +    let mut i = haystack.len();
> +    while i > 0 {
> +        i -= 1;
> +        if bytes[i] == needle as u8 {

...and write the above line accordingly:

	if haystack.as_bytes()[i] == needle as u8 {


Yes?


thanks,
-- 
John Hubbard

> +            return Some(i);
> +        }
> +    }
> +    None
> +}
> +
> +/// Returns just the base filename of the current file.
> +///
> +/// This differs from the built-in [`file!()`] macro, which returns the full
> +/// path of the current file.
> +///
> +/// Using the base filename gives you more succinct logging prints.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sfile
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// ```
> +#[macro_export]
> +macro_rules! sfile {
> +    () => {{
> +        use kernel::print::rfind_const;
> +
> +        const FILE: &str = file!();
> +
> +        // [`.as_bytes()`] does not support non-ASCII filenames
> +        assert!(FILE.is_ascii());
> +
> +        let start = match rfind_const(FILE, '/') {
> +            Some(slash) => slash + 1,
> +            None => 0,
> +        };
> +        let end = match rfind_const(FILE, '.') {
> +            Some(dot) => dot,
> +            None => FILE.len(),
> +        };
> +
> +        // The following code the equivalent of &FILE[start..start+len],
> +        // except that it allows for const contexts.  For example,
> +        //   const SFILE: &'static str = sfile!();
> +
> +        let base_ptr: *const u8 = FILE.as_ptr();
> +
> +        // SAFETY: We know that `start` is <= the length of FILE, because FILE
> +        // never ends in a slash.
> +        let ptr: *const u8 = unsafe { base_ptr.add(start) };
> +        // SAFETY: We also know that `end` < the length of FILE.
> +        // If `end` < `start`, this will generate a compiler error.
> +        let slice = unsafe { core::slice::from_raw_parts(ptr, end - start) };
> +        // SAFETY: We know that the slice is valid UTF-8, because we checked
> +        // that FILE is ASCII (via is_ascii() above).
> +        unsafe { core::str::from_utf8_unchecked(slice) }
> +    }};
> +}
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> prerequisite-patch-id: 4bfda16a333b9f00a139050b7c6875922961a15d


