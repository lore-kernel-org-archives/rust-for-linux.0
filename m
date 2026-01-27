Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBC342507;
	Tue, 27 Jan 2026 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510520; cv=fail; b=TCRw1jJHltde8cADGHOQhp1Ta2nk4Da/odEWExksUmD7HyOIXrs6UdcPoGQTeQvdtD2MQVvKvnJ6vEc6uSEQB4QZ9FFM3YvXxR/54QqCKZ7T2zH4eWWJ8K28otngLAIkiUqtnOzc7NV38Q0mii00poWtvCqYeWR6FpjNsbgVKQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510520; c=relaxed/simple;
	bh=vgbYr3TxlEaEdqyxixi5gc1TZTi/UjxA1TnvdWdZZQQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=cjt8Sxk5HaLLGLwmnJpMpZj3YZUyp/aLVMqCzjXuRGV9qhyxq/GTQNUzdxOTSaGN1Hgps84AUiE8alXjLUotspTZIBAHk4yXoyfjIlQAR/SwbRThZAiAImhQ7r+P0B1TY+lcNZGg1jQRlqW6BoGht97eXWBvThrLUzlfeYXYV2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PCjRi5Gu; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PCjRi5Gu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayBo15xGtk/eVZ+6vO/9kzxPr3jHUD92jgdKYO9Lzs9V+zMAzJEpHaANTC0hh1QUFLGkFJ70GIYky4MKQN3URuMBJ4ebgAVJUL5fMjjqD2VEzbVxncYMb2oh+QPU219dIC0ZVOnpKtFBq0trRI2uF50Zsl5Mf5EEScIMPAMQlysfD6eQMHTZuc2ENgtQorQdSZSRe4OnDSBySqISaACv1ZS7H/bpEjIqpCgz3oe0Bqdyj8T0iEWcaht090ufhKhsBgbSGZ3AqQLsaaA3vJPPEmY3jh99lWMBzAiXLlOedD5KaINR71AadNQjJz8X6rv0lhSpk0sSI3F835G9WGHsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcITMdoMm7sIaFvxuzqxndJB599dBhktXAXJg6YSsvU=;
 b=c9INpuzI/MZCFy7BaxZpptYQwlJ4ogTCc+L90wv4XL4D1uLZtn1CyQDJOt4MathpM7gHO8kbQLe4rBu2/wcWxwemN2iflIMm/e3LkdemCp7gFQZp0yxGQf7vyXwLQuaG6FOu2RgejbnalC1i+4CeRSscpvfy7GSaytfO5d1dvYze/aARMd0cUiSrPigEfmy7Gvf897rwnHSHlN8WmkMSqvFFA4xalpSzoKChMY+KH70cEenGp5WDWhCYIhNeQkgQJopZcCXC+K3rPlxaaC4kQxHjZGk/n3HBIdCLY+KcaMU4AzLKufmOd1Y7vIcyigca8nUBgl2aVnzfDixU056FkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcITMdoMm7sIaFvxuzqxndJB599dBhktXAXJg6YSsvU=;
 b=PCjRi5GufFMFIHvmrg2YeqUrkH81cMIF39AKbBSKETl+BwRVjAYggiyy40zw85tDztvQvYq6NKMD5putAXIePWkaWlAhtllIcs0cSEoM5aBp1CiUqRPJvavnlPwDCaOyxEaj9OWayaZEhCeompt9IXraci1pPflxtvFRhRh7UBUja6/FDKyyO/iTcHSecEEVc7/7OLLNYkU2U69ocu2zlw71HkyJiZ83hVvOhJlW7wQO/+ucAN3nIaxC9sWcfONdl9S8yItT5/cfdLocNEMepy3iyYRIhaQknJxOl2LSbHz3q5ByTMZc1phRoYlOS1gHet+YzwTs+n8K+cDgh8KxQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 10:41:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 10:41:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 19:41:50 +0900
Message-Id: <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com> <aXhD4sI6MHdAvgNT@yury>
In-Reply-To: <aXhD4sI6MHdAvgNT@yury>
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 582b909d-6b4c-46c1-00bb-08de5d90afec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzVNb3gzVmtIbTZoQmFxN1ZLRFJEdTI0WXlDeTRIQ1ZoRXZmUEpGeWhQVTlO?=
 =?utf-8?B?ZElXUGVxSUVkZ1JscmVzRHpXN0I0bnd3cmlIZ28zNnc5YjBWL2VYZFZaeTc5?=
 =?utf-8?B?ck4vd2U0aE5QNENvSDhiM1JKa1doQ2hma3E2UzNIQlR0Z3RBdnU4RldhbnF6?=
 =?utf-8?B?UTdWdFFOaGJSNjV2MndIdklIbVpsMFZBSXloZzh2OXc4eEhrRmxNaEJEUWRz?=
 =?utf-8?B?eUxFNUhzRHFBQ3Z1Z0Eyam9yVDd2NUd2WmZMQUk3QVdoTjdNQ1FZTXJObHFF?=
 =?utf-8?B?cWpHcDlTY0x4akJwQ05oZzdPRGFlZzZpaVJuNmQvOE9OeTZ6b01PTWVMQ1Bw?=
 =?utf-8?B?T1psWEtSVlVtK1M0QjYrdGJBMG9mdXJWMHBUSXZNbzQ4dExYaWkwbTBPWE5U?=
 =?utf-8?B?cUovZnNYZTlVMHZONmFORktWdG5qbzBpN0IrSnhQYndoUFRSVFRwZS9MNkV6?=
 =?utf-8?B?TlprK2w3eUNuYnpWU041T3IwWStXR1dlSnV0ZkFFbXpDeWQ4WndMSzVnOC9B?=
 =?utf-8?B?R2Z0WUd5V0dKdlVwWUZjc0Nva2E0a0E4blhhZEpWdUo1ZTV0S1ZsZWkrNVcx?=
 =?utf-8?B?Rnp0aWN5TmlhQmh3MDlQMURiUjZNRmY2ZUJLUWxJRHhwTFhOY3kwZ2dBOGh4?=
 =?utf-8?B?L2RGWVlBV01kK3hmREVqSmF3OFlOMTduUElRMjZNQWVNWnVIMUVhWW9TNFFB?=
 =?utf-8?B?ZklnQVlCVEEvQThKNVoxWGdEcW5mR2grOVBUeUVhS3hwWUx0a2NRYkdSTUt2?=
 =?utf-8?B?bjNuZVVRUENhOEJ0V3NPb3ltb3dCWmZ0bTQybGEwVklXU3JFakJYZ0E4T0JG?=
 =?utf-8?B?YWtmZ05oQWIxL25GeTNpdXNVSjExM1podHpTNXZSYXlLTGdwTW9xL0VMdnZ5?=
 =?utf-8?B?VWd5WkFadWFweWxtaGNmeEpNcis0RW5NQlM2S1NqbW1sM0h2QWdSc1pZc0pJ?=
 =?utf-8?B?ZUY1MzNjREZKQmx0Rk5wTXdKbXpnNEdpL0VOUFpJdGtvanJLeVFBSjNXZ2tx?=
 =?utf-8?B?TENJanZnd0hUYVJWcEJPQ2lzY0g0YWJYMGl0T0Vpb21ITzMwNU52RjQzb1Qr?=
 =?utf-8?B?dEtqc0ZQS25VRjRWcEs2b0taTzBpY0ZHcHhXTm5tK2p6VVFGVVpDMDhBcllp?=
 =?utf-8?B?aC9NTkppZk0xbHAzL1Vmc2xlZXR5ZG84UEFXVG1KWE8wSDVobjhLeHhmRFNC?=
 =?utf-8?B?clVGQXlXb3NGV3FlV0lrRXYwVjcvaHBlVkMvTXdab0N3TVhvays5MEZyWThx?=
 =?utf-8?B?cHdhaHlTYkU0YTRJRnpZMUlQUjZWRVVlUyt3RW9zZVlGL212V1dkUmlwY3FL?=
 =?utf-8?B?aUtFNnppUml0bEl6NituclUzU05nQ2JHQnhoUVBPZDhPNWQ2K2xqeUR1Rlpv?=
 =?utf-8?B?MXNnMzdPOHpTOWQ4VzJEYll4N1N1VU1RUC9rU3lwVSt1ZC91d0lWQVdETC9H?=
 =?utf-8?B?VHM5U0xLdGxvY3hOMEVCS29pK2VvTHBYcm1KTkJrMlhFd0FyN1FNbFpSMVpw?=
 =?utf-8?B?SmhScGdNaHArdlhPTnBULzhXNTNEUEIwTHFPZC9PNFVYV1dyN0xCVFhrd29Q?=
 =?utf-8?B?eWVOOEIxZTlOWDJBSkF1K1Q0OHFrRjI3b25uckwxOHBzQ2dneEc0aXZZTUVH?=
 =?utf-8?B?Z0ZlbDRyVm16QTVhMmlubWRtamhEbTVIc0QzZ1NWZG9qeUpib09KRzlYWTFp?=
 =?utf-8?B?ZWpNNkJ2RjRkdHRGWUw2SXdxWVp4cVhtc1RVVENEOXg3V2Y0YnYra1pOU0tW?=
 =?utf-8?B?RGhZTVVkY0pYY0ZpODA5aDlhTFF2NjRkbENZUWZxeUlLY2M5TDFRY2FyMlh1?=
 =?utf-8?B?NnhqUFllQVR6K2FhTmV3TXdPUkFudDR2MlBBLzJYOW5GbVE3QlN5VXhPd0ox?=
 =?utf-8?B?WlliRlV6R0JNNVdDWktXaGQya1ZDNFdVOEV6eUJiVUZmanJaT1N2cVc1bnps?=
 =?utf-8?B?ZmVEWHpPZnpkRUU2aDhTR0JiL2FlcEIyOEVzZWo1SkN4N3FENHFJWUdzRzgx?=
 =?utf-8?B?UUwzd25Lb21VdHZETlJVM254bHRlQW1pa1FRdVI4Ylc5SHFtdm1uMnc2Wkps?=
 =?utf-8?B?MU0vZjVqbEdDWkZTS0xjcFo3czE4Y2N6NC9udFVuV0xWcEoweVhDcnJFSmVr?=
 =?utf-8?Q?LSCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhPTTg2bVdrd3lnK1hwSjdxSEgxYmNnQldRQ0w2Z2JDVTRzSFJWdTRpbGRm?=
 =?utf-8?B?NDJES0F6VlkrSUU0Y2FvMWdVOWVrTTNjNEtnVWVuT2I3R2NGd1dKMGVndXlx?=
 =?utf-8?B?bVZXYTE1UFRFdEFzNUxyVXh4ZlpFWmVpRTV2NXhtQTFjRCsrKzd3UVJnV0xT?=
 =?utf-8?B?a0w2NEQvN0QxZm03RGZ2bEdPUCs1bkFnc1EyNFhhRS9EdWxtamFRMVA2RzNt?=
 =?utf-8?B?dHNiV293aTRWclBESE9CYUM1R1AwMGNrQ00vK0dVQ3VrYTBtam4vaHc3SGFx?=
 =?utf-8?B?RStvVlBnelpSbWpZSTl5dnFTZzhOSGcrUDJCcVd2SHhpNWZKTEwxSDdJdmtE?=
 =?utf-8?B?WEw0ME5lMnlKVVY4K1ltNnNYd2d4bXVRNDVJM05pbUVnSk5mQjV4OW5Pd3RN?=
 =?utf-8?B?OTdHU1BoZzZuL0FGd1ZPN0dSM0VwTmZmaFdreW9TTW5Bd2ZWMEJjd2Ezc0JW?=
 =?utf-8?B?WWpqTmJWbWUrd2ZKbXlZYW8wZEZzV25QMFhmcnpHdW9zR0xnZU5pcFBOWmxB?=
 =?utf-8?B?bXZzUXJLZVcwTEdzVUhBc3JQQnJUa2NCS2V4UlFqdmswVXJUOXFGS1JNZU4r?=
 =?utf-8?B?eFlnQitDNGxSM1BlTzB5RDVLVk5rcGRxRWJEUDFZcnR4QnRjaTdvZVZ2eVFC?=
 =?utf-8?B?WHZBVXR2SmN0c1RMSWpzUzRqVVdyUDZRdWEwRVV2MVNHdm56TVdkY1pjdDMw?=
 =?utf-8?B?c2NnZVcyMnZYaXF4STZRVzVnUzJKU1JsM2JJY0YrOHFtVXBNTmtScjgxUCt3?=
 =?utf-8?B?SEI4T3VrRk9rQUZkRnYzenJwT01LK3c4eXVKeDRETGw1NXlyR3RrRVcxV05W?=
 =?utf-8?B?SjZHMnFyajBpbmg0TWpmeG85T0I3c1V5cFhtV3RYUHp4R2VpK2hldU43eWNE?=
 =?utf-8?B?NnZVWm1GeUFLMUwwNmU4a2hMcnFNcFZIZGNHMHlHYXhvaCtaT1VWenRmTTNT?=
 =?utf-8?B?MnYvZVZhY1BKSkoyN0g2RFRTempyUk5XckN0eVE3blZGTW0vVFNkWnZHZnNS?=
 =?utf-8?B?QTVXVi9ySTJDWDZtUEgxUTBWc1hOaUtmYjRoRW0wMzdPb1p1eDd3K1pOQ2lL?=
 =?utf-8?B?ZlZ1UHovbGZ2Y2tRWE1rWTF2WDl3SDZDbUQ0cXNVeFlVcmlCTHFuVDhIOXZX?=
 =?utf-8?B?eVRSNUM1T09PZlJibVpPWXVLUkVFRU9velVjRTlNbUR4UUpoQ2xybEdBcUpE?=
 =?utf-8?B?ZnNIMGRDRU1NQkdDWEF4WnhhWjZYWklpb0Z4d3B6WHZ0UHVxT255YllYYXJa?=
 =?utf-8?B?R2hTckhWc0FaY2VHZnIxTEFNQWxUUE5uUzBBaDA3NUxLRWRBV09ieFRXZXE0?=
 =?utf-8?B?RlNxdHlYNEg3NVI4MEpBK2NVN21uMjdUYmZ5NEIvYlhxRldkY3JCOC82L0tn?=
 =?utf-8?B?SENtelF2VEVMcFo2U3N5WDRkVHNUa2NHbW81b3owWUN3WmpvOFZ2c2ZtRmUy?=
 =?utf-8?B?QW4wam81VkdhTFhtd282bTcrZ0wwZi8xd1VvUU5WWlhldzRmVXBlUmhmOHhE?=
 =?utf-8?B?aDlqWkNtVWlVdStOd2VaS0VZdGZOVEZ2cXhVdXhCV2F4MWdGSlZxeVpHOEZy?=
 =?utf-8?B?NDlaRHZhL1F0cWZVSTB5MS9hN2xwdWViVmVlTGp6b2kydkQ3T1IzNG1XNmV5?=
 =?utf-8?B?SWdJZ2drY1dNdTA3WmVDTTdSWnhLMmpjU1kzeGJHZEdWbk9FU2xtbjNQY2pp?=
 =?utf-8?B?bTdFSWc3ZS9DcFpuNjdzTkxFbWx6WnJMYVFraXdyc1hyTWZ5cHIyenRGM1hY?=
 =?utf-8?B?UXNnUFFlb05TeTB6cExCMEcrdGJlaTR4dkE2MzRqck1CK3pTRVRRSXhiaUVK?=
 =?utf-8?B?bkR2QTZjaVgrNDNCbEpxblUwdWJLckE5Nm90WTV3b3RiK2RnTmxKb3RRMUQ3?=
 =?utf-8?B?bHhiNUdHRTFMMzhrNGVNRzZDaGdwTTNEblByeDVZeVA1UXAzQ2VSR3JhK0J6?=
 =?utf-8?B?V0RkMHR4U3k0K0dVNHp4UGJXOW9rcWt6alIyeUV6bFFWVXBpdmhwQk9sQmlR?=
 =?utf-8?B?WTUxeGxWWCs5QnFwamc3UGRJSGFXdERSNk1BRzRQSHhBbzcwYUEwZVpnL0NE?=
 =?utf-8?B?QkVQTnRZM2JEcDVQSzRHZFBjeFZSVFNOL3NyTG9kdGpvaFNiWjZ1Q1NUa05a?=
 =?utf-8?B?bktxWHdpR2FsRTJnNEhWa1B5Wnc0SnVYMmxFcndWdUJ0dGZmTmNnbldORTQ4?=
 =?utf-8?B?dUVMbllRcDJ5RzlmQ1NvK1hvN2NXWXVGcWlJdFhrbjBsNjJwVExreCtFRTkv?=
 =?utf-8?B?NUVmRUZ6RlVTRVVqWG5KODJHSFJXYUhGQVZvOWxNOXI3aUZEdCtPVE0zVmpI?=
 =?utf-8?B?N0crREZUVHhkVnpzdk83cUMwemxRUGY2aHp1MmxMSk51K2svRjlPQUlYN1Vr?=
 =?utf-8?Q?PkUgOu/7Y8a1VwYgjRpOuktHZj9ZO9vvfu4rGYBFsC/zn?=
X-MS-Exchange-AntiSpam-MessageData-1: gbSKChPNtDNfIA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582b909d-6b4c-46c1-00bb-08de5d90afec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:41:54.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpQLOy0aDdCRX4wkDCSssP6AWRJhcjqGTo30HjsBSWeAo8cSZh1yAAjcTIRLtXuldA9xO7Yu7kbDIj+D7xA/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790

On Tue Jan 27, 2026 at 1:49 PM JST, Yury Norov wrote:
> On Mon, Jan 26, 2026 at 10:25:54PM -0500, Joel Fernandes wrote:
>> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
>> > On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
>> > > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
>> > > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
>> > > > > Add a macro for defining bitfield structs with bounds-checked ac=
cessors.
>> > > > >
>> > > > > Each field is represented as a `Bounded` of the appropriate bit =
width,
>> > > > > ensuring field values are never silently truncated.
>> > > > >
>> > > > > Fields can optionally be converted to/from custom types, either =
fallibly
>> > > > > or infallibly.
>> > > > >
>> > > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> > > > > ---
>> > > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++=
++++++++++++++
>> > > > > rust/kernel/lib.rs      |   1 +
>> > > > > 2 files changed, 504 insertions(+)
>> [...]
>> > > > > +/// // Setters can be chained. Bounded::new::<N>() does compile=
-time bounds checking.
>> > > > > +/// let color =3D Rgb::default()
>> > > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> > > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> > > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>> > > >
>> > > > Is there a way to just say:
>> > > >
>> > > >    let color =3D Rgb::default().
>> > > >            .set_red(0x10)
>> > > >            .set_green(0x1f)
>> > > >            .set_blue(0x18)
>> > > >
>> > > > I think it should be the default style. Later in the patch you say=
:
>> > > >
>> > > >    Each field is internally represented as a [`Bounded`]
>> > > >
>> > > > So, let's keep implementation decoupled from an interface?
>> > >
>> > > That is unfortunately not feasible, but the syntax above should seld=
omly
>> > > be used outside of examples.
>> >
>> > The above short syntax is definitely more desired over that wordy and
>> > non-trivial version that exposes implementation internals.
>> >
>> > A regular user doesn't care of the exact mechanism that protects the
>> > bitfields. He wants to just assign numbers to the fields, and let
>> > your machinery to take care of the integrity.
>> >
>> > Can you please explain in details why that's not feasible, please
>> > do it in commit message. If it's an implementation constraint,
>> > please consider to re-implement.
>>=20
>> If the issue is the excessive turbofish syntax, how about a macro? For
>> example:
>>=20
>>     let color =3D Rgb::default()
>>         .set_red(bounded!(u16, 0x10))
>>         .set_green(bounded!(u16, 0x1f))
>>         .set_blue(bounded!(u16, 0x18));
>>
>> This hides the turbofish and Bounded internals while still providing
>> compile-time bounds checking.
>
> No it does not. I clearly see this 'bounded' in your version. Can you
> completely hide it inside the setter?=20

Hopefully the `with_` setter I proposed in my other email settles this
issue.

> =20
>> [...]
>> > > > What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blu=
e)?
>> > >
>> > > You wouldn't even have the luxury to yse `BLUE_SHIFT` here because w=
here
>> > > would be conflicting definitions and thus a build error.
>> [...]
>> > > > What color.set_blue() and color.into() would mean? Even if they wo=
rk,
>> > > > I think, to stay on safe side there should be a more conventional =
set
>> > > > of accessors: color.get(into), color.set(set_blue, 0xff) and son o=
n.
>> > >
>> > > This would just not build.
>> >
>> > I know it wouldn't. I am just trying to understand corner cases that m=
ay
>> > (and would!) frustrate people for decades.
>> >
>> > I understand that this implementation works just great for the registe=
rs,
>> > but my role is to make sure that it would work equally well for everyo=
ne.
>> > Now, for example, Rust, contrary to C in Linux, actively uses camel ca=
se.
>> > So, the blue vs Blue vs BLUE restriction is a very valid concern. The
>> > same for reserved words like 'into'. As long as the API matures, the
>> > number of such special words would only grow. The .shr() and .shl() th=
at
>> > you add in this series are the quite good examples.
>> >
>> > Let's make a step back and just list all limitations that come with th=
is
>> > implementation.
>>=20
>> Why is a build error not sufficient to alert the user to use better judg=
ement
>> for naming?
>
> There should be no error at all - that's why. Any name that one can
> use for a regular variable should be acceptable as a field name.
>
>> This is no different than using reserved keywords in C. For example, thi=
s
>> won't compile:
>>=20
>>     int if =3D 5;      // error: 'if' is a reserved keyword
>>     int return =3D 3;  // error: 'return' is a reserved keyword
>
> 'Into', 'as_raw', 'shr' and 'shl' *are not* the reserved words in Rust.
> Rust makes difference between upper and lower cases and doesn't break
> build if you do:
>
>         let blue =3D 1;
>         let BLUE =3D 2;
>
> So the bitfields should.

We can solve this case if we break the Rust naming conventions for
constants and keep the original case for the field, e.g. `blue_SHIFT`
and `BLUE_SHIFT`.

But again, by convention fields should all be snake_case or it would
look weird in Rust code.

>
>> The user simply learns not to use reserved words, and the compiler enfor=
ces
>> this clearly. The same applies here.
>
> Most likely he will learn not to use this API at all. The worst thing abo=
ut
> those 'reserved' words is that the set of them is not definite and will
> constantly grow.
>
> I'm trying to say that this approach is not scalable. If a random client
> gives name 'invert' to one of his fields, and you'll need to implement a
> method inverting bits, what are you going to do?

Bitfields are limited to a _get, a _set, and an _update methods (and
possibly try_ variants for the last two). If an `invert` method needs to
be implemented, it can be done on top of _update which takes a closure.
So I am pretty confident we won't need to extend the API beyond these
(famous last words).

>
>> > Again, this all is relevant for a basic generic data structure. If we
>> > consider it a supporting layer for the registers, everything is totall=
y
>> > fine. In that case, we should just give it a more specific name, and
>> > probably place in an different directory, closer to IO APIs.
>>=20
>> The Bitfield macro is very much required for non-register use cases too.
>
> Then let's implement it better. Can you comment why the suggested API
> doesn't work for you?
>
>         color.set(blue, 10);
>         color.get(blue);
>
> I think it should solve the problem with name clashing.

That syntax cannot be implemented as it is written. What type is `blue` her=
e?

The closest we could get would be a macro, that would look like

    bitfield_set!(color, blue, 10);

And beyond the scenes it would call some more intricate (and unsightly)
machinery. I'd rather define the constraints clearly for users - they
are not so drastic.

>
> Can you share more about the other potential users?

I know Joel is using bitfield for page table structures, but there are
of course many others. Basically any structure with fields defined as a
subset of its bits is a candidate. Registers just happen to be bitfields
with extra properties for I/O.
