Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021127.outbound.protection.outlook.com [52.101.95.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60B339B43;
	Thu,  5 Feb 2026 23:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333230; cv=fail; b=Oecwy6YanvkEZa95EH3yANfrZqTdBCE6uwwuhPQUxOqgQQdNvsVQirvo1xtOhLaRAQvsjO841zwhN0lkQagX3LtEzpYBfAMzxCkyU99huVG65C4iCbMXNV/YTCWhoNNBWYotjX3Yu+QlAD604w5E1u7OiSn7UdW+PRsT1NSb0Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333230; c=relaxed/simple;
	bh=YM0E3Lak9hdrQSncpTF7xtZxPkYYknujcluzhCgdNlY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=p4gBswsd4UBO4UhjCQmbWOmXxrX/dFs/WgOYvoTJbCjy+I+e802S4117zlCzpJO92XwZtpDnV4icZqLqfQ23igE2j52jGwsNXfncl2g/8wo+YVs1cINRxv7CnHQTALTx2d4FJ6rFgY/Unmte++owa86/+/Z+DUpH8zVrQ7FswnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mJwNpntA; arc=fail smtp.client-ip=52.101.95.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mJwNpntA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzDPXpTVxiyf/csygGugDK9bYU24ctNwDlpkeg6xGvU8oGqPciiFoOhkiFb495Rg99VzQBXYHpZmZq06DdqREB447FySyMk+itabAjEsu3pD0tzTZxUSnE/bHShrkPfsF/yI0KQ0BHW07IoL03FOaIvEU4ewjOPKmVsyT4It9vUFba/UpignFkKrkErNxFuH3iRVdqzIjfLI68FDcPM48AFdpEm/R+3kKd8UtEtxqKCh++Ya/HKXDLyOxDz5G4KdHLmpx6HhQhsyk1byjQmTuM/KVTwNApl1sANCT4r0floo2qJZIVOK3pbdiRNl/lwwM8BcShhKaKQLLSTlRFQRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uawtn3gAaGQq2Fmv3HCGtl45ceqRBNWYH4IvUjGKqnY=;
 b=FcoD+p1E0/eU0FE97iXJkzqWeihBGI8bLzYUUL4YW4Z83dPCYSVi26J1+dSnl3f9NEX0qnmTvnfYTZw6J+/WQuRK0onoaJB7tSy9G7xZu8zH6VPE7gisL34KRgiNyVYCQ9iMUznJp32RTU0fQcqdW+yawthN5HJyPXh79gkTzkLE+TUZgUb6yel1yK0JUMRhArItTZwxEbmJAQN4TVIrpCwn2EqLMyx2VPpYS+kTfxb8H8UZQ0j2BpPS13YkH/2CSY+a7ofMsoUWbbUMtUEsTL742+f1P4GLlhtrUbcoKerJG6Wexjxfz26E40wUCVl+kfWTjKcZKD6n2E0Rud6T/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uawtn3gAaGQq2Fmv3HCGtl45ceqRBNWYH4IvUjGKqnY=;
 b=mJwNpntAAQx7cEksxkPCai97FcefmKEjXtDz1IVhPxngijSdi3rs4qBEr/abQT/PP2Gs6TcUx0HIUaEAMHlk62S7RQN9X8rjfFrmNxMDbcsqDS69uKf5cmxSVA3sdRF/HxgXCyYGxlmkhG/XWIIIVKhCFEHl5VufwXi/oS+MvzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3544.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 23:13:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 23:13:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:13:48 +0000
Message-Id: <DG7ER5HMAXWN.1LSD3BVNJIGUX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v18 2/5] rust: helper: Add
 spin_{un,}lock_irq_{enable,disable}() helpers
X-Mailer: aerc 0.21.0
References: <20260205204709.528234-1-lyude@redhat.com>
 <20260205204709.528234-3-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-3-lyude@redhat.com>
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3544:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ea433e-db61-4824-1b53-08de650c37d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFBDcE1BVjk2U2JiRGxydVkwOFYzMlJwNDk3SVJVRjRMWExCSmRnY2ljcURx?=
 =?utf-8?B?cjcwMk1MNGl2ZTJpZFVoNXl3WnNOYXZ3MHM1Qm9jN2s1UDJseFBBQmFIMXB0?=
 =?utf-8?B?MUY2ZlBHdnRXZWVaTXhjZW9rSktORC93TXdsc0pEZzAxUkJVd091Q1JNb1Z6?=
 =?utf-8?B?Z3VsYW9pMWUwQnNncUpPeU14UmFtMWR1NnprK2RESFMwZ1pNcy9NWVliNFZw?=
 =?utf-8?B?cHZ4QzUwbTA2SWJxR21kQ0wzOWpQOVIyS2pxdXFPNnlZamE5bUdnWTZWQkVx?=
 =?utf-8?B?Y3NRK2l2UUJWTFF2TXZYeHczVEpMTVFSdHhHL0VBRHl6NUFEekxKRDRWWnZM?=
 =?utf-8?B?VGJtQ2VqZEZlc0RtdDRlMU43czlkL24yR0U1QitmQXRpWkkvdndtNlFYMW94?=
 =?utf-8?B?UFBRV3R5UGtseWFnTUNHd21vUWZmYU9qU1Rqa2hOVGNUUWdweHRLMXdsN0dD?=
 =?utf-8?B?QjhOQnFYaHpJT0UyT2tCQXZBeEFJTW9LQWVNdzdhQ1l5VVpySTRROVlwV1lJ?=
 =?utf-8?B?ZzBJRzBQeURGdHhDRG9YY0Z3WkVCeGo3NDkwZjd5dTQvM1h5UzhURWtiSVZk?=
 =?utf-8?B?RVZwUVk3OWIvY0hyQW93SDVJZkhQc1F6T0R0cUJWZzloNUwzSDA4d1lzQkJy?=
 =?utf-8?B?U050dnp2cGZmU20wWDVma001czFZdDVhSTAzMHEyODVOdXNEYTk5TUNxS0di?=
 =?utf-8?B?Z0IvYnk1cmFBdnRsSXZyM1I0VEo0a2lBTkdjUVBjS0dnSklFZm1hRExCb0Mz?=
 =?utf-8?B?SUhuM3YybDAvbHRDYlRxajJQd3hwbCtUNWZZek0xZEhSbklqR2EwUWxMbHdV?=
 =?utf-8?B?V0l4MUlCSm44a2hCZ3VqeHk4Mi8wcW0wbGhDazJCckU4S0t2TW1WeG0vVmtO?=
 =?utf-8?B?Q0RsZDJzRmdRNlpLeWZDbXRvdDE3WWtkRUdKTVNsTVR1cUJZUlkxemhZTC9t?=
 =?utf-8?B?NXUxcmFGaEJzcUJqUHBDZUZnRktnZmg0NThmWXFiekJYMnphOU1yT0oxQzhu?=
 =?utf-8?B?MWZtOUpuRjNTa3BwUWtzRm5PZktBMVJnYUpVNEtnQjczWkFhNXJVQ251aEtE?=
 =?utf-8?B?MklKZE1RamJaanVSNUVZVjVmVndiUEhSenVsTzk1R2RhOGl6czh4MGIvSDJp?=
 =?utf-8?B?QUFDT0UxcFg4QXozdThtbVc2L0xsVDQ0ZmxTbUFyczRFeVBDNFFTZ1RIQjlh?=
 =?utf-8?B?aDdNdlJ6Vm1QMjVoM3JtS2RQQU96SWtPZEhZTkpzRVFDSk90WEF0cm1BUlJT?=
 =?utf-8?B?alB5amhHelVzdytoU0NzUDNiamFHeEdxWWY5K3BEQmtUb0VPYTNIVjRHSTFl?=
 =?utf-8?B?TDNTMTZybW9BUFdwQjJQdW45TE1RRmtHQnA3M1JyYzlGbmEyb2hzZ2ZQeVBr?=
 =?utf-8?B?WEIwTlNGR3BpdXQ4T1NuL2tqOXp2dnJ0YXBQUVJLaFJrMHY1a2RvQllxTWc1?=
 =?utf-8?B?QUkrQXpTSzloZGYxSVdTNXBheElNcXdnR1RVMUZEWnY3elVNdEg1clMweUhx?=
 =?utf-8?B?eVROU0hxWEdVWDBscUtES1VvSHgxME9VZXZUTDA0VlVQdElVSkZ2OTE0Mlhq?=
 =?utf-8?B?QTM5NG5NdnNKeUFMVGtpRVJ6VTlDQURtK25rUTJka0NObFZwRlBuM3lDdkgy?=
 =?utf-8?B?VDZrejMvODk4RW9HS05Dc0U3ZS9rZUFCYlJOd0pLek5Bd2s0d1Q4R0pVM1hS?=
 =?utf-8?B?MUFUN2Z1ZnVNWUpGeVNqekRCeFpMT3UrUmdrSGtNU01CVXlWZU9jNkJCbUU4?=
 =?utf-8?B?dEFtbnNsdEFDV01KekdTQ0xKZ05nS0tJNGR2bjFoT3ZVcXRJb0tqV2ppRUsr?=
 =?utf-8?B?NXBWZDdzSU1ObnpjSkM2NUt6WnNXcmxtVDBHODE2ZHRKbHMvY3dvdlBqVlA3?=
 =?utf-8?B?cnJVcTlBQXh4bWluM2RRM0JGRW1QdTkyTUh3cGFHb0ZRVHJ3ajA5QU9OdmN3?=
 =?utf-8?B?SUErYVBheUdkZ2lJTTBlVWo3aHIzaHN3WktpekhuQ00xZWkzQWVaaU4zS0hv?=
 =?utf-8?B?cWMxaXY3ZCt1QkJXNTJwc0FMVG5WdDBkWjZYSmMxWHRBZTRzWERLSVE5eHdM?=
 =?utf-8?B?VmNjbXJXUVNQTEpLUWZKaWRzUUVsaGM2aTRjcCsxQWpSU2c4ckt0cm81cnVK?=
 =?utf-8?Q?O+nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVRtbThmNk9mRmVza1Q5aEw2cU5yajBGUFhEWUN4MjZ1aU5VSXdRNmFhdzVF?=
 =?utf-8?B?TmF3dy83Nm9ROHRIclBkZUhBSk5PS25uOVQvSDJudWJUKzVRVXd2YzBCdkFr?=
 =?utf-8?B?WndOWE11dm13WGtRdGgxSXViZzRGN1kya2JxQWwxc3RwZWprU1VtNWVwNnA0?=
 =?utf-8?B?NnlGM1gvWFFNVTA0VTMzUUhiZEJ0QTJYRXBEWUtlVE1WMUZ6N1VzUXJqb1BI?=
 =?utf-8?B?N2FGNXk5U0Jwc0RsZEhQODBQN084V2xQR3RSVlpzcmNobGNrd1hHd0V5QU52?=
 =?utf-8?B?NVVkYkNLbWRYbzFnTnhXOTJycUh2TEVGV3VYNFFMZHU1RTVPbk41dTVPcm9h?=
 =?utf-8?B?Qjhudk1uYkZwZ0czYVpRZWF4ZGY1b3IrdFQvUUs4WEFaVWxsaGFuTFBXVkFp?=
 =?utf-8?B?N3RJbDR6SlNPaE1sT0J5eUlBVThmL3kwcHVTSFpQb29GcjE1ZFU3N0ZlZFV3?=
 =?utf-8?B?NDhvcGV5V0dMTHB2Wjl5UXV5VGNFQTBIbEd4YUZLWHhJcUVJQzd5QXl1aG9t?=
 =?utf-8?B?MmozWjNENCtHVmovS3J1K09IODFMSy9ON1VteW9mSnJmTHNOSGFrZGtKcWlM?=
 =?utf-8?B?QitZV2I2aU5OdDlrYXRENUVEVmdVSlJaaHJkay8rbDViaU9iSndPTEZuV2J3?=
 =?utf-8?B?ZGkxVEN4aWUxaWdCVWVBN2xxSE1oYlVqeUNqU3F5c1M5RkZhaTZScHFLZVhB?=
 =?utf-8?B?R2lrTWdOOTVhOE9hc0NSTGR1T3lsTkdhRk5ra2h0bHdLYWg3R1hORGI3bkNG?=
 =?utf-8?B?VW5NMWVyUkYrV0E1MlMwSzBlWnVGZEdjOFJITEIrMU1MM3JUa1VpUlNoVldL?=
 =?utf-8?B?NXFzVDhKb211VEdyR2dLelBzemhHRnA2UW5SVmFKYjBkV1FWcm85aTIyQWRE?=
 =?utf-8?B?cEFmRVhWbER6T0VZRjFxWTlGaVdyRHRTMk1pNFZuZk9OK1pseURGZW9SdlRl?=
 =?utf-8?B?RHpjWjV4RlF0clR0MmpjaGs4YXlCZS9sZmI4MjUrdWdWZGgxUEZGUVkyakww?=
 =?utf-8?B?WUZqbHRBM2xqajlwTDNUazMyaGNsdXZKbi9ZakpWNEVuSVFwZnpDejJ1YzZa?=
 =?utf-8?B?M0ZhK1JubVN3M1QvaDRQYVZXdzRtSGV3K2tUQlRsZHFEUHVzd0xzdjg4UVlJ?=
 =?utf-8?B?UG5mSkphWGc0U09udldNZ0dDOWQ5ekFVUlpEdkJSdDgzOEttVGdQamhjQ2lY?=
 =?utf-8?B?aGhjY2ZaZWh5S0RTTFg4d0Y2ZVZ3QXpVN1psVkh3TnBZMGV1a1VqQ2NCVW02?=
 =?utf-8?B?dXlTRGdCalE2Y2x5NnlDVlJQQjZZZDZ5Y2JCdis3OFBhVnFua21TSm5sRnRP?=
 =?utf-8?B?SUdLTFJwZWthL1FrcDl1VkZTRTRBTWRaTk9kVnBUN05PZk1LTGdPZWVGN2VM?=
 =?utf-8?B?MXZiUHVjaVRHK2lFbVpxWUIxNDk4dThhcjEwdHQ1T0daZEFmdS8rc0x0QlZm?=
 =?utf-8?B?OHRpZ2RXOHZaNldYeUpCaHZobTk0TUJpTThNekhEZWdueFcrYXNVOVFGSmVu?=
 =?utf-8?B?c2lkNWxJRS85anRTNnBMMnJVSXhJVE14NzUreTR1ajVHSytINjZwd0dYMlhX?=
 =?utf-8?B?YzNWbFhzc05BOE0ydmEzNVEzMVV5YnRndFdTb1pSbEsvUENRaGN4eWs3RjdB?=
 =?utf-8?B?VXAzVG5BTzFZd01CZFBEM3V1NmhvMmdDVVc5aTA2eXdpQWswOVI2UGJ1RFRo?=
 =?utf-8?B?b09CZ2J1b01mU0VkaW9lVmFjaUlKSGVsdkQ3bGNPNEdTT3FtY1JrdTlITW5q?=
 =?utf-8?B?TTMxR2loNGM0c1B4WG9sT3JyWmF5d1dlcW9FYTBLYWUxUzU4T3Fwblc0SjJp?=
 =?utf-8?B?eWpGQmlrZEtmVkJFVjRzK1U2Mkp0YlRBdW15ZTJSanRwQVVLN0I0aGlTemFP?=
 =?utf-8?B?RUVoNHRBb0lUS0h6NWNDZEZFaDdQeTM1dFFiZlpaaW1yQnE4SUgrcHhqeTgw?=
 =?utf-8?B?LzllVFZ3TmhDRUVYdmloNCszRTlGa2NDRWdpcEtCRDRrckFaNmlRYS9nRFZQ?=
 =?utf-8?B?QWxaSHJkZmlQY3lOZGVNbElnTGhDQ0NaQXgvVkg3alkxMDBhQkN1M0JiU0ZK?=
 =?utf-8?B?bjUrVHMzQUVPNmRWVWNoSUlpeWVBOC9yWFc0N1BEMkR4b0YrUndHZzZ4Z0Fl?=
 =?utf-8?B?ekFENXBwVkc2eWFSY0IrTzJRUU5pS2s4a2d6OE5rSTd1M1c5S2MvUFdQUzNv?=
 =?utf-8?B?RUZ2N3p1RkErNkNydXV2bU5tMGtOUUpHTXBHdlRyVU9DdlExeHN0bVVkMnQ3?=
 =?utf-8?B?VDdWcG92MHRwVzlVYlRrK055c3VjanJzZDF0bmhVQktaMm51QXJKRVhlbkJ6?=
 =?utf-8?B?d2FnY3IwbFppVmdiSnJFcWpWMFc2d2FkQmJtWnNWMVJESzRhYWlrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ea433e-db61-4824-1b53-08de650c37d9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:13:48.4789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fcl/8t63JbxjTxhn7wMnq4ecjhejp7Uo3zAkB6bEw/b6cVwoFL4p19SnNHYUf/V8LOMygfJ2dcOyHWNd/aDysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3544

On Thu Feb 5, 2026 at 8:44 PM GMT, Lyude Paul wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
>=20
> spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
> functions, to use them in Rust, helpers are introduced. This is for
> interrupt disabling lock abstraction in Rust.
>=20
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> V18:
> * Add missing __rust_helper annotations
>=20
>  rust/helpers/spinlock.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

