Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14C364E97;
	Fri,  9 Jan 2026 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976958; cv=fail; b=ocpH7Jvasn6Vv2MBLGFJk2ESI4viFdyHOzvQCU0yEQhTiHxw9icN02TItKFqZa2iJtlRb8oLgG/EdS3JE2Xw68aPvpJCDTE3EpzetkcJYj0U78No2YGtFNFmmBZxRfOK0NekL3o7kkk+UCxjn8Fnd0s2iKwWAVRZFlGU4tt+7/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976958; c=relaxed/simple;
	bh=drkOlNkeR+GdLUzDpSn+e3jWYrMDRzqDBqhQq6UBbts=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SS11K1ZMunamucKs0C+h9X293EE1CjhZzEQMcme/j3rrvNOuZVlYbmxjyan5IHn5zw0UcoyosR7TncTtFxpTDsmXOddWRyLnW8NSDyu5Ui8srLpQDfOlNsBg1LgttWisYqVI0jNImf7qZ4QWtCsp+Tjtmy4R2U3T6wZ3xPLEuos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hiLYKQ32; arc=fail smtp.client-ip=52.101.196.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hiLYKQ32"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6G61AOVu87B7GNwqPf542MzR3tep0jfp5zLuBeVS3O7ZvQ7oJn3x+qruZTm0e+a69kAxXv39XPgSKCVEGijO6e1ZDjQBJikY5MzaSl/YulR4xFvHt0XvH/BTC/6lWT1c63CmWTiGyBoExAgityXP2hF4hZKlbEuNxlJwi/2EuaiZssyldbtSbCc7udDVsir9uENsxStdgQranritJIbKW1GMbE3Mmd20xMLEun+s/pO2rnhQKamVLy0SYbpEYuP7p+ccbx6oOrNTsmR5LUG7KrO2mjrPkq8ax77YiAcTX/IPSuuYJHFXK9lCoGm6U8VNRAReAkU3O4S7bLDv4q7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqs0LR8+i1TFr9du5BeoeZLZOtsKQmdGESvExfxQZg8=;
 b=y6+w2BQlPID0ZZCLAFt87zx5dQipG2rQF25/CG6lRuIFzkEaAzSk7Pxy5wiH8OOmItPGcWfltxMRRQoJdtRnGfhMF+W2Y6zwETWwiTbcvs0brdpkhdSGdI2IpdCG0wUiWy01M/OrUknkWJFiSrAI/r84s5SDj7Mx0Ah07Jk2TQLhvRHwW7xj4PLucMA/1sZLwx01OYQ9a11AaSyRcJUnQG6W1A3OVhOlbxI9N5BnXQAmMXU6GSfnjaeQ5jdLkfES+0uYunx26AdY6oe76V1wH/Mmo2uDCpzeCT5SdyDrMGRPV55ORkb5RzxmaBjVC/XYB77qWwUBr8XgzWK1Bbjq/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqs0LR8+i1TFr9du5BeoeZLZOtsKQmdGESvExfxQZg8=;
 b=hiLYKQ324IZYQiHfJ4Fg7ebtCFGCkyZpF5+kiI01AVBba7FfwmZJAqjY3FZ/Jd3imqs0O0ND3tmiLZnDYoKUi8341WBXFViRVlDTkD1MxsGQ9qf/UO8AKmSCiHAE2PQywvrJMLknaA7BdvuYbjNams0W5l6WB4qCONE0e2aFrWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6409.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 16:42:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:42:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 16:42:29 +0000
Message-Id: <DFK7ITVQ97RL.2SZ2ANDIQ39H3@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/12] rust: pin-init: rewrite the `#[pinned_drop]`
 attribute macro using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-6-lossin@kernel.org>
 <DFK1RR7HGFKN.XM2V8C9D0PR1@garyguo.net>
 <DFK62LHP35VZ.2HKVXST2SEI39@kernel.org>
In-Reply-To: <DFK62LHP35VZ.2HKVXST2SEI39@kernel.org>
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e83c26d-824c-4baf-6432-08de4f9e1450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkJxRkUxSHdoZkhkdFh0eFNtOUNkd3JCdmw5TGJNem5LbFhtQm15OXIveUll?=
 =?utf-8?B?RGg5QTFabFJMNTJCUkFKaGdHTmpXK1hxaFI4aER4MmZCZzJPN3VwN1FhRDg2?=
 =?utf-8?B?eG5aNE84aFdvdk1Qd3cydXVnYlhDbWYwVXh6M2wydmtKbmRLQ2M1QlBydWk5?=
 =?utf-8?B?QUhZS0ZUZ2p1M2hSa1lNRDltNzFqSGthSDFqTW40RjZVU09xL2pTSU1UWnpt?=
 =?utf-8?B?SXJYZmhuN1dlVXBMbk5McFp5WlRsR24xZVNwcEMyWEgxUlVxQ2xrQzVyeTNN?=
 =?utf-8?B?VkQwanpDbmk5ZUNCcXRSZTZROW9EZHNHS0N6NGU4RzJobmY4SzVHZUQvYTNu?=
 =?utf-8?B?a3k0ZjVOUTVobmZEYWx3Ung5TkhQQlRwZXlocGgwR2RwK1RXb1Y0UGRvb1h3?=
 =?utf-8?B?eEVlOENjOHhqeGRxamYvK0VsbjF1Q0Yyb3M5N24zaTkweFUrcHpBZmVOYzJs?=
 =?utf-8?B?NHdEYzFPYWlVenpYV3c2bTduWE13WlBZUk5XL1FXNzBod2xWb1Z4ZTdjd1Uv?=
 =?utf-8?B?aFZIVGJtMWNkZDFYRG9lZlY0V1NtMDVkdmUrTkt5VXpxYVpybi9CdzlZemZw?=
 =?utf-8?B?NElCL3VQOWJWb3NPN0V6NVhGajlNNFBLV094MXFST1BMZDlOQ3ptZ3J6USta?=
 =?utf-8?B?YlBKdWNpMVhyVDJCMUxsWUhDMEV2U3NXTlRuSStQZEhjZG1KYXNPUkVsZ09C?=
 =?utf-8?B?TnJHVTVWQWhYL0xJYzFLcWpESHM1akdHeUs0a24rckFkemxyS2p3Z3pTMFgy?=
 =?utf-8?B?US90emVrS3VUdExuRndMeHNacFo1TXUwaERaMnZIVTJoYVkvKzJVa2xxM25M?=
 =?utf-8?B?aWczSEZUaGI5bWl3bGxrZ08xZ0xJN3BJZkNYbm14RmZTV3NuZTJzL09xcVhF?=
 =?utf-8?B?dmNGV1lsREVhK1VoQ0lNVnZkUUNEWjJ0QkhHY2NNQy9MeERvWnl3by91TTF3?=
 =?utf-8?B?UzR1YlJUWTl6d01CS0FFTVNBaWdEZlAvUnp0NXBpOUFLSGRtbTlZM1BMb2xO?=
 =?utf-8?B?bTl3RVJRMzRBN25maFZGRmhaQzNtWTJWQ0dsSG51RVFTS1hGL01xL1ZjQ3Ix?=
 =?utf-8?B?anI2cFdmbGxBTW5vTXRtcWdKdnZsVE1CTkZCNWFETzBBTmtKeXoxeTBWODJz?=
 =?utf-8?B?WkYyZDJzV2NSWkF5Ym40ZXNXMDYxTUNUWENjK29UYmpLdzB2U3VWaXFLczZM?=
 =?utf-8?B?MDk3M1o4aGNQQXhHWWlwUUVmbGlFR3A0Qk05MHAvU2t2Qy90YTRRRThzcTMz?=
 =?utf-8?B?NnpUOVNKK0F1TkFLZzBsU3BWUVRxK2tNcVVTSWJJblcrWldveE5JcHpTT0Ns?=
 =?utf-8?B?RDhUd21CM1pxMWdWV3VwTEVzZi82T3o3Z3NyY3EvUjRiS1NyanNURDRkOEl1?=
 =?utf-8?B?MVY5bXg2Q0o4NXJBdDJKWDFDVGRLQWVqUVk4N2FsZXQ1M1pzaW95MnBHbHNE?=
 =?utf-8?B?R3l2LzlvbGZvMUdSRHJSQUs0V3diYmp6b25oZjMrTnhsUnljNzE4TUdTdHA3?=
 =?utf-8?B?K1VScWhmZFE3TmdvRzJnQk1OSFJ1dm1PbnlDclZkQkxDWXdvb1c2SmlYeEFp?=
 =?utf-8?B?VkhUNWZmZFZCdkkrRWxFdXVJY1BMTjRjaFVCNktldFAvaGRPcVY4OWJNU2Fr?=
 =?utf-8?B?QzZBWjVuOTNMdi93cGM3Q3JlYnJsYlMrTjRUbVJNNmsvWmc5ZDhzZHBabTlu?=
 =?utf-8?B?WlIvMDVKWXF4YUxhbS9qQnNmaThHNGVaYzFPdlYwV215L3BtaE1rd1hVNHpL?=
 =?utf-8?B?bzRyMmp0ZlpzQkdTelg5bm96VTVmZUZ4MmhWbVNNY3kxWHpNQVFWcU9aT3FN?=
 =?utf-8?B?d25xclRlRnd2TkE0d3pESFJOS2U3N3RGdWVScE5BM2QvRlRpNzgwY3kvTXU2?=
 =?utf-8?B?aDRYWUl2akJPeUJSdWZ5azZiaSt0MWJVZkNsRUduemxrRjVPekloNzl0citm?=
 =?utf-8?B?K1dnYkJCWVdwNTk5TjZYZjZBbFcwaTV1b3VxNzVaYnpUK25XbUFHQTVPby9s?=
 =?utf-8?Q?tKeYwTVTjNmKOyQWgkO4Mi+wp4Fqk4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjNNMmk2aTdqRFExM1JNbGdoNjBjeWJlaStiSDdSMDRzU3hqR1ZzYjhzNUN1?=
 =?utf-8?B?M3lTd1RpTVdPRm1xdjFmRWNKVWphVVU0T01JVlZJSlpIMGc3aE0wK2Y3MHZH?=
 =?utf-8?B?bnBhUEZjRyt2QVlHbk9aOVgzaFE3N0xPZUlqMy9RamkrYU9tL2NmdlJXQlFI?=
 =?utf-8?B?aTJTN0NUeXN0V1lqS3JnMmJjOWp1WGFwRS9FTWlOVEFUWFRzYzFuV2w3ZTBR?=
 =?utf-8?B?RDNUS0VZYWFLazNVYlkvZG95b1V6US9GVlIydUNZNkVZVk9MQktPUUE0TnBC?=
 =?utf-8?B?QWx6ZnQ4Z2p3UlJERUcxTTNyWGJYRXA4NUVkVEs2dWcxWVFDbHM5THNlNldP?=
 =?utf-8?B?T3YvTFF5a3NWcG9LY3VEdkl5NGJBcGNLYnh6MEh3c3JRSVAyai8zdVZBUlZV?=
 =?utf-8?B?bE43RU1WSTdxNGNyRnZlNHpZN1gwbHFVRGQwSnlaMFMra3M0TVFtcW1Hd3JI?=
 =?utf-8?B?SUk2R256MVp6ZzU4amU2SW5wWmtMV3d1WEpDTlBvbjAvYzdTYldyTlZOYjUv?=
 =?utf-8?B?TjhOeTRhRFhzVGZHZFlhYkZZejdLUWNEd2NmZEU4N1g4bVdmcjNCQ3M1SERT?=
 =?utf-8?B?MVVlNHp1c25pVUIyOExJWVpEeU52YTNZSGZlOGsxRWlLMEFYektsWk41SEtu?=
 =?utf-8?B?anZzTzMzbW1CNzB1aU81bENIOXY3WEJOM2lGK1RnZFFROFJxczd2dll2bFZ5?=
 =?utf-8?B?Q1Rtbjc2dkZYQmtpMjB5OFVQanVYaFlzWlRXdEJOUVB6bThhMUpPVGcwWFZG?=
 =?utf-8?B?eXBIclpaaFZxaXpsbVBxdHlnN0hDZThxRkFUaGs5S2t6c3pyUUJrV1BIZHls?=
 =?utf-8?B?T3RibWhrY0s0MjBvQ2NvSW43Y3I3RFh5TG5WZnlGZEY3RENLYStNUFVzM3ZR?=
 =?utf-8?B?d2ZwaXRYQXRUT1RvZlQ4QTkzZ3NPOEFVS2JHV21IVUZOejlQanR0dmIrTXlx?=
 =?utf-8?B?RUFaNTFhZFJZdHRmMStZQlZIWERYRGhXeDNCdkVoaGJyaGFFNEpBSjNGbFYv?=
 =?utf-8?B?TDlZZ2MzQXRjWEF0S0tuVHFtMVRLSWk4ZFRmVysyQk5DcVdxOURjMEF5Unlx?=
 =?utf-8?B?djk1U2JrSjRSOEVQb1ZYR3pMQTZia1dibGxuTHVoRThrLzUvWkg3T05odm9u?=
 =?utf-8?B?VHN4WXpkeEpyeEdpTm9HLzFpbVVJaUx3RVh5U3pEcUVpYUlnQmJnTXo2a1Jy?=
 =?utf-8?B?QkFrOCtmRWFNSmxjVExrUVI1bWh5aXJnVnBkdDJXQ0g1NkptNFIrZDRHcTAx?=
 =?utf-8?B?emQwcy81VVZKU3hLOXdQbUw2YS9vMHd6cmVFVkhCV3A1ZE9uQzlDZTlVTUtJ?=
 =?utf-8?B?bUV4UUh1NDFPZytZcWpYd2ZJcDN1N2dJL2JKVzlUTnYxam40MjR4K2laZXZT?=
 =?utf-8?B?RXJvZndES1ZrS3dzYXh3aVJpTDV5WjhINWk5Tks1YlVKWTBNVk1zUStHcVVl?=
 =?utf-8?B?WGdHYjdkR0xjdW9CT2dqVXhUQUkxaFpVZzAxVkJwVzJMUFlUSU1uKy9zMHVI?=
 =?utf-8?B?MjYvbnlsSGJETHc0dkxMTUVMckRuR1M5bHJTajNDMklvTjh2OWJoZG1vV2d0?=
 =?utf-8?B?MjMyN1RjSXlSK1AzZkRxY2p1SUwzZGptWDVMQU1wMGU5UFdFK0hiNFJPMURK?=
 =?utf-8?B?WUVVc1VuZ2xUUXJHTUVmNTBMOUxkVDUxellSbm1qdjRmNjFOSDFWMERZbklJ?=
 =?utf-8?B?WUtkd3BuV2IrdkIrREVvL0FON0pGTm9Nek9yREo4NUw0K0N5VVp1VUFYNmRo?=
 =?utf-8?B?VnArZjM4aGVzQk9DUGxkTHI1QWhoSUxLTXJ0UnZYSXl2cjJWaUJOQ0FIeWZW?=
 =?utf-8?B?ajMvY3ZBVHJ5Nk9FaWhiL0xRa1IvOXlIcExDWEdVR2tmaFhibFNHRWhBKzBT?=
 =?utf-8?B?QVNITDgyRVhIS2N2aURZTXlVT3d5NCt0ZkVvNzZrZ05iWTFqdm94WU1udTRm?=
 =?utf-8?B?cmNoMDB4bFZudmdiWlVCcUc2c1pqTDBtRFR2Y3ZJVjF0RUE2KzFtWFFIZFhr?=
 =?utf-8?B?UFIrYllrMU1oN0IwekpJU2ZwVVRlV1JCUHhPazZwbkI4RGJPVjZBa1BWRnR5?=
 =?utf-8?B?bzV0S1AxSnR4ZXZNVWpGdWhxcG14aXphQ0I3WFRhKytkS1dsZERkMXAzZ2Fj?=
 =?utf-8?B?OGpHQlRKQklqZTl0clJUbkNXYnFaWWttbmo2eDRSQXdqVEoxVUxWbXU0dUdl?=
 =?utf-8?B?RmgyM3l4UDBUTCtyNWpGMDJyTmNyYlNTVFp1blZvNEdnVVFGSWxyMWZmSGV5?=
 =?utf-8?B?ankyU3Fkb2l0aGppU29MM3ZvQnF5MmEySVh0QXRraUhYaTRsWWthQWJnUm1G?=
 =?utf-8?B?K0J4d0tNTlRnK3JXWnFFbjRPNkNtSjNNckJMTzh3eFRicUM5MWw2dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e83c26d-824c-4baf-6432-08de4f9e1450
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:42:29.8020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8/5mtYGdoROAC1bSQ8JBbWOtwKv0neUlyQ9PvhkrVuhtqzyFA7zWwdIHcsVK16UhgvOZA6MFgeZp09iL9Qe1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6409

On Fri Jan 9, 2026 at 3:34 PM GMT, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 1:12 PM CET, Gary Guo wrote:
>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>> diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/=
internal/src/pinned_drop.rs
>>> index cf8cd1c42984..4df2cb9959fb 100644
>>> --- a/rust/pin-init/internal/src/pinned_drop.rs
>>> +++ b/rust/pin-init/internal/src/pinned_drop.rs
>>> @@ -1,49 +1,56 @@
>>>  // SPDX-License-Identifier: Apache-2.0 OR MIT
>>> =20
>>> -use proc_macro2::{TokenStream, TokenTree};
>>> -use quote::quote;
>>> +use proc_macro2::TokenStream;
>>> +use quote::{quote, quote_spanned};
>>> +use syn::{parse::Nothing, parse_quote, spanned::Spanned, ImplItem, Ite=
mImpl, Token};
>>> =20
>>> -pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> T=
okenStream {
>>> -    let mut toks =3D input.into_iter().collect::<Vec<_>>();
>>> -    assert!(!toks.is_empty());
>>> -    // Ensure that we have an `impl` item.
>>> -    assert!(matches!(&toks[0], TokenTree::Ident(i) if i =3D=3D "impl")=
);
>>> -    // Ensure that we are implementing `PinnedDrop`.
>>> -    let mut nesting: usize =3D 0;
>>> -    let mut pinned_drop_idx =3D None;
>>> -    for (i, tt) in toks.iter().enumerate() {
>>> -        match tt {
>>> -            TokenTree::Punct(p) if p.as_char() =3D=3D '<' =3D> {
>>> -                nesting +=3D 1;
>>> +pub(crate) fn pinned_drop(_args: Nothing, mut input: ItemImpl) -> Toke=
nStream {
>>> +    let mut errors =3D vec![];
>>
>> Any reason to not make this `Vec<Error>` and use `syn::Error::combine`?
>
> Is there a way to have an "empty" error? I dislike using `Option<Error>`
> here... If not I'll just create my own helper type instead.

Why do you need `empty` error?

You can turn a `Vec<Error>` into errors by

    errors.into_iter().reduce(|mut acc, e| { acc.combine(e); acc })

If you want helpers, this would be my preferred approach (similar to how ru=
stc
handles things):

    struct DiagCtxt {
        errors: Vec<Error>,
    }

    struct ErrorGuaranteed;

    impl DiagCtxt {
        fn emit(err: Error) -> ErrorGuaranteed {
            self.errors.push(err);
            ErrorGuaranteed
        }

        fn with<R: ToTokens>(f: impl FnOnce(&mut DiagCtxt) -> Result<T, Err=
orGuaranteed>) -> TokenStream {
            let mut dcx =3D DiagCtxt { errors: Vec::new() };
            let mut result =3D match f(&mut dcx) {
                Ok(r) =3D> r.into_token_stream(),
                Err(_) =3D> quote!(),
            };
            for err in dcx.errors {
                result.extend(err.into_token_stream());
            }
            result
        }
    }

(untested)

and now you can

    DiagCtxt::with(|dcx| generate_xxx(dcx));

    // Non-fatal error
    dcx.emit(...)

    // Fatal-error
    Err(dcx.emit(...))?

Best,
Gary

>
> Cheers,
> Benno
>
>>> +    if let Some(unsafety) =3D input.unsafety {
>>> +        errors.push(quote_spanned! {unsafety.span=3D>
>>> +            ::core::compile_error!("implementing `PinnedDrop` is safe"=
);
>>> +        });
>>> +    }
>>> +    input.unsafety =3D Some(Token![unsafe](input.impl_token.span));
>>> +    match &mut input.trait_ {
>>> +        Some((not, path, _for)) =3D> {
>>> +            if let Some(not) =3D not {
>>> +                errors.push(quote_spanned! {not.span=3D>
>>> +                    ::core::compile_error!("cannot implement `!PinnedD=
rop`");
>>> +                });

