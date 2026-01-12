Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C7823ED6A;
	Mon, 12 Jan 2026 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234808; cv=fail; b=VysnncGxLwAMhld2KvpsNWtCtFPSiQvzC1FR4o21xsE7zKMSv54qKGIX9Pt8hUqMOjCXhaqgzh9fyVEtSZ4RHf5E/bIyXuI/cBKhcfVD7CnsUJ3HAFfMNUCMsUHZa3oA3H06v7Et2GsMaWQkocF8SQbow7XjAJggzntrmXEdh+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234808; c=relaxed/simple;
	bh=qx0kDlXED9boTaGL9R8f8qA4O7qzNyoDsAVpVfaerc0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B5wxUXWUccDGB5cG5LsO8pFDBxHnQToPVncF3ovTxrIFoivAjmPxf9V6bmJeX/v7cGNVYpE3wDMQMKFXO09WUUUHAcfFxQexPN3dkWIbghXEugqiJLMS0RSbT3aSE48/xeRO+jF/Qi2cZ/Ns+UwFAuTueB/wd4v/6qq0SGvkGUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QF78HHOM; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QF78HHOM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7PwSvkEv+gBNaSV58T4HenBwl4yjrihQ+ciFTCcMa+H1oz6IBwhPEvh+lPNKEXjGuc8cvORAIfYjiOEo46qZtI8bpvpRWW3RdtYwMJy4rjitS3tmFy7qVr3SVbbnV6D9OtQETMlgjlp2Gw/B0mLHNWIeHK2uWycHXDah2p63nx5QNX4uAX1Qe0egialuRHhodrA9G8uwnBcubbBQZFmpofjcdZJKalGcckiTdOMl/AriFvvoc2TrMDCTJAM6SvuYNE5nDeOe15U+5/rugIRNXTFsSZ2xPaKjAQ/xGqdKuYnsF/u7ok+Y8wZwPnHFFguS1dOADEPrBwgx9PyqRsH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrNwH20+iZ5kHLRhIVBR9/ZjbhKkANMhUxv/4qIYgfo=;
 b=FPY2AspiQRxH6dpYaV4PleRf861wAGsyGEqx+zt8o/fkqLQrbMJojBbLv1YXxYE+l4O0ok9uVQjPxgHIKZ0WumADjguxgNEALPy2lzjI07uvy5jW3+6+vbUpYcB9+01IekbUuu/dAcylvFsPhy3iCTpIDE+J3//7E7Ih9WZ/Kjym+bIsAW08Ku0XtK5soS6g7dM/BJoIlc3w5a+Hn6pKTuLOn0aMyrivnAn046taOSP1bL91s2hqgD+5Y12s6W8rWa2ql6hKaRAV8GmDV544JaBRvzHdFrwOnPENOQvNECBYrKeI85oNvnWqvjWb9ZHrgT4QpzSdOlRO487U0W50Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrNwH20+iZ5kHLRhIVBR9/ZjbhKkANMhUxv/4qIYgfo=;
 b=QF78HHOMnjdslu36V4h8VDUo7t842+5wzk0z3GTSHPR287QNyzewvwGwQdt8Fk3MD7HcCzkV7PjmZVbT0gZZUqYhqhpYg5+YDSReJosHuesBDzJoCS8UNZwMMSzImkBApH/3aJV8t085US73IG1FChdv+Zeu5kk8DG1gJ66aTh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5720.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 12 Jan
 2026 16:20:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:20:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 16:20:01 +0000
Message-Id: <DFMQX9VBSDHG.1LMPADI2L1YZ7@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 RESEND] rust: cpumask: rename methods of Cpumask for
 clarity and consistency
From: "Gary Guo" <gary@garyguo.net>
To: "Yilin Chen" <1479826151@qq.com>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
In-Reply-To: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
X-ClientProxiedBy: LO6P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: b84bf3ba-a957-42d6-9150-08de51f6708e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVVDb2l0NlhUcXRYS09mZGVYYzYzNEx6M3RFeGRXcFUwR0hJSktaQXJMNjdx?=
 =?utf-8?B?WXMvT1JobWpqdnZpVFhEUjlDcHczYW84aGxVQkxZVjIxQ3U5NWduNHRnZ1k4?=
 =?utf-8?B?VHdUaDVOekpNS0hXYW5KbVY3VmhNNEVscEM4dFphSW14SHFOeUF2dEdhV1ZY?=
 =?utf-8?B?Z3Y4cjBkMUZOVEwyZzdnM0sxbG9Yb3BMVkxUS29KTGNWN203ZHRnNldacUE2?=
 =?utf-8?B?aS94K3RvY0F6Z1VreDd1emZFdXFHdU9Mb3ZMTTNOVVc3Tm5zNmtiVGhid0F1?=
 =?utf-8?B?TWtCUldQdHBHcVJOSFdMVEV4eHhyUGFkZ0JmbERTeElBaCtIV0p5OVljb3dj?=
 =?utf-8?B?ZnJmWlZEdjBGdWZyMjdzZUJ1YTdFVVJZK2NZQXQxWC85bTc2alozRHp5U0Jv?=
 =?utf-8?B?RlVpL0ZOek9mNnk1dzcwTUFOYVlDTW40dDJZakRLKzcvcE5qV0d4ZndCZlNW?=
 =?utf-8?B?eEtVQjI0Uzk4ZlVhamhGR1JYSUxML0t2MWVJbkdrNmRtdzNWcGpDTVY4ZFI1?=
 =?utf-8?B?YjBWN1dBdEZBZ2w4bGh3a0t4ZmEvZStZeXMzelpUMmtkNERGKzZOckIzeTE4?=
 =?utf-8?B?dm9SdkpYeWRKMnE1UThOVFZXYTdXcjQvQkpoQ0x5ODFSTUhVc3k3T3NnU050?=
 =?utf-8?B?ZVhtYVYyV2xtZlF2R0c2NFZoT29laG93M1lVcnFlbmxQRmVUUmdtMitranBv?=
 =?utf-8?B?N1FVRjBhcVMyK3JNWDNaUmd3dE5lZ0YzK3lETnFUY1NFRndZbTd2S3hYK292?=
 =?utf-8?B?b0Iwa1VhSDVtY0QwRkJlN0dZTHNCQTNUbVhON1d6eFpsZEp4NVErUG9uaE91?=
 =?utf-8?B?dnpsSHZpMUIvNXJlbTZiUHRmb2Q2cktTY2NnMERIZENJNkpGRGxnNDhWRC9j?=
 =?utf-8?B?ZDErR05xTWttSjdrU3d1Q0J4dWhHUTF5aFM4TmJsdUFJYk43djJyb0NzNzVK?=
 =?utf-8?B?a2pGNGJuM2YwZHNVU1lwa2p2d2hUMmE1bDdqUGNJSXNtUTZIb0M3ZXVCWmZL?=
 =?utf-8?B?VnZTVWJWVk1aaXAvNmhrYkh3S05LbURhTlIzVVAyS2NRQzRYNmlGMTRNWWxo?=
 =?utf-8?B?WGp5Y0tDVG5LMHNHeDhGLzk1VW52Qk5yeFBaQW5aMTRXeTZXVUtwRW03c1Ny?=
 =?utf-8?B?OHlHNUtIRm9vUEVYbXBoSFZ5bHNqSFplSVpGSnhqNTNQN0tUZGkxanJhbEp3?=
 =?utf-8?B?SHRGRjVIMkNZSGo3WktpVWRUNVZtTE9LMDBoeldHYWVVaHJWMWRxSmRqSzRI?=
 =?utf-8?B?eUtnR3FXU1daeXlVYjJBSDRIMERIMk51R2hQb0l1cmk5cmlXVHVrd0NhL0JF?=
 =?utf-8?B?c1RLZkg2M21rOVYxbXZhbnFRZk01TmF1K3hreVdUb285QkdnYTBTYWdieHVZ?=
 =?utf-8?B?T2Fva0ZwaUJYQkowd3Zxc0xod3hJblR4SG03ckJKUnVXZ3orQWk5MGhaMzFV?=
 =?utf-8?B?TGZudCsvYSswVXNYSkNQRVlMNTAyQ01jR1FCZDgwMTdhUm9yd1QzVU9XNVhj?=
 =?utf-8?B?dmRJODZuR3IzNXpQWnhBS1RZcXlhTGthRmRDa3A2VGZtOEZWd0tvYy80RFRQ?=
 =?utf-8?B?dXEwRG9NQTUvNmtoR0VYKzNtSWRNQTRHZkp4MEV3MWhYQWtMYnBadTlXQ2NX?=
 =?utf-8?B?ZG00VkhocFhXbm5kQmF0TnhRaE5JQTJnd2pSMlk4RVlFcHpPSjNGSGFLbThX?=
 =?utf-8?B?WjNEcnJKeG9kd3d2K3NDQWp4YzFTNFJHTDZnUC9oMDNoeFdTbmVrdml3bmpW?=
 =?utf-8?B?a1RkT0JPVHp1NUtLaHIwQXlLaW50K05BWUNyeGIwOTBrYU94MFBLcFNhV09h?=
 =?utf-8?B?TzhETFRUS2RjZUVid3ZvNy9lMXdmcVhRUW54azBQZXZtVk8zc1QxYUJHQy81?=
 =?utf-8?B?aE9hMjBJYkhkMEdlRXJaK203ZUlTRlN1TWZDODJmanc2K0FvRUlMbStHdXJY?=
 =?utf-8?B?Um8zY3F1U2FWVDBsYkVmR1doNlV0SHBVVkNsQVNnbmJxQ1grUXRzREJJSU9q?=
 =?utf-8?B?aFU3dUJLamxnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdrWFhtenpsZlRmdm9vTHpLeVRSRnpZcHVadTRpMjBsMyt0Rk85djhGK1pm?=
 =?utf-8?B?bEtXcjM0WmFqMjdHeW9aZTdVU0NoVFU5NTFOU2YzREo3T2h1aEpBMDJ4NjBP?=
 =?utf-8?B?ZzNKTVUrZWZSWUo0dzBHU0RuZ3RITjhKcUpQam5IZklpazJWTFJLczFGa2Fn?=
 =?utf-8?B?UlNodmh6VjdsM3gzNzZHV2RXKzlzeWVlQk5DNnRkS1J6OXBLYlFsK1djRjB6?=
 =?utf-8?B?enc1NnJQbzB6ZUhIQ2p1VVMyREtCT0cvRU9uSjB5YjZqUVI5bFQyVFhDQ3Jo?=
 =?utf-8?B?aCsxbXRqYVNuTnVLcEpqOElSTE1KTXdkSXFDZFFFVjdoUExtWjBFdldRUStD?=
 =?utf-8?B?SzJCMThsQlZmK05DUURiaDJIZUFvWDFBeGF5RWZ0OFRGTXlhZXpjRFZaTEZa?=
 =?utf-8?B?Mm5ZdkZjZ1ZuZ2hBcmhDekFqQXBwZ1FYV2s2NzhZN0puNnBEckcycE0yRi9Z?=
 =?utf-8?B?RG02V1hUdXJaYmJ4a2xXd3J0TVlMMEx1TThnYTdndzR1bXFsVnN2UXFFZjJJ?=
 =?utf-8?B?VkhlMWU2WUp6NE0yZG9vZStyWVlpaytQc3VSdEV2YW1uRThpU1F5M2MveGd0?=
 =?utf-8?B?UGw1MDRTTkFjenhwV2lHUnlQQU4zNERIT013T1JRZ3hzOVpFMTEwME56OFlO?=
 =?utf-8?B?ODUwSjJRUVRBeTlSK1BNdUtqVldsbFIzSGVrckNvR3k5SUx4QTFBbEF0em9I?=
 =?utf-8?B?ZzJqSTF2SkdlWWRUbDZxVU04QXZHdVhaVTNVeXNrUWdqVi9xT1h6a2M3aXN5?=
 =?utf-8?B?Q1dUdEg0VVBINGdqcFBFVEQxVEE5eUlEZG9HSFQzeGpiSW5PM3cwbUdUd2FJ?=
 =?utf-8?B?Nk4xVk9pNnh1UC8xQkttaVdaMk1tMmFLaEtPQ1RGQnRWTnVXTXRsZUF5Rm1a?=
 =?utf-8?B?SjRCbUhmd1VyUE02TWJxTnd5ZWpIbFducDZjQzdpbENvUHhzM3dOOHkwd0Jo?=
 =?utf-8?B?OVVRUHNnM3FkYUx2S0h2dVR3NWFpaFhuYlRLaFZNdzlmZ2pNaXMrRG9KTE5B?=
 =?utf-8?B?NThwaDRYcndRUlQ1VnIzcWlYYk9Pd1I2aHJvUmpzTVQ5Z1U3a0hmWXo4dTZG?=
 =?utf-8?B?c3h3RE5QSS9venE4ZXRidUxJY0FzNG9LTnB2MVhrbEVDQlozaHpweVZmU1dI?=
 =?utf-8?B?MC9lVXJTVHg2MUlxaTY4Z21EUGs3Y3FudUFucXpWQ3Y3aWhyMmI3Z2YyL2Nz?=
 =?utf-8?B?SzBONUVmY1FlTVh5elhnM3cxMHptL0p5UnZtZ1pjNXFKbTlmbFFwU01xQWUz?=
 =?utf-8?B?TCs1TGdUMnlSUmZDb2tOSTRLN2JpZWNOQVNqQ3duUUFjNTRXYy9hVVgxQkdP?=
 =?utf-8?B?MGg3MXhwS3o1VURNR2FsUGhtWjdBS0lteCtxM1FlUHhUOG1LMVdZWFZORVBB?=
 =?utf-8?B?V2Y2dHR0WDg0TDUyTk1XT2xpaWdWSlhWNDNJYkJqeHVYeDdrMlBCVmw2d2Jw?=
 =?utf-8?B?bTlDNFBSNWlPMEtwek92OE4xbWRGc1dOSXN5MVJXOXRDMkZ1VzZMSHdUWmdU?=
 =?utf-8?B?K014dDB3dnpRVWdUdGVCRGpGa3J3THVpR2pWTkhUeU94dzhsaFhxblRjR2pM?=
 =?utf-8?B?bjVSNnJoNkNZT2M1cFlxM1ZXdnNHQklSa0NZZHhTakU0YXVyMzdFMjlrMjh4?=
 =?utf-8?B?M2czcVZOSGZXV3NFeXhJNnB0em40MUN1eGh0OXNsUU5vNktvMWJaYTFsdlhQ?=
 =?utf-8?B?VzBLK1JVVUpxOGYzYStDb3Jwc3gyOXcvdzZFNzd3cS9YOWZXbUhIeHNnS2dL?=
 =?utf-8?B?bk5kNytkeXRTVk8yYkl5MTJrdzZjYW42NE83djdEb1EwK2ZzWXllQndOZ2tv?=
 =?utf-8?B?TnFmL2FjQi9ydTkvd1pRZjFYWlNJK016SWpCa3RwVzRWVlMya0ZlbnpUYW1Z?=
 =?utf-8?B?RlhNdzgxdXdsVzdKeGNPUmI3aU41b2FtWHhxamIvWjVJNkg3ZlZEOXQvbjVw?=
 =?utf-8?B?cnkzSnVJcXhQNkM4UkNZYyt2bXdxSXdDQ0dWcjgzZncyNXdGSjI1dzkvaWlY?=
 =?utf-8?B?QkdUcVpJbXdSbVlFak1uOEttZ2ZURVJvWHNRYWlmbHhLdzErWXVwWWtHNmxy?=
 =?utf-8?B?QlRBNHdIZUZQd2RHVzhGTjlEbzhxQ3ZYdFBxQ2FEeDE4WkpQdnowKzBOSXp3?=
 =?utf-8?B?dHV6SGlpaTREZ2dzNEdoNFU1RmJlbVZBS2RuNXVzeUo2TnVIK1NkZXJSVmF3?=
 =?utf-8?B?eUNxSTdNRElVWVdXR2ZQcWlJK1NCVitydVF2a2dLeW1rQ0xRd3lYM0dscGFv?=
 =?utf-8?B?dHVMVVVPL0tTS3V4aktpc0Q4VGRWSGluWDJTZVY5WitoUm5nYW9YQ0VrTVU4?=
 =?utf-8?B?NnlTL2szRG1kZ05HK2RkUUMvMU04TFJCTmxNY3lPekc3eVh0djNBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b84bf3ba-a957-42d6-9150-08de51f6708e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:20:02.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chgrfEPR2k24rfYXGmWWwUqbIaBs9//P2yqPflRnic3EfHl8skySegQdJhHS7cH5a4XnplqSrQC8mU5FV8ywVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5720

On Mon Jan 12, 2026 at 8:00 AM GMT, Yilin Chen wrote:
> Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
> align with the established naming convention for constructing types
> from raw pointers in the kernel's Rust codebase.
>=20
> Signed-off-by: Yilin Chen <1479826151@qq.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3:
> - Use real name in signed-off-by line (Kari Argillander)
> - Add links to priveous patches:
> - Link to v2: https://lore.kernel.org/rust-for-linux/tencent_58EDE157C8C7=
00CFF88DA204B7492A113508@qq.com/
>=20
> Changes in v2:
> - Use real name in From line (Alice Ryhl)
> - Send this patch individually instead of bundling with others
> - Link to v1: https://lore.kernel.org/rust-for-linux/aUMUA_JWalyGQdAx@goo=
gle.com/#t
> ---
>  rust/kernel/cpumask.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

