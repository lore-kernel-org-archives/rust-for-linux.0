Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021080.outbound.protection.outlook.com [52.101.100.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C62FD1CA;
	Wed, 14 Jan 2026 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416819; cv=fail; b=sZ0ypL54gvIHIs3IcbEx0ZKPLlJxC2013c5+TBhhwFSsnvWvAYHU4WTUmTIJFWP9DGWnMSriMHyrg0VshgFNddoBQDS7kqUWeIzjxREpDCt2sbyIzMpsFJ3YXjIJyLe0z9l2lcYhMgn+/WtfNwePB9vsPjZcm4g1/m5kIthqd2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416819; c=relaxed/simple;
	bh=RjcBoMMFNh6aFx/FJnEY/tg384qEAlgBbotqDRLbCkU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=fmY8F2ZdOtjDBOgVRZWOr1C4Uue7+kg2ioD+f1pvXdoFLp3OXFYTfC/A9musH5DUMg0xGlE1wFzx0VYVV6454+yD42EfrFi7v7BQQmWHwIiWwkc51ZbqxQc41O5xPaqkWFwZ+gDzi3dNRjFI6J/L9+++E3RgFg3fv5v6XwpZ/Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=yUFlcmAp; arc=fail smtp.client-ip=52.101.100.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="yUFlcmAp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckesFUxYTUCB2DDoS+0+Rb+snGvXfMLHUAVbHqBeI2hQMIonLQCpSpfTPtF3qjzAeXsXRgGfnK0X+DVv9s+Z9Ly1C8YYMezAb8vy85y6cMVUs1PyRxECy1XSfEf+QEU+FxvRc1rrq4Yabmx8ZXL+L21HNCMPloDQCcXBJ3gt1c3JW1B94pba8OScyXaoB3PvY76tyduzX+CY+/T8CSLRS7Gj037f+mq5VD3im9Ez37RXtWDVWmv+gTKzAEUwEi/CY+QyzgNcMwz/f7FnZP0JBiCZ4U7X66Z551g9UEd7pkkWBrxxL7ICP3k0KQh8of+IGhrJm5Z2mOkvgMViYBULxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drYTpAXfO5NsD555gUiMzSJgMv9caczaApFuwjr4Euo=;
 b=r4YWRKaPFgbdcyJNX6RLGclGGYegg+rXx5L5WIdhymKKoiWY9KSVze33jfSYoOxs0fKpyHNTHNPhhPO5iiRMpoCW8pSCcTPAmN2gq9SOjCRe5fenCfZZ9ObC+QMPABMYb0ejB3YAal0F0rVTJZWSD5bsaJ6m0yeODBPXebbHiOIKLuxwZH6dsekMOtjXQK2ZU30uEqJJs6F2ZrSleQsMtK9kzfEtne60fFzyLkT96wTxhAL+sTECSOIrMIHO+NhPNYfhtSKAEJvY7NOyZJD7o0vpueLOa81xCDrmqbs8Iu2dfUz9LMhBPLJK1IcRJgHMWN1/5UeKdf8TrYP+ARk7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drYTpAXfO5NsD555gUiMzSJgMv9caczaApFuwjr4Euo=;
 b=yUFlcmAp8a5nk6t0qIgPL0H1APqmW2eXTN1IAYJMFR5o7CFURvkqJSbCuz4VK4fnW+jkEJ+RmEDVLsDo9wGW/wRBNcXgPe01jxS7B4dSEjmPkYheJ8PSnKBE6Zu2G+STp77sQkIWQ9rS53c2ba7wu9a3uHdB1b2Th1I1SwTUC8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8612.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 18:53:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:53:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:53:35 +0000
Message-Id: <DFOJFXOFPXAJ.S2X6PE9EMAG3@garyguo.net>
Subject: Re: [PATCH v3 10/15] rust: pin-init: add `#[default_error(<type>)]`
 attribute to initializer macros
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-11-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-11-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0146.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4e82e1-c693-4a17-e358-08de539e3904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVgvdlF1SURiN2xNNWgrUUZZdHVCM3BERFRxQ0FSSkljcFFZMm9YTEJJa1RO?=
 =?utf-8?B?NlBZNHJ6aWt3WVhnRFpBQ0NCeXFOcjJJNHVzWDQ0M2xad0pHcWhHU2N0VGJO?=
 =?utf-8?B?ZTJXWFQ4dnZLajFSVlRUSnYyUmtsRzRXWlhpcHdyb0lkUGtDcGNhc0M2blpz?=
 =?utf-8?B?T2F1ZzR1dnhTTllUVjJ0MzZhcGN6bXZpRGlYWjdJbDVRY1VRdlVEd0czbnV1?=
 =?utf-8?B?Q2tEM1ROS0ZCekprSXRZYVN2WHFDd1VHcmlPd2g0MDBSS0Zxdkd5dW1GVzJL?=
 =?utf-8?B?b1RjdityWDhwZlNhbWs1NzNqMkt0Qkp1dzNvRFJLNWdkQ0lSdmdoMmNUNUYr?=
 =?utf-8?B?czBFMk5ZdkVzaVppODN0VmlRbUJIY0RIZXloQWhDUisrUFdIcnYwZG93aVVp?=
 =?utf-8?B?cXhjRVBCWnVFbllQcUp3ZkxKTDl1WWsxNm4zemZ3NlFoS3lZcVRLVUpMalVI?=
 =?utf-8?B?TkZxR2VxbUluMHlzTlc2K2VpbzV6cHFLaHBuVWFCVnkyNUI2TzdjbHlvMno0?=
 =?utf-8?B?Nm9NNXhJSjhveXVvZFlZUVpjd25GUG9wQjJrb05ZeUNoeTl2NFFLMjNjR2lH?=
 =?utf-8?B?LzRiRGJPais3dDNOdmRyRjZHSTA0cllZSHl3V0RYSUNqV1BMVnlZOU80TXNO?=
 =?utf-8?B?d2FjeW9KSWEzNmlIcFNUWlR2Q01sSzZrOThoNlo3MnNUczBTc0dSQWtWSzEr?=
 =?utf-8?B?TVo4UisxbkRmbjZQaDBnWWVYc1NvV3JJc2tnZU9EdHdYZXA2c05mcWRnYmU3?=
 =?utf-8?B?SjZxZDloR25ibUdKVkJNeHYrcEJtZlBsRENhV240NU1wMGVzd2Q0VzJSWWx1?=
 =?utf-8?B?d3BwekpHZGVlUitvNGFjRTFBblZWUWpmY0N6Y29lZGhUMzN1aml6VWRVTm1r?=
 =?utf-8?B?a0RlZ2ppNFplbU1YblFvMHU3WHNSbGhNN1hyeFR6ZGR0MXpYNHM2d3NNVTEw?=
 =?utf-8?B?aW4xZWI1c1ZnZGpFemlXVXdiUzJEVHhXdThkUW0rT2V3TUlpVGUwS3RTU09K?=
 =?utf-8?B?U2xsUjRaVjNUV29QYTY4RVRSbG1lbG1mOTBrUzVldmhFNnBYOHU4Q2o0NDYy?=
 =?utf-8?B?UGdrcEZxa0FDTngxRElkTHhnZWQrT2VVZC9vMGZsQkJ5aHF2NjQzWjNiNWti?=
 =?utf-8?B?Nm00THBSRzZleEFsWkhWVWtnWitVTzlFZ0k3T3Rwb3JZWXI5SDZsT3V5RzlS?=
 =?utf-8?B?SGZoYmtRQUp6YWtINVdjYUNmRkx6OHJ2dU4vdHl0YzNQaCtwbUdkYzBLMzVx?=
 =?utf-8?B?TE1JeXpmOXdxc3FnU1psVllGdC9MQlBscExrUUFqTDYzRTJHQ08zc0ltL2dh?=
 =?utf-8?B?Ulh6eVlWSVVuTjFpNU01M044LzJuNW5IT2p4eFJZREFmeWVYRStaVElzZHR6?=
 =?utf-8?B?eUJCZStUa1IvTWtmV0pLM1NzVURsL2VSVTJ1MWI0OEcxU1FCKzdzQU1UTlpD?=
 =?utf-8?B?RE1HOGdNeXhxamhWQ250bUZuZHNxS1d2MlBNb1BYQTBXT1dWRGtDd1E4YVdH?=
 =?utf-8?B?ZHRERml1YVludXRVYnhhWUQxMUd1S3JaWEtmT3UybGs5U2M2TjVaMnA2ZEd1?=
 =?utf-8?B?Qkk2ZEc3SDAxb2RNK21pUzR1UHhOVEhCdjRaeGJ3UWsyM0tpc05IUVN1MXhP?=
 =?utf-8?B?VkNFSGx3NjFOQkJIUWg2MTN0WHhHOFJmSnNjMnMxbVZrYmJoQ09MK1FSNUhB?=
 =?utf-8?B?TE56SDhJcllsSEwrRnFidmN6QlVtaXYzcnA1cEczSURGQkh6aXBvU2pZVzl1?=
 =?utf-8?B?UHA3REZuT3grYkE3Mlo3UjIwYkZnZ3hmNjhVbVJRMmhxb3BzeUZsZWNIR2ln?=
 =?utf-8?B?ZG15MkwzbkExa01Ed01KOUNiSVpCUDd6ejk4S01XbWlBZkEvenN1L1RhMG9p?=
 =?utf-8?B?QTV5aENjYXJGWVRReWNpVWhnb3p0RXF4OENPMkVZYnRPVVJsYThsZHU4ZFBK?=
 =?utf-8?B?NVhob0hoeEc0Qm5yZlNWM05xZncvNTdVZGdhc2Z4cUtBTWg1Q0RINFJJa1g4?=
 =?utf-8?B?ZmgvbEh0RitSS1Izb3dWSEw0b1ZjUjFWSXZLSGFlYVd1TEhjY3YrNittVVB2?=
 =?utf-8?B?TUZ2QWc2dzdoOG4xUTdacTAwMHk3STIycXdYaFh2QW44Nkw5OEVPNlRzWjZm?=
 =?utf-8?Q?cLyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTk0UlJ2ZjZ1S0dXanpXaXhwN2FJdGlXN1JlQ3ZZR20yN09HRHZWNFErWmMz?=
 =?utf-8?B?MTQ5d0N1OENLUmdIZ2huNDRQQXh2TGwyWlptb2hkU2JhdW9ZYzcycllvLytO?=
 =?utf-8?B?YWt3MHAwUW4yU2RiT2h5ZUpvM3l4Qk9QVkp3SCtqT1NXa0d1c1ZuUlh3N1BD?=
 =?utf-8?B?VUVxUTVEL3JjTldxUEpWcTUxb2V0cHRUbnlpTzc4UUNSbTRUMjNwQ0xIUmox?=
 =?utf-8?B?eE5ZTWdicWpsRk9KdlFEWjFRbVBvOEp3eUtvWHZ4eXF5Q3ZKUGxUTUU1NDlX?=
 =?utf-8?B?dE1PaWo4OCs0N05lK2wzS0hhcm5kRk9CWVFBTHc5TGxIK2xNTjNyTVVDYXg5?=
 =?utf-8?B?dTZTb1AwaUJWcXlSallnNkRjSlE5cFZRTlJTYWRvdXI4c2plK2xOOUhlV3NP?=
 =?utf-8?B?RFRHY2ZlQ1FmZGhXK3NGY2MzcFBnN1lnN0plV1JNbkJaOWRuWC8xQWtrYlZo?=
 =?utf-8?B?a01oaHhydDZkdlYveXQ5aHJqR3hPUG5nWDVrNEVwTDRqUVdYVDVFVnJSVklF?=
 =?utf-8?B?c0FxeHh4MURNNGFUVEh5STZFOVMxNFcydkdhOXNlamx4OG9mdEN6aGxmdlZ2?=
 =?utf-8?B?dmpVU01NTEd5RWMxM1lRenZ6VGdza1NrVTVyakREVDBxQzZDMFVFQWlZOWE4?=
 =?utf-8?B?Y0J4UHArZ3NDMjJVb2Vrdm1BcUhzNlRhKzFiek1NQko5elNmK0NKUnN6WVFF?=
 =?utf-8?B?dlg0VVpjc0V6Z0kyVDdXT0Q0SGJJS0xFWE8rdDVZaEZkKytSQVEwaDd2Z1dJ?=
 =?utf-8?B?RHI3Z0xrQUxQNks3N0JiN1o3Z2VYdHcvbWc1SDg1NEtyQXBoUGZaQjJzRE1P?=
 =?utf-8?B?Z21vcWhvVkQ4Vno4QUc0UEExK1FkYWhhckdOR3BoS3FpSU5tZWV2eG5sa0sw?=
 =?utf-8?B?QTFGOWxWeEVoWU5sS3J2aFZvNDFVMVp1MHoxeEJRSmJBUzJNRFNJbXV6Q0ZX?=
 =?utf-8?B?RzF4Ky9obGVrS2tEZUhCWkxuQlprZkk3bEpPNjNaUzZIY3RKbWtHUjEybW5P?=
 =?utf-8?B?eEpOVS9PaDlzZEVQV0dXc05OQjJIa0FNU3hrRFkxNUdibm5RQW54dk40b0Zz?=
 =?utf-8?B?TnB3OUNUUkkxWFl0NVdmMHRMaEMvZVUzSDdJeG14aGFpZ3A3bFp3Zk1EcnlV?=
 =?utf-8?B?QkR4T0RLZ2d0NUJCS0syNDc3MDhmRGM5ZFIyUEVYYzl5N09ZdWVzZnRMbFJV?=
 =?utf-8?B?bFF1MElCdXVBdEFETnJBOGhzcUQyMHhSdlFxQ1BEVFVGN2h2blBWdC9uZ2p0?=
 =?utf-8?B?N3F4QjJXVXh1c3dRcHpaUkNZZzExWm5aKzBuWEx4YjFyblRrZDlCZ0xsRUZX?=
 =?utf-8?B?REdTZi9ZY1pRR3A4cmJOd2t0bHRuR21SZERaN3EvbXhPRzhLTVZFSDZwd1BT?=
 =?utf-8?B?Ym9CZ1JXOFNVL0hXTG9lQVRDaDEzMDQ3SDRueEZVb013MlRQZ2JEU2FJQith?=
 =?utf-8?B?OXZzOVZORzE2eTY0Q1lMdW0zUUlGMEhUUnFDbEk1REJNZXJ0STBxRlNVNjBH?=
 =?utf-8?B?M2NRSGN1VzhTK3VXR2ovUUUwV2RySEtBZ0JVYzRUTytZOVFiOENHZXVYVWht?=
 =?utf-8?B?dTEyTlByS09WYUdmbWpVNGJKSlhZaHJObytpMDRXR2ZwUm8vSzY2VTlmNWd0?=
 =?utf-8?B?TTB3SFhUTXF1T0FQTzJLMnd1SENTQTdiSWJyWE9WTVNOMk9EL0RQei9aaTYy?=
 =?utf-8?B?UmJ0cFZ4UXRORzd4d2JSYnI3YVRnbUcyZnBOK3ZuY25EUitldXVrY2FhMUFa?=
 =?utf-8?B?Y0paTnpSY014bGdEK2svZkc3R2gyeFVQNEU1VXNCcldMUUhwL2pxc2VLUFha?=
 =?utf-8?B?OWlKcm1TaW5OS2NybmRlQktvOTBMM2JwRnVFczVPaVpxNU14L09WWE5IQUZz?=
 =?utf-8?B?M2dEMkpHaThEQWg0emdRUkpHNTRvTGRHODMvNkRpZ0pTSG1YeUFkYWNyRmoy?=
 =?utf-8?B?YzAzVHNXRnJhK1F2djFTMlVQdmlvNTdra1V6QzRCVU0zWTY3QlZTWHM3cEp3?=
 =?utf-8?B?c0wrT0tERXVXWFFEY05NcDFlYms0bDN2TngzcjE4cml5Q2VCSU8wRzZuWCtL?=
 =?utf-8?B?RWV4QXJFbHAwSmZLMTJ0VGdPS2hXMzA3d2laODlJaFdBK25HZkJMNWhkd2M3?=
 =?utf-8?B?RUhwS2J3ZXBmQjN3bFFuSUViTFZQeS85NGloM3ZJVkp2TXFHRTJMdFZENVlK?=
 =?utf-8?B?QkhWVEI3cWJDNXBpMWc5cWtZU3JrVEt4aW96SURTZkljeXJBWmxRdFhWOHhz?=
 =?utf-8?B?cDVVR1R1RnlZSit4S2xqRnlCMHNVMzdsbm9iL0NKNEdNVDhYUVVXSElPdU5E?=
 =?utf-8?B?ME41SGwvV3JCNWpHbXBvd1RVVlJ4cUk3SENMV1ZiOVo1OUJwZ2VlQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4e82e1-c693-4a17-e358-08de539e3904
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:53:36.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl3vdDeS1Qzd+CUQTjcuSGWnHx6ddUCZ6jthjhTIO7oJxd6ybc2L4exCQR5lkAXpRmSjdpigRwZ+athOof3g0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8612

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> The `#[default_error(<type>)]` attribute can be used to supply a default
> type as the error used for the `[pin_]init!` macros. This way one can
> easily define custom `try_[pin_]init!` variants that default to your
> project specific error type. Just write the following declarative macro:
>
>     macro_rules! try_init {
>         ($($args:tt)*) =3D> {
>             ::pin_init::init!(
>                 #[default_error(YourCustomErrorType)]
>                 $($args)*
>             )
>         }
>     }
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> Changes in v3: none
> Changes in v2:
> * improve error handling
> * improve parsing and default error evaluation
> ---
>  rust/pin-init/internal/src/init.rs | 42 ++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index b0eb66224341..5a66016bdf33 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -8,12 +8,13 @@
>      parse_quote,
>      punctuated::Punctuated,
>      spanned::Spanned,
> -    token, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
> +    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Path, Toke=
n, Type,
>  };
> =20
>  use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
> =20
>  pub(crate) struct Initializer {
> +    attrs: Vec<InitializerAttribute>,
>      this: Option<This>,
>      path: Path,
>      brace_token: token::Brace,
> @@ -54,8 +55,17 @@ fn ident(&self) -> Option<&Ident> {
>      }
>  }
> =20
> +enum InitializerAttribute {
> +    DefaultError(DefaultErrorAttribute),
> +}
> +
> +struct DefaultErrorAttribute {
> +    ty: Type,
> +}

Given the size of the struct, I would actually just make this `Box<Type>`
instead of suppressing the clippy warning in the last patch.

Otherwise this looks good to me.

Reviewed-by: Gary Guo <gary@garyguo.net>

> +
>  pub(crate) fn expand(
>      Initializer {
> +        attrs,
>          this,
>          path,
>          brace_token,
> @@ -69,7 +79,16 @@ pub(crate) fn expand(
>  ) -> Result<TokenStream, ErrorGuaranteed> {
>      let error =3D error.map_or_else(
>          || {
> -            if let Some(default_error) =3D default_error {
> +            if let Some(default_error) =3D attrs.iter().fold(None, |acc,=
 attr| {
> +                #[expect(irrefutable_let_patterns)]
> +                if let InitializerAttribute::DefaultError(DefaultErrorAt=
tribute { ty }) =3D attr {
> +                    Some(ty.clone())
> +                } else {
> +                    acc
> +                }
> +            }) {
> +                default_error
> +            } else if let Some(default_error) =3D default_error {
>                  syn::parse_str(default_error).unwrap()
>              } else {
>                  dcx.error(brace_token.span.close(), "expected `? <type>`=
 after `}`");
> @@ -358,6 +377,7 @@ fn make_field_check(
> =20
>  impl Parse for Initializer {
>      fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
> +        let attrs =3D input.call(Attribute::parse_outer)?;
>          let this =3D input.peek(Token![&]).then(|| input.parse()).transp=
ose()?;
>          let path =3D input.parse()?;
>          let content;
> @@ -389,7 +409,19 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn:=
:Result<Self> {
>              .peek(Token![?])
>              .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?=
)))
>              .transpose()?;
> +        let attrs =3D attrs
> +            .into_iter()
> +            .map(|a| {
> +                if a.path().is_ident("default_error") {
> +                    a.parse_args::<DefaultErrorAttribute>()
> +                        .map(InitializerAttribute::DefaultError)
> +                } else {
> +                    Err(syn::Error::new_spanned(a, "unknown initializer =
attribute"))
> +                }
> +            })
> +            .collect::<Result<Vec<_>, _>>()?;
>          Ok(Self {
> +            attrs,
>              this,
>              path,
>              brace_token,
> @@ -400,6 +432,12 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn:=
:Result<Self> {
>      }
>  }
> =20
> +impl Parse for DefaultErrorAttribute {
> +    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
> +        Ok(Self { ty: input.parse()? })
> +    }
> +}
> +
>  impl Parse for This {
>      fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
>          Ok(Self {

