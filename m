Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2BA27B327
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519005; cv=fail; b=Bqzj6bqannpMpE7Bt1VHFdGDzDNo2unySI0SBZbETtLw7fA1InZ0XEZ137vwGYgUyql/sR33F2DmXfdIjaGFfUimNmWByojrmN3dEN/sPZ5KugS19QXz0LpcbLsKjaoreZhnmPJgpBeUFHkHbG6IS6FLLQB3JZ2hgaNv6HQ6IFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519005; c=relaxed/simple;
	bh=pHAzfzyY/suCWxk3mCqVnNwATXX2jAPs9wDXgVEDlOg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=H/UA3weGZ9HTCbuaIUOKl8wirhZPiqJ+Ee49lqbjdeXLCQ9xr6Rf4f51Ku5mzrj86eMotx7E3fnIl1DnGvM/q2nAyix/6aRQ6fGgY1AmbUInRPNvL5udsHXLmQgFFNqYDecYw559TqNFmy8+iGILlGrQZpkCRKW7dFTIxdzVvds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0x3+vkL; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0x3+vkL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCv3dIACIvDoH6Ee0lLANobtoCZ2wmmbIrDWyXkE+k+xm+VpOgWrvdc67Q4YWB/ok8f3AK83K1xpcZ4kbTidis96suJ/3v2BfhZYV+OG9K4mOGM1SslYJCFVk89ZcyONglZ/LrDQa9wzjq1gLPXqUPugg3oudbyRfQmKW+L43luKooxbiycfmjd7+cW056rBbu+4gTRd8eHqRF0+nu4rtr0E+AcYuvtaMhdsUd+sIlj8idKvKnv0fAMfpCJ0GKzHCWKMT5ApWKN/nKQu6GMr7XNVMHr56FYpgwIhV5wJ60u2fNLsIowXF23clzOknjrHvu/M7vC8EIvvXDlhxMGbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHAzfzyY/suCWxk3mCqVnNwATXX2jAPs9wDXgVEDlOg=;
 b=o/dHKMfg6nbrkCCuPuT5/ljuior0AxFWHHMDqyPuwHTLvXMYht0RJdG3u9tgI3U3FDlB/sO43ZWCEBlhPzX8Gvrm7k4RCbd3rbMwcdVYVAfAgRBJX9/AZOU40e/OXfQqPvYGItParKCVg8iGcLHBbY4jJsEblnyyGfrLtqHb+xUGS707zapPJIfQRXHCXrK8dCjl9jMNBoEOSw3QmWn5JvVUjwPUQBygWUdpcbKTJ6jCWrG10XKHYsdhhxPzGlsz9aWyF6yYIS6/1cTSilsoWCq2dZyaHrxLJWVXSkI4TUMoLh8RYr225IzbJahb4oZYyNI1Q0MuLJHBFnO9eQEr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHAzfzyY/suCWxk3mCqVnNwATXX2jAPs9wDXgVEDlOg=;
 b=W0x3+vkLsQno4UV2jrGlJYu1JwtyHZCQdlYANg8OQsmXoPVcQruLQis2d8IaLqOCDu7x+rJnSoeLPYYoQsjDEoewwt6pzxLOhoALUi0p4keH0VgtjJBY/xF/kjy2FnobAQEBELRC6vlKfPRzH30QAcFFL1ipbqPxgqRruDaKWaR56LRJ3f6eAgzMPVtqjrcXk8iKieefYrksuwvTrWEhCQHdwjWb09GvEZcSgF9ToqiBO0IK8daHYYsFkjIIHORK0b2Z6+JnHYaxoRaBO0pSaKJdufN0cA5DjUFn4N7hYcld5+/1UlGaJKLBMhiZSMeUU3PxwtoUBd7NByf2vBpp9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:10:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:10:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:09:57 +0900
Message-Id: <DC5JJPTET15G.3BZIMKI4G0OXQ@nvidia.com>
Subject: Re: [PATCH v4 7/7] rust: alloc: kvec: implement AsPageIter for VVec
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-8-dakr@kernel.org>
In-Reply-To: <20250814093427.19629-8-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f411829-6a82-4886-de31-08ddde5027c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzNEamhVSlZvUmxqanplbXlsOUQ5ekg2bWdzb1VWNmFFT2F2eU04VmpSekVj?=
 =?utf-8?B?R3A3ajVYb3RIRENRbkc0ZDFFMkQ5TjFzeFpQVGd2bWg0K3Q2dTJKQW5nQUdP?=
 =?utf-8?B?NUhLVUx5THpNY1YxSWxEQ1NDNVErdFRxb1ZqczhiSlU3RzIxOWxrMHloVFp4?=
 =?utf-8?B?QW1BeFF0VHVDUnBMWWJKb3R2WkdXT01uL2M1YVVQeUFrcUsvSjdtN2FDR25z?=
 =?utf-8?B?N1NsRXM0d1FWNUpvUFJ2dUdFWEFzZlYwVkhPTVNMeS9CaVdVOU1kcUVxWXF1?=
 =?utf-8?B?anF4SHRaVWUrU3MrVlYyOURmVEdPR1BKUlRnQ0NlSVlSMk1OSXZjZVkyVlRJ?=
 =?utf-8?B?VlpWSGtTVXFxVUdXeXdGaC90OTlaUENWdUg5djJDQ0orS28ydGZaYURyWnpC?=
 =?utf-8?B?MjlWOWZmamxLTEdqOFJCMXREYTZmb2V0Rm1vd1pHejZzR1NKQ0RmU2lDK3JJ?=
 =?utf-8?B?bU5qMVUzMlkybDhaQTJwRkRxSHNyMWl1a1RZR2ZrRUFxZUZSWmZMT0V1ZHc5?=
 =?utf-8?B?a1d4ZXZRVUJOOSt4Uy9EMCs5L2NEZmN0eURYV2JPTWtYd1I2d28wSkJ3UEhQ?=
 =?utf-8?B?WjlERklHVUhxWUFMTTZSdXp4MzY3ekkwK2tZaXQvQkh3VDdwemNyMnRWM1lE?=
 =?utf-8?B?NkprVk9WSlVOWjk0ckdzOFNJUGo4NTNPNDEvcDNaUFpIM0ZTQ1pLU1VNUUQ0?=
 =?utf-8?B?ZGJQTWxJeFlvTVpsZTI5Z3dTOWMxOWVhTHZGRzdwYTJRc21kbldPNkFTNkxS?=
 =?utf-8?B?VnRGVEtsMWxISzI0SXBFRFRSclZPV21pWHJ4TCtzamVOaWdwSzZrbVVlbko1?=
 =?utf-8?B?ZXBzdWdrNGIzVkdwNHptM1Nlak0wazR6LzVNeDkzcGowZE1MOHpwdm9VSU9W?=
 =?utf-8?B?Uk41b1hnV0kvVlRGOVNVUm1zTHpBMFE3eDJ0RXlYclJUNGIxaERFeFNhVEJT?=
 =?utf-8?B?MU1qVXE5YTVCelh4cytMejlCQUJobVdPem1WdDRDZ28xbFBEaWJOOVUyUm9B?=
 =?utf-8?B?WFJiaVdmZVdEVU55NitBeWh4MUNRbkVmYWp6YzhJdDlBUnhVS3F0dWtJZE52?=
 =?utf-8?B?dHJJRjYxWG5MR2hxSndqVWhVRVVOTG52dHJncCtkZ3lydmpYT1V5WlZQMXFL?=
 =?utf-8?B?ZDliVEZiZkxVYm92OUFBSWQ3Q2tKM0loemNLSCsxZGFnUENDcWduTGFDZjBI?=
 =?utf-8?B?dTlRZWxGWUFIZ2RxMlF1UmlKUnIrME5XSnJKVnk1WEVCZUxtQUhVZXZFUmJF?=
 =?utf-8?B?SDVHZVIwUXZTckJOTFJFNjhGN215U0c5WFUvTmJpYUV1d3BRUnltWERKMkRE?=
 =?utf-8?B?RHZDVGZuRVRyZUlFOHZYeStiaXU5b3lTMFk1VlZJd0doakNXRnl1M1BSbDgz?=
 =?utf-8?B?ZGFud3pqRXlYK2NpdVpVUDVBNEdjdktQMkdNeGI2SFVEdndRc1RiVWNJOG8x?=
 =?utf-8?B?R2dvUDROand4aGkyUkZ0djczbVh6UWdRUTM3SEtzQSt5MWN6OEFNR2NHKy8y?=
 =?utf-8?B?OWtyZkNBUGFUOGh0aitObGo5SUQyUkZDOUljN3gydXZuK3RNZU0wMjFWdC9v?=
 =?utf-8?B?dWRnRzE1SEMxZzRNamJXKytqcUhrOEJwRWVNWUFaSmhuY0NsbGgxd0h1Z1Bp?=
 =?utf-8?B?MTBtcmllSXlVUzJ4U1FnOU5BRzlkS0dsTWFsRU03aThZS0xucVVPNGFPNUU0?=
 =?utf-8?B?TFNjdEdzU2pTamJFUDh0aWc2RHBObkFzL0JxQjFURmdmejV2MGRHNlp1SU1Q?=
 =?utf-8?B?dHJGTXlTYVovR1N3cHYvL0UyWWpDbGVRc2RTc0tEbFB3dmtaV1JPUlc1R21u?=
 =?utf-8?B?dTk2bHl4WkozVmdyYW51djF6SituV3BSdUU4dllSU1hLd3A0RFczbndZNlBh?=
 =?utf-8?B?N2ZOLzhYWUJCRzBRNll3OGNiMmF1YnY0OWFoYXdEYjRkakgzcTVKTkNla25D?=
 =?utf-8?B?U2ZjdUdxTTI2bUNmOURuQmlsYmlQK1htVzFxK0U2QU5kajJBNko1SnpHMG10?=
 =?utf-8?B?dmhGYklaSjBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnYyVkF4QWkydU5EUDRYMGRTU0ZQRmJuRFlvWlhwRnUvR0JUNkdsU0V4TkFL?=
 =?utf-8?B?Mnk3T25aWVU3QjhjUmhwdGJnRlo4RWVYMkhXMjhtbENTS2ZTUVZSR0dvWTBL?=
 =?utf-8?B?N3ZuUmZsTzZBcG5HWlN3NzNNcEVNQThJRTIwMEhHaldnZ2NlZTYxc0lDWFow?=
 =?utf-8?B?dE55YUdzZVdlUzU4UDNaTzJhdVJ3Tnc0OVRYb2F0ZWVyM1h2R3p4L0ttZEhr?=
 =?utf-8?B?UlMzWUtva3JQNW5kSEgwaWd0dkhNSjhuSk9pQk8zUmJidUN0SXVOcHhHemtI?=
 =?utf-8?B?REJoWXorRmRyaWJjRk80eDhXNTgra2kxSlplUHNEb0dBSXhLYXZXQW1SM3BS?=
 =?utf-8?B?MXQ1K1ZST3VNdTU1SEQzek80YnFxSTRQVG1zQmJoVlJnWFY3ZzJ0U1hvZHBm?=
 =?utf-8?B?SUh2Z3NmcXJZb0JiWFFMZ3NrQ1N2dllkamozQndhbFI0Sy9ZNGJiWnI3djU3?=
 =?utf-8?B?dFdXSGoyWHEvT2N6OGZiK1lmNzFTSmU3VVIrODlZVml2MzRFMkZ0ek84TDdH?=
 =?utf-8?B?cFRqais2WmlQTTZicFdHQWtNTjQ5b09CY0pnUlNEWno4Nk56SGJMRUFIWlpT?=
 =?utf-8?B?ejYwU29lWnBQRTNFTy9RdGVlYnVvbnNDZ3RFQlc2V3B4enhyazMwdDFzcFdk?=
 =?utf-8?B?U0kvR3FZZUlNRWJSamxRYS9XNkdIUGFiNjA0TEpjblZkWUFDbzlUYVRnc3BO?=
 =?utf-8?B?blZBT2h2YUsrSEdLRThvc2JkR0JQQlg1TXJzamdMZEFkblBjcEhlMHhmMEhJ?=
 =?utf-8?B?bHpYcURyWmdGbkFjUUE0aWdBOC8vekFJc3RkdVExejFzMDAzQ3UvVEhHOFhn?=
 =?utf-8?B?Tm5DemFhbEpGVDVFVitRR0xMUkxHclMwT1lpWDV0UnNid1hQZWtMM0hCOUVw?=
 =?utf-8?B?aU9mS1dlcFg5RnBBZjN6ekNVK2hDNGo4OEVPd1BlbGcwVjFVQy9panhQVElS?=
 =?utf-8?B?eDBtL001V0t0a0h5aFRoRWFGa3B0V09OME9KQkI1MlFNcWtoREd3MlZ1eEMv?=
 =?utf-8?B?aHd3VWJFc3Rab1ZFdDI5VlJKeXRuSVdkazlibythQWlmVm0vVEFhZlo5VE5Z?=
 =?utf-8?B?ZHVwTGxIZE84RVFRVGIvN21rbG02K0pyZGtXNVpxQU50K3RYVlJIb2FCbGFD?=
 =?utf-8?B?M2M1SVpuTGxsbFc0ZTZ2Yll6NlNVQUhRSGE5dG8xM1pjNDd3aGYrMCtWZC9K?=
 =?utf-8?B?bzltbnBWaUlacit2SjVmZEs0RDM4QVJtZFNwNTd5bDZkVm1lcjdKZ0YzZ01i?=
 =?utf-8?B?ejdrZ1g5V3lsU29zRFRDYlZjeUNhSUxkeTNtZ1lXQnBYcitEOFVpdGlWazNr?=
 =?utf-8?B?V3lUZ2N0K0xsRG5wZThHYThENWxDU2xKeWllYWpBSzZtV0FTTHFVUHlNU3dw?=
 =?utf-8?B?Zm8zZnVPbTBFdE5PdUUrZHhoSWkxdlBjR09WRGkvZEh2eUh1alRDTytManlB?=
 =?utf-8?B?WEZkYStKS3FOeFJ5TXV3NnRMMm5nMjl6blVvYy9VZ29FaTF3NTIxaGJnSE40?=
 =?utf-8?B?bHRqNVlNTTg0QmVwY0JRVmdBY0tNRkgzUFZtakJVd1lYcjloeE5FZnZPWjJR?=
 =?utf-8?B?NlBXQkNHNG41c0FSMDVSa2lRWDU3YjMyK05jVzJrK2NyVnByb1VPYWNSeUx3?=
 =?utf-8?B?akFkb0xrRWV3L0MxRHlPUW5uTEIvT2UwL0k4eXd3UXIzWnN6dzV0VU5SbllB?=
 =?utf-8?B?amsvS0M5N1R1V3d6VG1jK3I1Y09XMTJibFlMZllTWHUvbXpRdzFYc095blJL?=
 =?utf-8?B?ZC9wTGZYVElNclo4N1Mvem9IYy9HdDNLMHpVUGs0dzUzSnFiUDdnS3pQZ2RT?=
 =?utf-8?B?NWE0SHVyS2RLbmFXRVhja2p2cVNPcEJJeWk1SkdXL0c2amNnZkdiYXFNbDVa?=
 =?utf-8?B?b2NTWnl5NS9xQkdQOUlEQzkyKzF3cDJwNVpBc2VNeXhoVmRSNDBqeUhVcjNY?=
 =?utf-8?B?S2tIU1NYRUVGdG9nRWxqRlZKR3Bnb1QrRElCbm03YVdpZnpSQ25xZzBSZmd2?=
 =?utf-8?B?Ti9kcEc0RkF4UlA2bW5STTMxeS9PeFlTV01Rb0Joem5jYjFqSmtUTjJvWkxX?=
 =?utf-8?B?eDQ0M1ltZlJzM2hvMTI1MmVSK3hYWC9reWZwM0JLSXZnWGtzSkJkcHdmRVBk?=
 =?utf-8?B?QVBIVUU2ZzBQaHArd2s0VktGNDdwNURKNW9PN0JhOUd1V2pIQVQvM2p5c2ps?=
 =?utf-8?Q?yhufcS3pRAVyPteUEwDnsmDEa1LomaEtIhrfbL1LSQ4x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f411829-6a82-4886-de31-08ddde5027c9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:10:00.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78jm1ggQHaZSkgLSOVsneLMw+SHpnJBUgzcmDKZcvowQWWE0rebcuf8cKiZaQMztlk4iagYMBBwFbmGM36fPJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788

On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
> Implement AsPageIter for VVec; this allows to iterate and borrow the
> backing pages of a VVec. This, for instance, is useful in combination
> with VVec backing a scatterlist.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
