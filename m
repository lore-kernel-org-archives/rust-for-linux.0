Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662530F548;
	Wed, 22 Jul 2026 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746234; cv=fail; b=IOXuId4l3Ult6Bf7+MIm9EAQ37NazSPsK4DIgvB7bO1Cs88oU1Q14AF+lI89ceXkYoR/ALyCc+r23t7bEMQk5JJF7VO9LlRmneEgZi21drCYRdZ9Ic7sF9JqFsLyjM2CqEHSeyrH0QsUCn+CUBZepViAHH8F2EJ86pGPGwECmDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746234; c=relaxed/simple;
	bh=zDlB2q0XiSRw+qTht8+XLEjP3jG2gXEfCtN1HBB8MtI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=io9C2CBnlx2dpasZvLWq2pKYzapasn17B5T8InfTmp+778xr9nZS/XqI0aezW20aCo80e1XklxYiXFRL4cCFa2roVJuHvn1Y2vT0zH9PIX4zTHnMkDr7iQ4Ezxb54zZ3iRu2UDqPjc3gV0cjlBkOLRL5klMFk2cCxDI5+aUiPgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xZ48s+IX; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xZ48s+IX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIUQcqfUyDGcKBrMKlcLrjbucJ135JU4qkfG16TWoymLuBIUvQ4UTSIc5osZ8KeEH6JefPz3O4g9KG3USIiE8v6azklupUgi+XWjiT9SQNpLgTbCLFwJjdPs4AGk5OvNf+DcrW7xtumEvbkfraJ9HOYUQ2bCuw7QKbsp1SS5YDnnj0I2W1ycM+rF3Y1aLhPXdvjNFfPs85CUIxSSYPMdHDCAV5bex5jL1KKjfJCam/G9zf7QvVDk3K5InXBkM2kv/nJiJJcJ4Ds2FMa1BQfX2MJaQQnG8Sp6bqrIvgrGJUSLTe6PhVHJd4UkLnIcWp0rJzpKrCZYhsANeGXaa3v1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUkb7sefszNzJT7355AIoC3HwS3BhkVKB4Z+gJBo1M0=;
 b=t9lgFD+T1hmmytYzCPWp5GytgKyTYQCXKPzs2OdGMd+gf2POvmVxEGF4qB3LyS+oLbyu+4Ww0GG5dZKmgNKK7edfl9SvUOONqhrc60DBhv4w0OM+ZjiIXOOL7m9har15IaFxUQmV5WsC9w6/L7DwpeVfOQOi7iLxOmgqq7uvF52zJM766KJKqmPndcaW9uQ3bRX2tfzybToHFaVk4Mrbe/oTeiy6T/pyVd63CcEM2cBMCkcA682il3rWjGu1HS+5wxn2dT6cDiYWTfaq9hRqMIikM11XOCM4+hADhBgYxI5lqvpwIp8TH0/jYzxTCQwE11bsq4SlnYNZtvaaC9oraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUkb7sefszNzJT7355AIoC3HwS3BhkVKB4Z+gJBo1M0=;
 b=xZ48s+IXyS3RKA3UkIr8MYOIqLZjzXcqZrkODmGGLk5YQB13OWVWgO9CiZf3B5PnpJd/j4gkSSnCWT4BeI695r17Rj1gG74tW+uycFE16vutLezZFRa/GZWwC6RqJQkso0gck+LxXLHlC/vuY6o+tD4WOpiZNbpDYcYd2mjHw9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:50:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:50:29 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/4] rust: pin-init: merge `__init` and `__pinned_init`
Date: Wed, 22 Jul 2026 19:50:14 +0100
Message-Id: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOYQYWoC/yWM0Q6CMBAEf4Xcs41Qo4i/YnxoyyJnpJq7YpoQ/
 l2qjzPZnYUUwlC6VAsJPqz8ihs0u4rC6OIdhvuNydb2VLfWmglSZORkDui787HpENqBtsNbMHD
 +xa63P+vsHwipFMrCO4Xx4mIYi3pynLOJyGk/OU0QWtcvE6kWMJIAAAA=
X-Change-ID: 20260722-merge-init-3ed98519ec7f
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784746228; l=3246;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=zDlB2q0XiSRw+qTht8+XLEjP3jG2gXEfCtN1HBB8MtI=;
 b=vBh6M5W1fS6UcR4Hn/bnkArOlMH62HqvEMQ9HeQbx3uCgo/EXyLuswZz0B9qQax/8l76W6Fw6
 oWlAMQDTY5rBVK3LMNUr8IH836RsGsBA6oFv1lquhAzGvt/UCSYPDr0
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: 757a9eb2-4162-4709-f52d-08dee82219bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|10067099003|921020|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zf0W1N98tYxreQPjyauLcg8InAOfZZ8LhIXnfEvyTL66HkSQVd4GyC89no/Epp6H+pNd/xBxKQGmSqcqA6xXrXLdJLzNUqMRUWymCAWjXqc/17AugLVqgZBqDjIxRVVROrEsQcWcygQzElPlIrkC2piKF59AdtuIFnWN7wl86Fvq+tvaJC4y6vxbQ22LffhItrMdFBc7jQTATWmk2DZxD//221S8Bg7fLrmxDDq4te/TZxetmEiTNyGUE/buCMuUhGS19D/2h9Y8TH10/OclVTg3AkBLUPU10kkD2a3Qgj8Cjw1lzz7o/1Dud/cy0DHLAzRb1UnigUFtmw8DDY5951ukYsCX+U9Xs8t9YTCKW6XL0I6v8gDr/iWtDZuMLOrOl8zaf2RlXCApyKmTXhn8Z/llEytZSGG1gwpUHiHh3zAmfevZvK59+eLF7vwIcPL0X1OOGl66456E7ykFOqRhrb0xzYoW+w+2uzDcJ89gHdmQ/jF9IeSHpb99WuNsJaytqlw+oMH3YOyGvq9CuK1455WmWCaeYWZCxTLGb4/KHLFhlC06u8kJSqdRp9XG+cIjfKJXD3NSFeiFkUooQlbYlN7Ra3FGeXsaFjdPfU8E1hYU3Zrxmp8Od2jwSUl/q8yaaWArIcmEW4u2bLE6Q3x+bXfR+ZCx2O36kUvVTso9UfOSQ1zvTbPvseDzCxPc5lrPWpRPkSlmGUb7qEei8n4Lxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(10067099003)(921020)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTFSUzQ3TG9yTlh3dWVzN0xuODA5RjB0V2tjbHVFUFZsZWlsY1FuYXA2UW51?=
 =?utf-8?B?MFFFVkZNM2ZjR2tWY1RnZXQ3KzBqOHU2NHBROGFJekV1TVRRS3IxV1ZXaFVJ?=
 =?utf-8?B?MFJXNHRnVEtnNFp2RWVUMWNhaWNvVFlyTC9CalFMZmFUZldnZkNEU3ZCejhD?=
 =?utf-8?B?Z1BSTmhSTGxWcmZLN1VRU29JOU9FVkN6amJhTmQwTE9ZVzdOajRqaHF2dzJM?=
 =?utf-8?B?ZXlPV2c2V29yaG9OK0x6YmNvUnlEclRFRWJnY05JQmZReFZJdjA0cXNrc2Ny?=
 =?utf-8?B?VDk2eUFLN0tzZ2YzMmE2MVBFVzNDZDA5cys1NnlXeDlsSm92SEhZbmZQZGxS?=
 =?utf-8?B?WHJGYno3NFFlQlpYaUpnL3BaR3FkMDBPNzBnZVgzSDNYMnVDS2FQWi9Wbksr?=
 =?utf-8?B?R0dtOTJ1ejVjN3ZLQVMwQ01Zc3NYbjFRZEZEWGg1NU40U2svVjAvZCtzbnJa?=
 =?utf-8?B?dWh0eURNK3BhelFxd1ZKcVJJazJxUnl4aXFQT2xRN2Z1aFJIQnQvYjVwTWNx?=
 =?utf-8?B?WWVkWEh1ZHlFZFZwT09TK08vaklXYTIvY01uelZOdEpmUXYxWGZPTGJ2MTJV?=
 =?utf-8?B?NnpHeXRoM0VkSEE5RzVDdUpPbDFlbG1QMW96V3ZlcDB0ejZWY3hXSmRMZ1NR?=
 =?utf-8?B?VEZ1TkVRTGZDRmdJTlhoRVlGUFJXNCtxemRnWEYzSFFqS0VodjFVdVlxZXN5?=
 =?utf-8?B?Nm9Wa0xrdU9pNHBRYUltRGt5YmlSTUdTMkVmN2RDS1lsd2FIOUc1bUNyNzJH?=
 =?utf-8?B?NElQOE9rZWsxeXB5cjRzSTdmM0puNUxiYkRMc0c1akJCN0VSZVpRck9wb0xL?=
 =?utf-8?B?QS8xdkNJeVV4ZHQ5QW5XNHRFTlBPQ2pCeU5GSW1Ed2h0QlJYa3RpWXQyMUlj?=
 =?utf-8?B?ek9aQ2RaTEF5bmVOcHNpeVhNY0w0cTRSajNDZk5lWWxWYVdnLzc4aGlaQXEx?=
 =?utf-8?B?ZGhTKzZGS0d5R2tBUlFualE5ZE1OSUhmL2xLK1RQQmpmdzVWclhHMmh6UGZ1?=
 =?utf-8?B?STd3WWxET0N5UmZ2eTVmZlRBM0gwMzljNTdGaWxOVkZ2Y2RQd3dpUmk0dHBN?=
 =?utf-8?B?RUY3KzVuWm5IanhaRHMvVTFORk1YMVp6WVhta1hla0tMUExrM3Z3NS9xMWg3?=
 =?utf-8?B?UDlzRWpNT296Vjl2R0NGTFBMeHlIU09XOWtjVG1sVlVITEVFUktJUXV2RGdN?=
 =?utf-8?B?di9LSXBacDBXNDZINHAxdnU0UDRFM24wMVJNN21QcytCUTlxU0IrVnVJT2RW?=
 =?utf-8?B?SG91OVNEMkx5SmZXNmJkM1ZwTTNVUXlMNnN4K3EyVGZGWVk1Y3F4VUx6Qkdy?=
 =?utf-8?B?a2M1a2dycWZpSzN2ekkybExYbFVHYVhQdGVUWmtGSTZLSXdnM2ZVK0N1eVJV?=
 =?utf-8?B?VktpSURVNHRJYTF1QlVpd3d5TmI2RExBN1BEUFNscCtxcHBCZExrVURRdDlO?=
 =?utf-8?B?RlM2M0hsYVdGbDJNdHdYdkpkVkFya2RIa2pMdzBESnhmbjdERUpwV0V4NzN3?=
 =?utf-8?B?Q1VzL1ZhcjBKNzNVOXd4MGlPOFRqYm1LVWlKTWpxOUhIeWlzR3JKdm90S2Fp?=
 =?utf-8?B?d3lvU0xHci9oMzdwQ28xSHpFY3ZwbGxWYVRyZlNCR2ZrY1BITkhRTVRRMVpr?=
 =?utf-8?B?N1pNMkY0YXZkaUxMZ1hTNm9rZGNuRnM4WWNRekpEY2NYSXduclpiNDdUOFpX?=
 =?utf-8?B?cjllTHF5Y1N4MlEvWitXOFplQmJ1Mi92ZXNsWEhwY2FiYnZWNXJ1VjNFMysz?=
 =?utf-8?B?Nlo3WVFEL3Y3aVg0R2ppSUtOdmtkSXo5Z0dGd29tamhoS0IxY3pZZWFpTTNK?=
 =?utf-8?B?NkQwZ2EvQjAvTFUwSVNKQkZwcHhLZCtTYkNQYTRUZWhsRUphNjhWTGZ5QkRw?=
 =?utf-8?B?c3JHR0RyUTNZdElUUTVZV3ZqZFNlV1RaS3NmaEE4ZmRrb05PcE9WTm1Ebmg5?=
 =?utf-8?B?RmU2NS9UL08wZVFtMTRrdGZ5WDRLN2dBUmpqWEJjSlVOYStwUzhCb2p3K0pv?=
 =?utf-8?B?R1ZEY09QL0FYT3Rkc016YzhxYSt0K2J4anBiTjF0aUNNOHd6djAraGxxOFgz?=
 =?utf-8?B?RmpHRzdDUXAwV01jVlllZjRidmdrVER1WWpYZWd6d1Bma09kSjFqdW5qUW5O?=
 =?utf-8?B?Z2xVdFFua3cyRmkxUldRRzBhMFZ0VG9TazRNakpqM3VMRkIvVVZqVlRxUU1I?=
 =?utf-8?B?allHUklONmNNNDJwZkZFOUZqcmVqdzh2enRkV0I2NUNDYmlaZWtKV0ZRb2Mx?=
 =?utf-8?B?V1BvOEM2eEVrdDI0eTg0bnMzTWR4YTg1a1JaOXhtbnJRcUpvR1JiWEdmcTNO?=
 =?utf-8?B?OWhlOW5MMWZKRW00WDZPVE5zM0NaN0F2SnREemNvNjZLWUs2T1Mzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 757a9eb2-4162-4709-f52d-08dee82219bb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:50:29.2543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tajTG/yQu5OwzIh6EBwmzKNQiaVHWwi389CHk3ATVKa2Ff7gNkJUaPPnkccHjImkHq46WlbDQashYa20fKlIaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

Currently we have `PinInit::__pinned_init` and `Init::__init` which has
slightly different safety requirement but are required to do the same
thing. Instead of having to duplicate impl everywhere, it's simpler to just
use `Init` as a marker trait that cancels out the pinning requirement on
`PinInit::__pinned_init`. This also simplifies code (and shorten the symbol
name) so `__init` can always be used.

Note that to pull off this change it needs a stage approach. The plan is:
* Patch 1 (the `__pinned_init` and `__init` merge) is to be taken this
  cycle through pin-init tree; this preserves the `__pinned_init` method as
  an alias for compatibility.
* Patch 2 can be taken via driver-core this cycle.
* Patch 3 (tree-wide changes) to be taken next cycle. I can split this
  further up next cycle so this can be routed via various subsystems.
* Patch 4 (removal of `__pinned_init`) is to be taken via pin-init two
  cycles after.

---
This might be an opportunity to rethink about the API. IIRC we use `__init`
initially to avoid conflicts because we have the blanket impl on `T` and
`Result<T, E>`.

Maybe we should get rid of the underscores and name it something more
proper, like `init_ptr`, or maybe add an extension trait to raw pointers
type so you can do

    unsafe { raw_ptr.init(something_that_impls_pin_init) }

?

To: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Onur Özkan <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Gary Guo <gary@garyguo.net>

---
Gary Guo (4):
      rust: pin-init: merge `__pinned_init` and `__init`
      rust: devres: use `cast_pin_init` instead of manual reimplementation
      rust: treewide: replace `__pinned_init` with `__init`
      rust: pin-init: remove `__pinned_init` method for `cfg(kernel)`

 rust/kernel/alloc/kbox.rs             |   6 +-
 rust/kernel/devres.rs                 |   6 +-
 rust/kernel/drm/device.rs             |   2 +-
 rust/kernel/drm/gpuvm/va.rs           |   2 +-
 rust/kernel/drm/gpuvm/vm_bo.rs        |   2 +-
 rust/kernel/init.rs                   |  10 +--
 rust/kernel/pwm.rs                    |   2 +-
 rust/kernel/sync/arc.rs               |   4 +-
 rust/kernel/types.rs                  |   2 +-
 rust/macros/module.rs                 |   2 +-
 rust/pin-init/examples/mutex.rs       |   2 +-
 rust/pin-init/examples/static_init.rs |   9 +--
 rust/pin-init/src/__internal.rs       |   8 +-
 rust/pin-init/src/alloc.rs            |   6 +-
 rust/pin-init/src/lib.rs              | 147 ++++++++++++++--------------------
 15 files changed, 85 insertions(+), 125 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260722-merge-init-3ed98519ec7f

Best regards,
--  
Gary Guo <gary@garyguo.net>

