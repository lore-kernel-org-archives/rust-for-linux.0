Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CDF2D63FC;
	Thu, 12 Feb 2026 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884816; cv=fail; b=LPjZd46Qdk5HajC37/Ll2NbYm45nlEPNY1WL4G2+X/WN98F9POHNcdHIUy0e+Oh8VM9Y8SZX4v048FNLm99ROoUXyaw0ModiTKRVoXH4xbptzjSoqzhDo9uCG7i0SEjnEu5W5c7UMhv1gBhHHViXHZwKdgv0uTQbcZ+XWjol15I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884816; c=relaxed/simple;
	bh=sxKeHc17mNQlyhGr/stNZHYCLnjX3d8swKYS1w7Of9Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hxjBcB27oosHdO5S8y7U8a31mfma8zyEYhR0W0TVhka1HdEjTVvi5Aa8ykD0lvGTUqwLwJChTrLu9jIHKAhjrzcWcD23bdB6Jv/jjNBZGjRpLjAHIFI6VQKYmKt3jPVhX+J3Q6WHBSM2kJOLGKXl2B9FzQpoZUoq8QZ/ZjpPvRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jNqMsgzH; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jNqMsgzH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVfScZdVP5JlBSWlFSzfErldDT0Ljgm9qA2xnE0ltJTmyAtomrva4sx+ppjRgl6A/G8Q6P0nBKCmhlWUGl6C28recQzqsUEdaNUPvWm4hQuPHUxhAIENCvh4fXALE9GgTMqwb0rCb9mhzUSPfc+Ee8GK1zyqq5PbLq0NrduqAnyLHlKG74HeKNGaIlhRhzB9YKrTUt8+VOcP3hwyY3jPh1k9nkCdEOZ/+0YAYKXL2Idl9qlpPSNuRPR3rVSlOIf+Ea/9pYL7rwNEsVIc6EVs5lqiIW6jvoq5YPdWK9xhIopYy61BdHDK1Y52I37hCVzU4XzRVLaHKYXcp0q/7qxLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnArJLx70FQ97Vlowms2wKVgeIi63e2B7TTbLIxH5Rg=;
 b=uzDvpDzl663wxe9TPUSuKfKdH8gbjZ9+0xhii/cS45wecsEegEMyepa7CZtsBLucCCqErF9Fu2zh/kBN6Thmr/40K9vWA22zosC/+vBIAZ0/+sA/JxcNViAwxwklLJ8cWGsxIfiej2riwD6Y1tDX01pT3PBSMo8jQAGNUdn24R4oxN9OsVz9BbFluc/j9fX3ZBa5cB9OjGEMZrvutaooVv+q5bwFLokud+iItQAUfjnLH/cXSNkAX73qNHzytwjmCDTI61+xUGRZFIW07P3SjK78FWfqI611Cm3eLJsqWwD1KkZgrn+sOrHchOWM76rd3oz6o/A2COf+yY1vhH3PWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnArJLx70FQ97Vlowms2wKVgeIi63e2B7TTbLIxH5Rg=;
 b=jNqMsgzH4AQQutLZ/yoTeQgozvVyQcpn9Ipl00aebV48gzTg24LVUZRrwBYFfYWJdToR4lyIvjemHLvnkIDZs2qnnQ14/1hhNOlXh7Jan5OG/R85vKFEtqcYISYDZVqbyVMAUDmcdzBxWZ0BS6lHL9KeoyfqnRIaLfPGwvrMkm5iGFmwdy1FxfHiy4CyMX0h1d51dAD7nT8RgO0Q7LjTknvo1CHrKxlaOL86JPovPmHS43ncrkrhmTxNVDlYReczxPwgXTNCD9rZmLOEd3yPKbqleNi2WhAoVr/kDBR0Y/4Rcb/2YmuUV7NNO7TXIve9xfDdntPFXnMKMVS9NLM+Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:24 +0900
Subject: [PATCH v9 7/9] gpu: nova-core: make Chipset::arch() const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-7-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb95bf5-7693-4bc2-7db4-08de6a1078b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzFjQ0pLeFB0RWNsUHY2TC90YUpZc0VZUXlHNEZZM2taQnJQYUFpdy93M3BL?=
 =?utf-8?B?ZW9OR3NmVm1tSEFGZEpmWEdBQ2JlYUhFU0NOaFh0WGZPZk9FOVUvZk5FNXpl?=
 =?utf-8?B?WHNUbFUrb2RyVENFU3V0Q0pUbWpNMWtoUFc1UGJCeVhpdlR0K0hOUXQ4Y3ds?=
 =?utf-8?B?Q2E4OFplUDR4VUFiS09DaVY5M0U2T1NpM05pYmVtbWswYXZUVmpVVVV2Vjhw?=
 =?utf-8?B?TG5sOU1MbjhBeXFpa0lOUUZ4VTNpNG5MSW1rTzMwd2hvRFMzd0Q1OURjaVVq?=
 =?utf-8?B?U3hFTEJCOU04YVV3S0VJYlRCaXplQmtSQlRQUGUxL3JuK1h3aW94VENHTHlT?=
 =?utf-8?B?Z1padWhRV2tQNFNjOHNYS1d4QlhocnB1ZmZ4NzVnektVSFU1QnFmcW5ReEZi?=
 =?utf-8?B?NG1zN2VnSUFxaG1uZmduWnJCenloK2VvL083VUdEYUNWWFdtK3hkeTI4OFBt?=
 =?utf-8?B?OHNhcTRIU1JLVldhU3ovaVlsT1BRNUE3M1hBNkpmVTNwS3pRNWhVbytRY3Ba?=
 =?utf-8?B?VFlPN1V2dmVscmVRNUxuK1AyaHRCdGxpNVlONU1yQXNaSmdqd2FDSjM0bmla?=
 =?utf-8?B?bU5ScEkwSXZPS3FzTXZxMVMvUDVxbEhDNElzay9XVEdiZUhibTBvSzlLK2RU?=
 =?utf-8?B?M0loVVlaZEJGcHA1ME81WXhYSGZ5RVg3RUEwY2MrQjkwNkhTNHVzK2hzV2ZI?=
 =?utf-8?B?RVRXN01tQ2NSQXR1MzhUK2hnbE9yTkMzbnVlVDdMRGJJQVNWTzJhNWxpeEMr?=
 =?utf-8?B?TGJWZWpzWUdnYXhIWis1WG43UFk5TlF5RzZFNGt2QXF4bE9zM3J1S0tZd2tT?=
 =?utf-8?B?OVRZSUdsSTBiMGZ5SDI2YnU4Vi9WUkdtYXU5VXEzenl2UUdYQy8vVHQ1ZFF6?=
 =?utf-8?B?aG96aXd0bjJyRHBwZzJrN29xL3IyTzlaaUtrRE9HelNrT2RGWmRmeEgwZkRm?=
 =?utf-8?B?bU9QVFRlQVhtLysxNUVNVFc2VXFQMHpIL0UrdUhoMU93VmdEc2htWnFxeTQx?=
 =?utf-8?B?ZXBPYmxYaU5mSXhBVURHRWRTVUFNRzQ3U0p5UUhtVVZzWThlL1BSVmsraE9i?=
 =?utf-8?B?WTVDOU90cnNFN3B0dVlHcmJxTlp3SEU3Qk9EVHZNeDgrZU1hSmVBZ0FYdUd5?=
 =?utf-8?B?OW9tWGJmbU1aZ250cWEvRXVvZE1QSUxsTld5SmlHVDRjSjAybTE5RzBoMnpt?=
 =?utf-8?B?bVZQdDRiVUkzUFhzZ3htMkpBdXZsbkJIMnJzUkNpSGZFSjZZZGY2ZEdKNWg2?=
 =?utf-8?B?OFNUT0ROVjFmVzZaQjFVaWxEbmlqZlJOcVNqOWlydnpHdkQvRllTU0xHQnpl?=
 =?utf-8?B?ck1jRnQvcUpWN25NeUFPYlNnb1JDR0VBbjJpdU9xREM4Qi9LaExja2JPekhu?=
 =?utf-8?B?UExIQ3Mzc2F4bldLK2xaeDBLNUFrMTl0ZzlNVXpDR09kMlg2SjJXVjNFalI0?=
 =?utf-8?B?TWdUN0FTc2Q1d1F5S2kreFZSM0p2YXQrNUVmN2pIeDlXNnloNVVhNlBBbW9Z?=
 =?utf-8?B?a1I0THg1K2NRT01EekQyQkdYL04yNWV3TUtMWXo4c0l1RFdYajE1UVljcElw?=
 =?utf-8?B?dWh6OFE3MmM0N1hxRkRPVklnQjVyemhWWE9FbmJXMUpFSlFKS2UxUlI2RzRs?=
 =?utf-8?B?c3k1VGl5SkRYNGNsS2dkbXlvb1lIV0EyRm9vaXBoTVBsQlQ1bzRQbTNqdHN5?=
 =?utf-8?B?d09iUTczTHJKZkxxeGZNSVpwRWgyMnVaODJaUDZJRW5OTWg2dVVNek9hUnRt?=
 =?utf-8?B?WW04N082NG1vUHoxbjdaRXcxQ0xTN0Q3SnpsaHZIdVNjajYwVEQ2SkZJVk84?=
 =?utf-8?B?WFhTSEdhL05MdVpMT2VrVTNvMFZWVm5hMVZrWHVMSWhwbFpJT0xIZk93WmdN?=
 =?utf-8?B?VXJ0c2Q5MFBwdm15dmNiNC9henRwYVgzbGp5MmZmREpIZUNoWGVIL21GVXZ0?=
 =?utf-8?B?SXkwdVdkeFFXeG9YTHIzNVNoaDdDZHZuRmRyTnpISGZpYUpGeG5JSmg1aW82?=
 =?utf-8?B?dkQ0d3VRb201MU9EZXBDMUhGaVpMQWpzZTdtQm8rK2JkZWJTc3RXTHRuS3Y4?=
 =?utf-8?B?MEJGbWJxOE9wcjUzazhpc3BjblB2TFYyeGNsaXBsUzFnVzBTV3R4ZGJOQzFB?=
 =?utf-8?Q?q/kU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1MrS2ZmL0pWOHdXTWJpcDhzZmluWVpIMjlNR2NpSHBMUFNtRFFBTjg2T0JT?=
 =?utf-8?B?aThGTzJRVzk4WkNZRzRPakxXaXQ3NmJnRDVzWVhTMTJnbDNDbjFsTjArMm81?=
 =?utf-8?B?M3EvZmxBS3dma1BseFowWGs2MmJ1Qk0rSkpJS0Y3ejZBZkpiajlrMGNyeVJn?=
 =?utf-8?B?eHhOcnRkNGlkMGlzamFoc1NiUjJaNnRNMTRVeHlLZzJwc1h3L2VTak1rWVhT?=
 =?utf-8?B?OWNDWm9WMWE4ZHQrYkZTWUNGanYwY2ZuQ1hmam5ZcUZ6UXJGa1RueEJZK0Ru?=
 =?utf-8?B?UlpqR1FuaURSZDlYWHVwYVFBOVBvckJQUWFLak94NWU3Ym1GeVQ3b01LbFFP?=
 =?utf-8?B?Y1ZSRVRMNXBSSjY1enpuNFNlODhWdGx2L3dhTG1UQXduMWtscmdNeEQzaTVX?=
 =?utf-8?B?WmdHV3o0SGJ3bk9EVGdSVkJ2Tlo3RmNhQ1VoYm1CV29aWmZmRmxiZEE3MVdw?=
 =?utf-8?B?WVFVS3dTZVN0RCtaWHdRcWtqaDg5bEU0NWJ6L2haazJMQlR2aTBicnZXRVQ3?=
 =?utf-8?B?M3dBTUwwRHYrN21kcnRXQzRwREg1empoNW03aGFsamczb3g2S1NpQ1BBM0ps?=
 =?utf-8?B?d3lOSGxJNEZGandlS1VyY3YzYnF5aGplUmNsU2s2dzNQZ2ZoMGtLK1VGZVBP?=
 =?utf-8?B?RTZYeFdERVJJVGczZEJMSDhISWhDbEhLMnJ0N2VTY0IzZGFhWDZMNWtUbExT?=
 =?utf-8?B?WjB5MHBXY1grVHBETmZEaHlJWnZ1T3ZCNS9UWmFwT3dLMmd3VmV2OFlFYWZq?=
 =?utf-8?B?TGovQzEwUVM3Qk9IN3YzR3ZFL05McVpYWHpRVnVLRG1JbWZNOVB1bFhBcUZM?=
 =?utf-8?B?NHNKMmYrWVlHWE11dmtHZGJPVVBBUCtvcm9LdXNEV0QzZnJQNGtBaW56NENj?=
 =?utf-8?B?Q1kxaUNwUFp3Y1RkSzg1cGF6d2JIYS9uRDFPSkdvbDZ4L21aNWpZSnQ2Vm9p?=
 =?utf-8?B?d2oyb21TNjlSQmk3YWNGR3hVWmwrSTJ4NGxaVGVkbDVidFVrQ0ovMklmWkJY?=
 =?utf-8?B?RkszWHE1bmZFTElwTnBjVU5Md2diSThqMDlwTUZLd0x6YWd0dmVTYUdwNlZ3?=
 =?utf-8?B?WHBkU01nT09iQ202ZFhKNktlemsvWjNzUi9haXhmN3ErTXdpNHdzUTZGRCtM?=
 =?utf-8?B?NEU4RzhRVlJhbzJFZWQzTDdzQUtFS3RVY3JaMUMrbjNYbDYzWGs1enJiMUZV?=
 =?utf-8?B?aWxCUmkxdmJFcW96aE9BUDJYM2ZYeGFmTGVIV3hRbVMwVm03WTJqQU95TUtL?=
 =?utf-8?B?L3VuSHVFdVFKY2lhWHVuZ2RCN0VoVUkzUWVKMnpvSzAxd1hjbWp5OGZBWFc4?=
 =?utf-8?B?Tk5SZWpyL1UxQUJEcU05Mm9GY0hRRXNYZGdjMDN2VUNndlpDZ3JHelY2K3BR?=
 =?utf-8?B?L3dSeTNxZVRiM0o0RHFiM2RGSGl3UUI3V2R5b2p0cnJGNit4aklYbWgvSVVL?=
 =?utf-8?B?QjlLZTFnWllJQ2xjZU5aR21lbk55cG80RmJGODNuME14QXJrRDVMR1UvTXpB?=
 =?utf-8?B?L2VSRmZDZU9OVFFtZUcycWptNm9mVlNsajVUNjNIdVZCQVF1NlFPajhaNFFi?=
 =?utf-8?B?U3ovZUtwU0t0NS9ETjNaRUdrY3ptaHZrSFBSQ0FnTTNQT2RBTlBpc1ROWjh0?=
 =?utf-8?B?VUc5NVZVZW9pc2piKysrU1FQU01lMUFRWHdJd2R4OVpyeTlxZGNMd01jNEsv?=
 =?utf-8?B?K3JVR283ZmlzVXlZYXM2VlhPWUNOMWhLN2hnaTg4Z1piWUErVFUveWl4UDFE?=
 =?utf-8?B?V3ZHSjhmcUhidnVJU0RiMXU0NlVNeFByVDJUZkpYMjdQSGNvUzR2LzRsZDBz?=
 =?utf-8?B?S29vWHVpS3pNL0V2K1hqYlNFdnNubms0b2prZGNpeTZ0UnRmaVl4endPc1R4?=
 =?utf-8?B?d2xzdWQrbExvK2NCcEs0WWFiRXlNKzN0ZmlaZmdkZlFIWGlxQ1IvTWlTMHJF?=
 =?utf-8?B?SVB4aE5RRGpSRUxkYXVwVUYxVnYvb2s5TXNzcHVvUHFNQ3VzV2I4VVhQTWUy?=
 =?utf-8?B?Qk9oeDN1eHZLckZrQ1BqTlBGWWRvbTBHYzhGTnVSQ3dsRnI2QTBaeVpVNWlB?=
 =?utf-8?B?eHlpN1NKQU5iRGZqTVpLWWNPR3VYbFQya2hJZzhUajRwMVcwc21SSFA4UDlh?=
 =?utf-8?B?NGU5dVpsUzRobkJoWC9WSWJTRVc2bHpuWUJHQ1I5Ri8xM1JoRVBWSVJCM3Zk?=
 =?utf-8?B?VlQwbjNvQlN0KzVML25iQnR1TWlETmQ5SnlKL2kyYndhZGVBaHFUQTMxZTQy?=
 =?utf-8?B?VFk2RjhTbGNXT1RMNEdIdXFpK3VzOHZiaDhMVDRQSjJ6ckZuVlhzM3h5a3Vz?=
 =?utf-8?B?L1NtcVpvYWw5bTVvSmlsajN5SUplL2luMkxaWGVnaDFzTUQ3cUQ2UTU3bDBC?=
 =?utf-8?Q?sEnO5ysEGqR4lsBWplDLmetPO9u8CIapR739Esu2kgmpW?=
X-MS-Exchange-AntiSpam-MessageData-1: e0xeCwwgz/ADxA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb95bf5-7693-4bc2-7db4-08de6a1078b1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:51.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpZTV2PaXfcsppziWzgaE1+pte+9G/hw/dqAjxkvag10cgdhQ/BbCFOyjwE2UGA4Q3lbklFmn02iswxao9kZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800

We will use this method from const context.

Also take `self` by value since it is the size of a primitive type and
implements `Copy`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..9726205d94b6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -92,7 +92,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing

-- 
2.53.0

