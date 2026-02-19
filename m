Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12F72621;
	Thu, 19 Feb 2026 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771471107; cv=fail; b=mVP+AAS7yFTkRSLUHDPJX8jBsAC5JCd48kKTNQVX1caXAAWhgHN2L3DXfdZ0KWc0bupRgUVBVm10KngT7mToLaI8TxwUKoKPBxn2B+GvbACVrS8ZQWE1A2pKav9S4P/JF7xPt869jlHsS0dwcPzgtlrobXJTIN8KUTs1r8YQSEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771471107; c=relaxed/simple;
	bh=rULFo4oPbprkLvcGxsL9CJncYEuL7EbPJT5vfAGP9aU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=r9Tr76O1Z3v9tDDtLn6TUAL+CC2HAIXvujy/W4mCmAS5PcCXM865MW/Z/OsrriQyN18z9ug6Z4vLFLLkapzoqDr5Isv3Mh+dUEpLTDCD7dMZsxhzyPtS0L8l97Nk3EBaOIrO98At0ixaTbfIvqCKjsrE9dzNrZAsFz8k2qSKLBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HwnjkDxe; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HwnjkDxe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxO8jWilvb7YVlaOeBbPJbSyzmxmJV6iKpFXpx08Uu5F3eQneOe4Ui0GpNGinOCOLA74nQ2W1gIf5IgzMV7fqGXFVUU0O23Bm29a3SUri/VFfpdfwvEwqwqd4gAZIueZSzrOg50HvVJA1u9j9o0E5Zi8iqpVEMnEUMeH4Bc4oWFawV6gITssFNd9MkQ+4xiwyMSQxicIELOuQfWce8YNE0h9ajr8Fjc9OZnyddYcMt9US7jSj2qOyJeZ1yjdBoEpnr0Of1uapDuw4+zx4z7ngOTp0tW70TqT/HY73fH9S91w8Ut+P8Dd92JHPS/rWQ7ptAUBJyjqNbZ/288z6pAKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rULFo4oPbprkLvcGxsL9CJncYEuL7EbPJT5vfAGP9aU=;
 b=h2MgkYxR/GmV7/1Ao0n7OH945shyeHa6bgFqhvXNvvcCant/BZFVQoJZxjSP9jihKenJEzPtX/EwL8aygC0lzmLun+zGqKQtKxDyTGRf4M5BEy108kIlI+FhU+RvmiMug32UlmR/Xh4juMSn0NchdZSXfICLLyXPjmj6gXOR2ru70pfI7v+M97RmUK1ukOY6Ef3jZvqM0Zokc2NQ3WOwDsZ3lHLVwb+LyrCB1pfGEtLzmWnX6hDgP3RsFhAH2MBiVJStfQgHy8DixH5cQ5j49qsXMFtX2xy56EMLbv/Hhrdz5jqlu/7AyBRfS60Y4ua8Befwo7MpvsUHXPK1Dz6wtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rULFo4oPbprkLvcGxsL9CJncYEuL7EbPJT5vfAGP9aU=;
 b=HwnjkDxejFrn0oD++3KfZNSqvG3PXz875rb5kpoFY5dvNpV3yU35etXuwrgDBWq0a5v+v1BkFcNgnWhDuJao4EC32uozINGj4JKG/fDMI5KLrzi5qpqjX00/gxbOYX1A+Qtt/GQ4Twy84EeEQoQt8Md3WrN7SQcwrECvmlpA2kuL1PuagGlv62CgNQsH8zMdH6H674CUVYFzfFgLxKUGyKtTWT2buS0GA+BLXGvtfMKH8c8k5a1BaR5B2kyyqmHYA9NcLh6VJKN5BbsL+0WJrjGc1Vxh5sQYUEYMRPxqlQAtMOBgjbmW7eoWbioPbUSzlIIohyZwy6sYTQeY8FJsJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 03:18:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:18:21 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 12:18:18 +0900
Message-Id: <DGIM3FY9JHZI.1321KKJJPX0WI@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v10 4/8] rust: ffi: Convert pub use to pub mod and
 create ffi module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-5-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-5-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4980531e-6c17-473c-dce7-08de6f658924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWtqb3pBb2JPWE92RGVSOFJLYW5BYjRyc0NBQytzSXduNFpFamc1MUlOZmlQ?=
 =?utf-8?B?TkpmempKdWpZWTBYSGpNVk5wNzVJamZLYVZLYmw4WGFXdUk4UisxSCt0Rmpo?=
 =?utf-8?B?OW9rVnE2emZnY3RtZUd6TDcyMUJOaE5CRE9zcU9XcEpNN2ZOTTB6eThqazRo?=
 =?utf-8?B?Qkk3Nk80aDJCWmJjbFF0MTluRHlKcnpzcEZYdFFQcERIYTRteWRBNVJvQklh?=
 =?utf-8?B?Y2dPd3hBdUIrQllONUVCMjJ5cEt3UmpkRzNtamQyMGRpN0tuVDN4QTBBa2tT?=
 =?utf-8?B?NXdZdHJlM1g5N0pBcHcrUS9Ua2pVNWlYWTQvbmxzQjRZWVlzUFRjSy83aHIx?=
 =?utf-8?B?VlBMWkVIV25XRHozL1ZhRUJGRWxjVjB6cCtnSlZUelZrWWNQM2gzL21YVHc5?=
 =?utf-8?B?aVphT2dNVmNVTEtxM0NpVUJ3Wm8zNHZlWmI2ZWJLQlE5bnlIQ3VFdHIyU3hT?=
 =?utf-8?B?b2tZa05TSWkwUCtiTXFsVTZNTlJnZFVyOTlwcVowVDBGZnRhV3VDSVFKKytL?=
 =?utf-8?B?aVFpT2xsaWdHL29VajIxZlpuSWpVUmN2bmlhQ2ZWK3JMdWFWNHliWjhzR2x2?=
 =?utf-8?B?SmVxQkhZQVNWcGQ4aEJkSTVJSkpRYjZtYmFUYTlhakI4M0sxR3lnalZ4UTRh?=
 =?utf-8?B?cmhQNmtiTkJ3RlFEcGFpcmtxWEV4b3ZCTG96bVBDM011eGxpVnBTRG16Ykh3?=
 =?utf-8?B?MlZucU9DSG1lQ2JZTzdYMTJKbnpSdWNLQTBFajhuamIrcjJrRkNxeEUrVUk4?=
 =?utf-8?B?STZKQmM2bnpLTmpIV3hoOUtMY0RNM0FPaXgyTTJjdEVPMzVRNnlrTEdoS1ZY?=
 =?utf-8?B?TzVIYjR0V0pkbVRsdkh5YTFTczVaS1N5Qk9kYktwZ2dSMVE3UWRmRnNuL3dp?=
 =?utf-8?B?ZW9XbHBYNUhBRUR4SWdTZVl4RlB0SC8xZ0dtWE5sYXFYZERmQVVJMldpV2lJ?=
 =?utf-8?B?enhRUDg3S25TNU84WHZHMWZjdmQxK0dwWXR0ODgvZXliQWI3VUR0a2tncHF1?=
 =?utf-8?B?bHRsK3BwM3YySXA4UjRwTFBSS3J3UHYyMWZZZkUra0JrQUJsT0d1cDBEZzRZ?=
 =?utf-8?B?R0lHSHUzZHA4bVBjODRzWWplaGVMWWh4Y05YdHAveE94UDJuUUs5ZVpqZ2xk?=
 =?utf-8?B?dWVjUHNzWktMbXNDM0k0M1dSM3BITzh5dWxYbXpXbm16NnZyN3R2S0xNS3E2?=
 =?utf-8?B?ZUh4NElhZEZGUThlRFBLTVE5MHdOR3RjRVo3c05WcG8xbG9Gb3JxcmJqQ0Za?=
 =?utf-8?B?ZFg3ZTQ4ZDZ2NmFOcldLckxKelhDVExmNk9kWktIbEJzMTd3MHlzOW9YV0pi?=
 =?utf-8?B?RGUyOUN1ZFZYY3pnUUJmMjdyblRtamhkUkI1cFVxV1lCd256bFpucVpMYmpk?=
 =?utf-8?B?alFJNDgyZ2pJUlJiR0s4WVBoZzZwTFhBR1ZwVGdJdzcvMG92QTdHU2UwM0lJ?=
 =?utf-8?B?eXkrZWwveUFGcVFwNllSL1hKRlBQekVOUmJtd3B1OEp5b3hXcWR5d09vU0Ns?=
 =?utf-8?B?WjBRY0dnT2l4SUJmMXFsOGZRd3l4eVRSREFlL1lMTzNDYnFJSUNkVVBJNkpp?=
 =?utf-8?B?WXdoL3Jsa3JpUUg1ZkJEU09ZSlF2S29qWHlxcXJ3bnoyZ0RnRVYyaXY5M0R5?=
 =?utf-8?B?Qy9kRWVnM3RPOFhBSU91aExFbEdIWEpJQ3dKaXdNZy82S0oxTG5xRnlSeGQv?=
 =?utf-8?B?MWtZOE5vb01XUzBvMlhGREJUcys4M2xrQ01oYkp4dXlueHk2VVM2Tm0vMEZI?=
 =?utf-8?B?aFFZQjRnZVB6TmtscHVnaVlmeFpqUWRjZldvTXdBbkhFTGpBT1RJWTNGNmZx?=
 =?utf-8?B?bzd6ZHlXNTNtSUlBNlRTMTlkaE9uTjg0bllyY2ZVOXFkQjhFWVFDdVRDNTRj?=
 =?utf-8?B?NHpGWnJnb0ZneVdpNUdqNjl0aXBIZitIVk05b1RyZlpuTDR3Q3RrL3pocC8y?=
 =?utf-8?B?WDNLeEp2b3lkODFDdEYwWVp5bFJ0bGhtZXY5aDJUNzFPTVpEQjdpcHVYaXdC?=
 =?utf-8?B?U0pCajR6WG5JMHo1ajhNOFk4d2pzRXNLZU11eXRieWtOR1NVcTRSU3cyWHlp?=
 =?utf-8?B?aGF0SE5vQUxPT1RlU0thYzZyRUVxeHJoWStsYTRFRFRmRmRuSnhTQzVLOURH?=
 =?utf-8?Q?3MV4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0gxcXM3ai9pUHJzQVZZWjlMR1FtbDVQbjJEeGZQdjVFZ1pPYkt2T1FCRmdl?=
 =?utf-8?B?ZWZmZWROV0h1ZGRqZjgzMFcxWjd5TVZhK3BqQkVlTm5Oc3gwQ05UZENqa2ta?=
 =?utf-8?B?dTdOenVLaWkwaGlWd2N0WEViQkhldTFURXI1dUg2VmJObDJRS1psbmhuWXVt?=
 =?utf-8?B?S0RaS3M1TjlBdXkxRkIxUXByZ3pVQ0hWbElRVWRkdXpIM1lYYi9lUzhraGxo?=
 =?utf-8?B?dDZNZ2hIN0UyTDliLzJXalo0NnA5UFhwZlV4VC9pSW1DeWRRdGtuWVN5cGl2?=
 =?utf-8?B?N2wvVU1pRmpjZWQvUm1iNHFMMk53dllpaUY2UnlSUkg0d045czN1cmJDeHJT?=
 =?utf-8?B?UVFLTkNQaW1sblpPN0FKdEV1dzlOa0k0c29GbHp4TVJsRko0ZlBHNG15Y3E0?=
 =?utf-8?B?YjljYWg3V25HUWlaK3ZQM1R5RzkrWFpTRVVycUx5RVVlS0VYME56SkRpaXhB?=
 =?utf-8?B?UTdWK3FaVFBUQndyZUpCQUZoWmR6Y0FsaG5wVklzSGtSREJSekdKcUEzQ1Fz?=
 =?utf-8?B?OHFsRE9idEUrcXRHb0Y1RjdhSU85M2M0a0RReTZEajJjMzVZcWR2MXVMK3gw?=
 =?utf-8?B?UW1sU09yUysxazRxV3JCckcweVhDQ1A1VHVDSFZCT0ZvVTUvZ0Z4UzZ5V0da?=
 =?utf-8?B?UWtGbjNsdU5ERlF5dVowNHN0NmFBM0FEd29kQkdRejRON2lzOHRGTkZFM3lS?=
 =?utf-8?B?Y3YzaVhmeGFsOTJYUHF6R3FVVnJNWTNMWUhTREtJemxQT20zTGg1Sk13YzFX?=
 =?utf-8?B?TUlLS29qeVBqNFpMMG1nMHh5MUFzakhMa0pmK0dROEhkR2RQZmp6a241UXdu?=
 =?utf-8?B?aGtPb0EwdHpaRmVsV2puby9XSEMreEFrRFY1ZXA4S2JITFR0d2tXMmEyR3pT?=
 =?utf-8?B?NFdhaDFBMDhDWTUxOXkyMldUQVVrMllnbzBsU2pXL3Y4K3A3K2JjblhEdTdo?=
 =?utf-8?B?TEVBc1YyYi9POTIvNCt5d1Nwd2dOcHhSQnFUYmp1RXg0a2FJQm5xN1lHSElS?=
 =?utf-8?B?M25wWjdQQkN6cjRBcTJUaUtqYWtDM0RWS05LVUswbmtYd2hodkQ5MEQ2WTFD?=
 =?utf-8?B?b3RBMm9YM01UcEc5ZWNpUVIvdWZCdWhNRXFEVDdHeXV3dEp1OXd4eWtiWDJm?=
 =?utf-8?B?bGNUVm4zK2cvLzQxLzVLVE5rQVY4R1JXRUQrbDExSlVhdVpCV0FJREp1cUhn?=
 =?utf-8?B?aVowMWJleXBUNmptaHdjT3F3ZWcvVExBWHpITm5XVmptWW5SMTlyWTlmWVVj?=
 =?utf-8?B?bkJSbkd1VkFnc1NYdjZDRnV4Y0xocHpCLzE0eCs4N2FlZTh6V0lCc3g4ZDRC?=
 =?utf-8?B?WjgxZjRqSkNLTlZoaWVIR1NoMTBWT1grcnV5eThYb240VmtBbmpHVnBzMkRm?=
 =?utf-8?B?OHRMNzFuOWVBL1NkTkdxWk9TdllLVDFGZWtJRWR6L2RrMEJwT2VtVXhtc3A0?=
 =?utf-8?B?Q2hic1d5bDhWdng3bzdxRy9NWENNV3pQSStQRTBlcWFiRGxCQklOdURzVnlK?=
 =?utf-8?B?VUZCV2pLMVQzOW8xZFBzUi9RcWRJditQVkMxU1RqYUxZU0pQV2I0dXpzNllX?=
 =?utf-8?B?ejJ0dWFkQzJVSzJJRk4zUWZJTm90TXJkdHMvMTF0dkIvMlhhQmZoc2hiNDRF?=
 =?utf-8?B?WmsxN0I0ZGcrQ1kyR0dSeG1sNTFpUkpCZjY4a1lib0NSS3VOTTVDT2hRVGJF?=
 =?utf-8?B?MUZlY1FBcXdWWjUvZGExb2FNM1ZtZzN2STZtUndaQWpjTUQ2YnAybVpQQ1Fa?=
 =?utf-8?B?U2xPOGVDb04vYzluM2xuNFNwSDh4Ni9oYWFCelRiNFJ5R20wUHpZa1BERkh1?=
 =?utf-8?B?VDRYZWNCNE41d0ttWGNJVUhxa3lCQkpiWlZnYkFNRnZrUk5WSVV1T080Zzly?=
 =?utf-8?B?OVVmQUxhQitoOFZxT0Z0WjBHNmFNTWJqU2c5UWZMRzJseEJpV1hSbE9EemRY?=
 =?utf-8?B?VGFVWVYvT09YZTEwVFlyUWVWZlluU2tiMnRrK2NSYS9NNmQwazdwR0lYR0lV?=
 =?utf-8?B?NFFFWk0zWldCOXlWL1cvNXoxZ2JZZXJ1dDF1elMwYkVhd24vUnpTcC9Sa2lk?=
 =?utf-8?B?SmltNDFlNE9UK3AzZWxiUlFSRlF0dG90NG1aRWZWVEtZNFBRUGdGdGdYeDhN?=
 =?utf-8?B?ZXFBY0QxaTRnTFYwSnVoWnFONlA1VitMZzhTeU0vQXdhMTJpbDE4WWpYWHJ6?=
 =?utf-8?B?aTc2a1hXNFA0U21sbi9qckJTMjBuTzJnb3UzdEFlb2NqREJ4eE1hWUJ6R1Q2?=
 =?utf-8?B?eHRNWmdneDZuUkUrQXBqVCsreDg2L2RYbTJLaU5ENzluSktudmEwOGlBTS9a?=
 =?utf-8?B?UlB3bnBjL0taUHZGa2kycTBSNzVtNDZJSG1RZFlsNy90bkNmbGZKNHF6OGtw?=
 =?utf-8?Q?eZPH/P7tTT5SVX4mbWb6ie5jLsSKpOjDk/dSVMwza1I6R?=
X-MS-Exchange-AntiSpam-MessageData-1: YdEqySMFmNUR+w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4980531e-6c17-473c-dce7-08de6f658924
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:18:21.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw+L4tryvFJUuSmz0CpNKpsv4rArNjL2zttKT9l34Sowlrl3iPRZAwQfLerEttoGXBjn+UasFXWu78t7OEV7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> Convert `pub use ffi` to `pub mod ffi` in lib.rs and create the
> corresponding `rust/kernel/ffi/mod.rs` module file. Also re-export all C
> type definitions from `ffi` crate so that existing `kernel::ffi::c_int`
> etc. paths continue to work.
>
> This prepares the ffi module to host additional sub-modules in later
> patches (clist).
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
