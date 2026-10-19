Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422431;
	b=0X/CAOAHIwDVc2NFxGroXySIJjARpjCboJ3jLY6Pb5GCjVMcPp3lfouWErjwMjTM2coG
	 YuCCV/o+CRJOGrJEknU6F1HnutLr0ZhnK5gilhvJXeYet3KBlaWljfyRN1uDqVOOJq3hC
	 jFX61ejYjdtWJb6Jm6fDVQ73J2fHCR/j3e3MICEd0s+XqQ0NkUImtDHgmfW1Jw3zXUDUN
	 /1DnQ5cSJkog+k/ZL7Co/D35WlkvESiYp2fnolDHXbNC7yAOSR0S38Go2jFXznPWVV+UT
	 DqTH2Ae0WdBHCujaJaMztkQ7KweOTvh7o8XD5Mxkn6vyhNEiaLo7qModJvadGWieHlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422431;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=580nZED+cryxHs8vb1YRjeRMebj3EeRG3YzmS6lGTRY=;
	b=ErahnQyRMY2vhXyCjX4hK8US+WCfhEU9/txJ8ncQ4akG+mWH0l60n2IlN+Yp4WE53to7
	 D9redeURc+3QPNeXUm1SCh4PNfoWdgXZLRGn7YRfPZRfCOplt0y8iYXHTZPP0hhN+yKRH
	 8mfGpVhEBjiUVB7RFf2oEZopagpDIV2P3ES8jhFP2F9rkFE+l7jGWXQJjmIEUqomHjsu5
	 jA0lIT2ngXDKGFR6HTrtQRR8CCBDjQf2xpnS60eo9F5yMphTn9iXtfm3J193VuGlrk3xD
	 oAokP+aMeHTtVLi/pZCfuzxxVIunJxvMlnOq/cWuB/emXEI0pZj92MnVv5tFYjChaLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g9lRo4GM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.60
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC3608341A;
	Mon, 19 Oct 2026 15:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FC3608341A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g9lRo4GM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKX5ny3PsB5Opv+p+taBUwWccQITR97S3t1ia3QZEHO8XtbZuKe+2tugSCel2iKFGqd+/SpAzwpELXXGyJBDbNlHNTZWBycFE3RLjTcKIjat/H3h3N1NYGBFB+fhdt/AdMZFwG50/YoehnKwPM3SG4sHFRpmc5fUY8K6GzRnpa8hKPCYvM2k63tB7kCgMu9Nom+QYM6I9D1qIdnYCt6ad8wQuZVnPotiz/doBE/3RABFiuTYl2AQSuBPEf7N5utwCNv+QvrgtfB/J1MY/7aO9uxqHf++E+UGNBDR+IxdCfN3JgDUYTKo+zZnAXParrMbtdCxvKssOKiuSo4pYk50sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=580nZED+cryxHs8vb1YRjeRMebj3EeRG3YzmS6lGTRY=;
 b=jdbDsBrKiPmFhsG6jlawe2+p1v8EMa5oIak63SUq44oQPpOWwnf9yl2f788ObHrfOiS3r7EeNTL2ZEq4iDq9BGfuyOjyJAjO1P6Huqt5q549g6kAO71Bj2GkWrEf7R1h3zNnbajcAUowDynV7CPvjVmYd1kilVKHBQEXI5kgflF5nSFLP7lvP4qYFsYfw3MnVu001k6TXw3Nv+dElBi8PYdzkXwMTw8BTwZlDOkRVo1rLmXtItfmeNrsmn6Z4HhOo/lTDy+p0KJ2OTpn8B7nYxy/7SC8eZjKG65AIeG5YiiWLHiz9VjVs8sCI1pT7nGnm9lRYVy5HwT9+/G9akWFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=580nZED+cryxHs8vb1YRjeRMebj3EeRG3YzmS6lGTRY=;
 b=g9lRo4GMU4e9dTgGGEUFRq3K86FWvBGtBzL0DiimcqIiQqgtWV7x+uZ75hnJRnvBvMbivMrKZXJmR2OGHOhxi/UKKpXAJcWMXsSyuly8yYWDBkS5Rffpc6uFT75CIsA66F9iNS+ifodIY1e/oppYi2K/P96hPnbNf2HHgOvBkfmjMeZ3vekT2O8dn9CMSQIIyNoE+jyzuUXZo5pLAjdnRAB3gBPMd3kAIkyoZ+G6rKd8aNdokw+kLbu/xRiJ3mqQqyqHmMA5N2HA5JHq9FXfhRtuLl8Wuo9igOTqwz2p0LhhHmGCHWD/hL7IAZ+T6hvLo7nfkow5wjNTLxcCilA3tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:07:04 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:07:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 00:07:01 +0900
Message-Id: <DM8WPWR38VWM.1EJN4UEKQIYV3@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
Cc: "Link Mauve" <linkmauve@linkmauve.fr>, "Yury Norov"
 <yury.norov@gmail.com>, <rust-for-linux@vger.kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
 <atYuY1ExPAqZywrr@yury>
In-Reply-To: <atYuY1ExPAqZywrr@yury>
X-ClientProxiedBy: OS7PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:604:24f::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: b1890803-6552-496e-4d04-08df2df2a22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|7416014|1800799024|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7ycTJkrx28yNvIp1cP2rtVhzk0/nkEeqYILKHZ/YAlI1YYbXMcPIig1dgUCmvQybzKQZ79wEvPKePtHXAS/ba09RgbFkmfLcRLOzl/2EDhUIgk7owCjz9DuJnHaVR12YDMJY2F+qdJCZASxuzM78xt+y8QjniBdYwKmKe81z9/Rkaw9yPLI/72svrqd7I46QrstxTuoRPxIEzzKl7BjhLFXTF4cf7imsYqS3Up6Ra1u9y0RT1adHYne9zTtYvjJuxjUXymB5jgWAJwt5OLkNM5MKUOXRC0Gg3lCHk+tC4TALKqixdwZz7TQmfULsOZQ6zs/b5SbfvWp1FV2ZGhUcezLKrbPOW9lTVVZiEeUBP8dMIhzEmj6JG1EODyc+aZdp/7oSX75tjsSxqyFUSXTCQyJaVIcDtSy7HH/zuQW7/or5zTqoG9wO18PEupcJ2fm745NYy4orZr5w3h9MK82/hOrJXO0gj/arJwpRZgSjPENS7Qyo4h8237ZlZE1cU1pnZYyuwk1S002TAeTEf6Ryx56416QSs98o4bh1AQXra0ueDr4vJ/SnzZVBaitRrgRE+fimXhyjc92Kmg0Y0YEvK9Xzq5XCkpdxE1f2NsHUw7woPi6a9VhgdV5H2Jx7lYEta9KNuBc8xEyj8v60uAtxHrSXe3dCIWtNj+RpZGC3EwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZyeDg0MVcvY0hhcjdwcWJ1Q0tYRlVCVEhNd1NxQVRPVlU4Nnp4QTMyL01L?=
 =?utf-8?B?YUZySStQY0VyUExQMU1ITXJVQkFKMTk4MjQybDRka1J2WExsT0dsQTNIbTBX?=
 =?utf-8?B?aTU2RUZka2pSckg2Y2szU29PTFpacHBxSm91cG5mMTNsU1FyZDVteFdOQkk2?=
 =?utf-8?B?RUFUTnRPekFtVDNIT05ZT01QcTJ2TzdLMk9vUThhaG1qNjN3eDV5clhFYzNt?=
 =?utf-8?B?NUVlMGNZUGdxL2Rad2NEUXlMT1ZFS1c5N2pZdng0MEVwZGpYaG1GOENSODZ6?=
 =?utf-8?B?WnJyRUE0WXlyVFl1cjVRaHNXZ2xyWWF6eTJCcHJEeXZFeHNxQmxUR3pYUEsv?=
 =?utf-8?B?UVh5b0RWSmJsOEIwcHBPSCtkNzhOUGdiYzNIRGlWSWNaRE00Y2s5d3MwR1RQ?=
 =?utf-8?B?SHpHMnNqd0VvVEFpUFBCdGtLRy9aMys2d2daRzZ6RzZGM0VCTTBNZURxUGYy?=
 =?utf-8?B?Y2toQXcyd1Q4MmdwWTB1NUtDZ3BnQnBFZ0tzZFBGWG1nZUdHMGFrRXpkNkQ3?=
 =?utf-8?B?MEt3dEFTRUN5SEtEYmY5eSt0S2ppUmJIVjROMTFwVHNaZFZHWGRNSHJFN3BY?=
 =?utf-8?B?anRveS9rREo1UTBJTy9YakRXc0FYSnRnbXo5bkhCMkFjbWRNaHpSWXBoTDc4?=
 =?utf-8?B?dTRjTEh0RXJMT0VYa0hwMWxmemlkUllob05GT01DUGV6L0pDWWtySk1ZbjZO?=
 =?utf-8?B?WWtvcm9GdjZTT05yYnR6NTA4NmdscGF3N2Z3dHJjWFZmMWo4SGFsbWczUUZv?=
 =?utf-8?B?R1JuOWw0ZTlQQ05DT29Ma3EreWpVR3EwRlhQelB4VGNtdWltYVBjOHpZSE1B?=
 =?utf-8?B?akkxOVdGWFRTN3ZHL3p0NnArR2NsZkJUNFBHRjJpM0ZrbElxc1U0cTEyWFVr?=
 =?utf-8?B?MERQYjRQVWJZQ0l5MG9TL01XWXpxVWZpTW9NV3dIMHlycHJnd0lNSTJYK2tY?=
 =?utf-8?B?Qm0rbnoxRWdZU1p6NllVM2NXSkRwN2NtVG0vMnhvelExOTFEVkREcmV6THBE?=
 =?utf-8?B?U2pUSHo1SDdXcjdld2M2MVRtL2hadlpGWXE1aXA0S3RVMGh6VlMyQXhTOGl3?=
 =?utf-8?B?Z25lR3liSXdCTUtEWWFWdDFOeHFsWmxXK1lpWnc2bHRlMEY5bTJnRFQvTy9a?=
 =?utf-8?B?VlIxYmNuYldFUXByYzR5TXZ1MWhIQ2xnY1ZXYmJDNEJDaGZ2TVIyLzZGcTli?=
 =?utf-8?B?cDZhUUJxQ0dlcFEvSXdKZFd2Z2Vqb2o3UDloOFZlVDU5OGdmcjJtTjVYZDYw?=
 =?utf-8?B?azhUdFJMUGgxNE5zczhOOUNBMUt3WlhVQkJEc0FQVlRCaGU5Y3o1WU9Sa2VV?=
 =?utf-8?B?QU8zVTlTSWZHYlZxVFBDY29VN0RkUzdzR1dUZ090SlZRTzlUcXBtTmRkTk5i?=
 =?utf-8?B?VUg4cGM2c0puVDlVdVNZaDFUZkJETFBjSXBUVi8wemw1RFJvakVmYlVYUGtk?=
 =?utf-8?B?cGh6OVMrS3A1SHdNUjRKQm81eG1iZUtFcjMrVTdPQmZaZlpKa3BpUEVmYjdD?=
 =?utf-8?B?UnRtSXUzNzM2bzF1T1BSb0w1WnFEVWxqS3oxalB1SWh0V2NOSExEOHI1WmVI?=
 =?utf-8?B?MDNGbVZlZXRFcEYzcXdITUZtVlJSNFROZUZLcHgwZVY5bkY2aU8yYmVLYkVk?=
 =?utf-8?B?NEMrdFpkcDJUMlVIcFViWXJ1OVdqUDNQU3FmVFg5Q1J4OUhvYUcyN1lPSEJ5?=
 =?utf-8?B?TVJDNlkzdjY5WndQeXNyT09lcjNvR0JLS1dsa1lsc2poL2VISjY0RDdrTGFz?=
 =?utf-8?B?dVlHVTc1OUFvTm9xQnVZK3pGRkF2bkxtdkFiM1VHM1loRUgwVTF5eWV6Zmky?=
 =?utf-8?B?SERncDlqbHA0SHNRd1VSWDh3Q2w2K0VYL0hkR0dVVHRZSWFZREExaENMQVpj?=
 =?utf-8?B?UE5KamU5d3NVbmt3enIzRWM0WSthSUF4MW5BaGw0WjBWRUNVKzhqbFFxKzNE?=
 =?utf-8?B?Q3Q4Q3M2WXZYRE11QjVFa2ZmTmdscHZnU1UyY0RqOEdSdW53Znc0bEhhZDZk?=
 =?utf-8?B?SWt0VzZReDRqT3k5TmVsT21OdTRabzZqQkErWnZKVS9vNjhyVHoxS1AwMFdD?=
 =?utf-8?B?cDBCYXNtKzFiTGo2cXp0Nm9BSDNYMnh4K0srMTBNZkppV3B0Z0s0ZEZwNTdW?=
 =?utf-8?B?SHdXQ1RzQm5zck5nUzJaOUM3SHZxL25wZ3REUzJRcVpOYjdKblEyMm0rTDRT?=
 =?utf-8?B?U256WHJJK1A2VXdEVkh4MERLTmhTS1FTaEhSMEtzNTE3c1RXTk1wK0taSzZR?=
 =?utf-8?B?dlJjYjNsdzNBTHZ2YWVsNjNSak5sTWY0Tmx4aXdWb1dXeXFIeXMzcjlYMXRa?=
 =?utf-8?B?ZGtnWTJKVE5BQjdUbVVaL0FRRklZT0t3c3RUc3UxM2ozemJWZFM3K25XOURv?=
 =?utf-8?Q?wXFPk5bGoi8JJHUn3NBIQq8p3iFgTGWVlWLByTeggDohy?=
X-MS-Exchange-AntiSpam-MessageData-1: j6GxngjjOWNOtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1890803-6552-496e-4d04-08df2df2a22f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:07:03.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsZ5nolEmEnOs6/B/Xr2e/DQVEhblFLLg6EVIsikhLOifwP9dia7J5Q61RXQot5RtbDWic0cMT5WYuc+fi2BCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200

On Mon Oct 19, 2026 at 11:51 PM JST, Yury Norov wrote:
> On Mon, Oct 19, 2026 at 12:57:38PM +0200, Link Mauve wrote:
>> It was previously generating a ton of very short functions, such as
>> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
>> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
>>=20
>> These are obviously better inlined, although I wasn=E2=80=99t completely=
 sure
>> between #[inline] and #[inline(always)], but the former worked fine in
>> my setup so I went for it, we can always adjust it later.
>>=20
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>
> Do you want me to take the patch with the bitops branch, or you've
> a better route in mind?

So far all the patches touching the `bounded` module have been merged
through the rust tree.
