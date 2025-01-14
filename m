Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105F119004A;
	Tue, 14 Jan 2025 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869753; cv=fail; b=eEpqk7nR3YkDVJLSKKJLfnGnNxw3TyY/DJIs4cM2gFzIetQnodxxkbVrxEUamnfvzMvYA7q+pIYC6CIsZTGrvhJtsXdlDTvbsOLIQYsmACIkK3gTXRyGuIcZ1oTYOJKCyyxVSUxi4S07RpP9LWF5Mviqq17eevvMgd+vnfWkqnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869753; c=relaxed/simple;
	bh=8i+DBVRUO4AXX2OmE7pyzmPsKHgsepaIxsN0dX3QSpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aW6yvOQ8ecrizqcO+hKEOP3izITUv3Wnsda9JnUIT5Ef0nYUTd0z8wh10CuJpWPO+LwUbM9vP/U8yqW15+/C9tUjtL8mhgbY8+j33GgkCFv+3uw7pwBAuOD9UfEDTzAAJ1gS9ytR0Air+kDLc5EWPdTTQaLlbjic03A7/Xmzzlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D6v6+zR+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dLXaLxRF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D6v6+zR+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dLXaLxRF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EC1jUu022415;
	Tue, 14 Jan 2025 15:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=BcDMX0YKs1oyxATeug6ZPdwy6DODOxKQp/Nv+lXCgoM=; b=
	D6v6+zR+017nLZKRHL6qTiB7cpu8GfLRUEFz465oU95hpi1i+j48KTl3Hmxs47Y2
	rHMfhvJ2ZAbSF1r7QIRmXp82iAlHH+AtphogSgiDAjuN1JU0NuwxXmzB8MeQlVcK
	tkOV6M4c2Su8GsD/XTq7AMFenjpHmSIxvxOQJzDWhPdtjjcLGH6lUJVhD9yXINGk
	AY3b6KZ2HVikLZDhkEsqMO2OhVK7tvc5jKpbb6SENGyW8kY1pnkfNXXFa34Gb976
	fIao7HFBIRp9kNDNVorFEBhrtuGKZ3mzO+THfIwyua6Ma+EPwFpsq5nbM+hCvciK
	/19zxdh0ASKEU+MdFiyddg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f2bx1n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 15:48:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EFUJqI035016;
	Tue, 14 Jan 2025 15:48:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f38a0ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 15:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEZtfTO+9xS6wRuVmmo/ox7wTOlE3+g86GijJEG7Iq0ysIQdoRTp3kddZQ7cWDGnSzz5Y+h9UNpXN8zSCz8L4we2QOT9kRxpUzrYlNEZMyGoSSCpMZqPHDN3uKQofISOJqIfabNJyd9CNZqxC5kVVf3j1rUjnnqp/tGJLCMrC1Nbnv+WFgFwmZ3GctaiH10C76juRxA/y0yBKzmM++fSN33NspIGQpMNdfZLH1HJIlZ5va1eMxtu/fIFE45Dd7R4Ioi3NQi0EZvG1YeG4luo8//J9hyo++bU8wPaR9r4x4R5KZdxEv6Toh9gWinBfG49pnCMTNiMgAzaYpie4alx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcDMX0YKs1oyxATeug6ZPdwy6DODOxKQp/Nv+lXCgoM=;
 b=N0C2iKzNikB+WNqt/2UgH12zDoOcGa9MejOnNaDNMadFzVYTPug48pRFi33DBEUJ2xwyPtmZzicUa8xbKWqOLhqD+P70BpK9I1/D8ectvi+8BQpA8bIxrW1qk7x87cxplucAPlBI49Uva7KupKCHGw17Y4ZBNF0YYx0rEAZz5dvPEKZkyff1VyCKwgF+isM5sZw/RQHXZQSzyiysudlQlBPMGQZrGZZGeTudlXDy6PMIoXTmyqS2/fJy7kAYWujrzR/dhJNnl/vOtXgoSaiOs3o8vYQsZ9jD4LcBnIT/kR/xmKQA8fcTOIzW24/xrzR33tLQ+nbj38GgqnL2AiA3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcDMX0YKs1oyxATeug6ZPdwy6DODOxKQp/Nv+lXCgoM=;
 b=dLXaLxRFPlazxX69CCwy8k2JAtoRWBQs1y52c+7bpxVT52spYyergr2lsG70+Lk94EOQ2uNF/gS0YNq+IYtvPkJ23c58gZH4gSPldO4CbsbTVv5e55N2l9KdjLh4Mb9E75gD33W8KTMl1GgFOZ5/AEKf41+7HzlAfifCeEmvozg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4551.namprd10.prod.outlook.com (2603:10b6:510:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:48:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 15:48:39 +0000
Date: Tue, 14 Jan 2025 15:48:34 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
        John Hubbard <jhubbard@nvidia.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?PT91cy1hc2NpaT9RPz0zRD0zRnV0Zi04PTNGUT0zRkJqPTNEQzM/PSA9P3Vz?=
	=?utf-8?B?LWFzY2lpP1E/PTNEQjZybj0zRj0zRD89?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
Message-ID: <082c3703-c540-49ee-a5b3-554fdec50825@lucifer.local>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
 <20241211-vma-v11-1-466640428fc3@google.com>
 <878qsfdftg.fsf@kernel.org>
 <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd3f519-2d03-4375-c1ce-08dd34b2e9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1hmZHVlNWZyTmM3TVZTc0NCc0g1TlVyL1VKUVpwemFzNUFEUGtXM3lMOHBE?=
 =?utf-8?B?WDc5VGZZWEwrbC9aYXdNOTNvRmhWdVczdkE2dTc2ek1WNXhpS0pPbFpvb2Er?=
 =?utf-8?B?c1lOSU9ySDlyZDI0blZMZEJTN0xNTWZBNWRnaXdITjRhTmZWaENFVUJIdERx?=
 =?utf-8?B?RnZkemdWRGt6OGxxcks1UTNrQkZIcDJ1TStjMkhrYU0waDN1WUNlVlRxQ3Zm?=
 =?utf-8?B?RGRVSll3K3d2WVN5Y1FvRC9zaHhYSXFVWEpkQUZoTVhrS3dVdFlWZ2poR1pq?=
 =?utf-8?B?MCt0THdlS1kwVmtVTVZoZkZSNlZIWGo0aE03RUozeWIxekhjUGVGZWJ6bys3?=
 =?utf-8?B?ckYvYU9sV1BrQjBWcjRjQ05WckQ0U0pKek9sajdtMWRROXdJNDJjOVhpKys5?=
 =?utf-8?B?UFl4OXR4NmxreWhGVHo2Q0MwWFF5US9XdWxPYWpzbDBVaUFaa3ovejIyTk8r?=
 =?utf-8?B?c3hKcE9GTzVXS2RIVUdLUjhQbndXYzlUNUdMM3NnbFV1TkFUVitsTXhjK05I?=
 =?utf-8?B?MGJsUmN0MDRUV1lEd00xa1h4SnIvcVZOT3VzWmFOZDgyMXkydUcyVXJjdTJX?=
 =?utf-8?B?N0xsQUU0WGZPc1NEbUV5d0tLNmtldDNoTVN5VUZ4TWVnTTAxcStObngyelNV?=
 =?utf-8?B?bThqOUpraDV4aU9sSTR0Yi9LdHYrbCtuWkF2OTRBYlFCVlZYSUQ0UDcyMFZV?=
 =?utf-8?B?RUw3SGlqeVlBaFM4bTd4dGp2QjNWL0NPdGROUVNxQy8ycDc4dHpHS0x1Tmdz?=
 =?utf-8?B?cVozSC9rV3RwOHpucVJpUVBVSElzQXBPOWNSalN1VnB1RE1CMDRLQkU4NTlI?=
 =?utf-8?B?UGVUQ1VSUmRrL1RKNHZmV0h3RkJRZVgzOFpqeUdzcGlrSDduYjdYWVZ0YnFv?=
 =?utf-8?B?dzBIYnFzVUhFTWUvdG8wanFLTTYreTZLM2VVN21XUXdDQ2VBVzRjMmw0Y1Zw?=
 =?utf-8?B?NXlsejhhT0VzRGVEc1hKZXZkbThjUnlKUTJNdVhMSEx0ZEtkOVlTbGFMblVs?=
 =?utf-8?B?UjhwMUNkbW1ZdTU0U2t2NEd2Qlg3eE03UnNpQmprejZ1angzbUNDcGdRMkhR?=
 =?utf-8?B?YU9WUDA2Y1dLNzZacnBSM2dxMVZUejFUREhKT2dxaXh3Q1EraTRNZjRmVy90?=
 =?utf-8?B?SlorVTJ0QTA1ZExPbVlRczNQOTF1a2U2cDZOMklPd1dFdThoVlQrZHNVa3pw?=
 =?utf-8?B?NXBuNEszZGhuVUVPU2J2R0xJWkZSUWFjeHcvb1hpdzhnTnpuc0xhd1ljQ2NN?=
 =?utf-8?B?Z1NBUnlVa0ZzclgvRDZNZTd5cW4veG83ZHdKNGdSTmx1YWVnOHMrL0llNERL?=
 =?utf-8?B?d216cEN5WFlJK25TWjViNHFZaVpGY2MrVldKM0hYczJRcGx2dlZOVXlBU3cv?=
 =?utf-8?B?WDNHRWtoanEvRlhHRzhocFpJb1ZXMEIrTFNvQ2Z3UkVSWFZRRVFDWllqSkhN?=
 =?utf-8?B?R3dtN3laQXNIdjZtb1QrdE94UUlaQi9pUDhRS2FxZEk3TnlORmo4aXM0UWNM?=
 =?utf-8?B?OUdqOExPVUI2VHBhdU5OS2sxa2M4bzFyaWJYVlQwOG11UDhrUkdmWUpKaGN2?=
 =?utf-8?B?c3hFTFh6VzdVZ1R2RGdwRCtzd3g3NE1PMlFCd1Y4ejI4MmFDK1NtNnF2bG1I?=
 =?utf-8?B?NVVZeFRhV2RGU3J0alVCQ25sbzE3TFEvdEtVMDIyVWdpWTF6bDRXMmhsdEgv?=
 =?utf-8?B?dDZXckdWZkdva3BVNlpqMHd6WEk1c3N1NXFjK2JOZjY5VGI3emhmeDdGSjQ4?=
 =?utf-8?B?VnpicmFtZytjbGdsbzN3bWEwb2Q0d1BVQmZLSmJJZjJiMEIwWE1kajVRaVVZ?=
 =?utf-8?B?NkRHU1AzeTVjSkZoaWVicjhkSTZReHJDbWdpc2NoYVR2L0h0bytpS0R5cXFI?=
 =?utf-8?Q?78QrTqZsUh3xt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWsvTDVzNmdyK3VFekxkblg1dTU3ZlpUQlBXNU9mZnRtOHVSMTh0NllCelVW?=
 =?utf-8?B?VEpRQU9YalJ4WmtJV0k2UlRha1hBM0VJQmg0U3ZZbEJlc3laY25HQWJoTkx2?=
 =?utf-8?B?eDVYQit5Z1NWczc0MW9zOHNWSGFuM0tOa3dJZWFhYzhuUWFQYjM5SnB4Syt3?=
 =?utf-8?B?MDJkOFJVWnRyaUs3ZTlkU01vYk1zazRUM3JkTHdxQlhOWkZ0VkZ6MGExTlFx?=
 =?utf-8?B?b2RhdmJhVDZ3eWtOZjhKMUlDM0NxSzdxYmVZcHlpTktVV3YxcW9wNDRMODJq?=
 =?utf-8?B?TTlzN1FiVGdrU0hnWU4vR0wyaHlqZ3pNZlVVeUNjeHBTb0d4K1hBa3ZtdU9I?=
 =?utf-8?B?cXFBNlJGaG9ibS8wN2JvUEJ6N0R5dk5mZ2FaNWFucHJoMGVyaUVydjljcjVW?=
 =?utf-8?B?dmZDR1h1YVgzd0M2V2hwdFBnakVCTEN3dytBb05LV2xFekxiUldFc1crOW4y?=
 =?utf-8?B?VFBKUXE2N3RhekFPQmhycXNVNGozRTFoenBTVEhwUW9qekI0SHpxZ0dCeEVG?=
 =?utf-8?B?di9zcGJIUlF1OTFTWDhFNURjVTdLbmtpTXVIYmd4RnZtK0ZRc0Nvd3MvRW84?=
 =?utf-8?B?eG0rbVZXZWZRL3FxREpnSzJpd0tnQWttRjhjaFFjWHlNYm02bVlYYzE5dnh1?=
 =?utf-8?B?ZDlFY3hqVWVpbmR4VG9ENXBXeEpJbnl1TUpTVEV6ZnZmdEpzWHYxbGhXR1dp?=
 =?utf-8?B?UllPVW1vUEVkM2FiRzlhSlB6UUVJZzRZVDBXU2ViUDJVVUx5a00rcWQ1bmNT?=
 =?utf-8?B?L200Skx0U1pZZVVpVXh5aXZVS2NoVG40Y0x1LzVwTXB3WmFVdlE3ZGF4bXJq?=
 =?utf-8?B?NS9sMENnaXphc25ETjhtOUExcUxOQ1N6Z1gyMnpMS0w4MkhvY29wOVdrTTNj?=
 =?utf-8?B?V05jZ05kdGRhSjlKZWlYN2YxRkl4OGZVQWMwaVprY0t1Q2VDZ2lMN3BwbzRm?=
 =?utf-8?B?R2M5eE90QVF0N2IyWHlJTTlqdklMUHdlRjJYckhLS28xcXhyQmFjVkVJdjh6?=
 =?utf-8?B?RUFtQ3E0K25FaUh3b1g3MGt5V0NZY3E4YmNBQVhMUm0zMnVOWlAyV0pYdFBC?=
 =?utf-8?B?MnU0clhDdkppbTdtUW83cWFmalY2enl6dVNVQllRQThERkl0WC9CRDBpMU5J?=
 =?utf-8?B?VUdITGZpZDBIVVd6SnFaMEw2RHNmeVE1VVYvWWpKdkJvdzg3MkRqbitVRDhr?=
 =?utf-8?B?MjFVV3hDVEZrQnMxMk80V0p5cFR6MTZneWg2T2NTQkg0ZUVId3hLZG0yR2E2?=
 =?utf-8?B?ZElJRlRQTGJIdWFjYWQ1alluYlpDajNjR3dXNGZWVjB4dU1DWkQrcFRoUkJ5?=
 =?utf-8?B?TWo3elgwQStSZnRXMEF1RjVjQk5XZk9LeFNNdnJUSXhjWXpDQjM0REpPOG9j?=
 =?utf-8?B?WUFQa1FmeEVSbjFMTmYvZHpacUNEQTZQREV3dWFoUUxjQk1BZnJ5WE9LVU1L?=
 =?utf-8?B?S05nTmc1cWRlTTR4VjJoOWpqTUNEa01lS2xPejlFSVdWVU84VTJBN1dXWlAw?=
 =?utf-8?B?ViszZStZaFd4Q1hncVVTcFdwNU1FTy9Jb1dEZTFzaUdvNzhaeTdZVWV0QzNN?=
 =?utf-8?B?SWc0QW1lb1pBaGd3S2tmdzBsbDRBN3lJRWtFQW1qK2NPR1J4VGZpM05Zd1pM?=
 =?utf-8?B?SXJ6SHc2UEg1NWhrWWVIckZoSWV6YXgwR0pBbVNoOXFmR2JJUzc5dWl0c1Iw?=
 =?utf-8?B?RXNTalBFVnV5b1F2ZW5MclRqcjlGRTNxa2VqWElxOFhLVmI4aE8vSFlqM0Nz?=
 =?utf-8?B?V21BT1Brc20xTk9MbGVpbmpkSGt4N1Naa3JSU1lrdjdLaktFb0RuVk44eTBB?=
 =?utf-8?B?OEZoQXFZT3E0Qy9adGhCOGpabldZTDhZN0pHejRPc2d6b1JmdjE1bng1RUk2?=
 =?utf-8?B?U2NkRVZKMUlOSTFsWlRLMkg1ZjVNcUFUWmMxRkVGUDdPQzVQcUoveGQ5ZVJ6?=
 =?utf-8?B?NklFQlhDc0trZFQwczVZcVhqbjMvRFQzQzZYT2p6MTVLTzFIM29IVERKejBX?=
 =?utf-8?B?NTRabFJoaFZaaEJ1Q3dZWGM2QzZlbVFHaGVjK3ljb2lJZVBsZlYza1B6UHoy?=
 =?utf-8?B?TUNMam0yWThUaXZqRzl6QitLeksxbHlRMjBEQi92VmY2WnZWTks2TWx4eTBE?=
 =?utf-8?B?WTBUNWVnVFJwVXU0VTM3cGJzRVlNNVRTakZPeWtMN3BBT1JLbDlMblF4TEpl?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xl2yZhD+TxQxBvJzB2rgAhmXPRBDqfmm0/3JtOF4zYHGuj/SSPUdscq8O8DZ+GG2H+HYSbgRZPguLGotlHFW0Q4WLdtbVBAmYuUEjDG77GGg4vi2Eoua2YYqkOk1exQPnigfCilueBxOTMRsm88vGnfy0OC39s0CK6NJINNR74+ZAWudgvGsR7blhW1l8iOU7peEkPxPZwUrZOCf/o/UBY2vwpjGnyqWmAn5zR7bUfz2whMY+TlG8jzuo/Bt6EuURCsw6JesCqoiGQZhWpIB1k7T3CU6mecyGMNDbiz6WNXhYhDPGpJ9KoKMKI2dC3XaB0+XLfVwkCXTqvN8Gmu5e3L70LHLlroVQEQu7SHQGhhQa0/FAIPJdj7w8iS+Hpty1kPqQkrQxmfpsntDaujfc3EcCJsM1b16KfaPzLpO+wsq8OJrAqlwNTA0FP9pPRTofR9Fz5ftldtwYU+e4hZ14+OQCDOu8wF0EdhdkAnME7xhsd/ala4vU9+X7LfoGjdZAQTwbAvm2xePD8wH2u3u/ZYy2Xvvc2PcPcQBTjJfN8Wr3D8T4zkWrFo8VYSpsoo7bp9DaGFqZWu3Jgi9L+LV0E39jRnnK4CISAG4KwQu7Ns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd3f519-2d03-4375-c1ce-08dd34b2e9ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:48:38.9305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98GGZb4vghdGNug8YZcuGdqhlKZ0sP2y2D7faZuCiisEJEaKlnO1v8OvlWooE+tsV0B2a2h7UIZpkHRMc0cNhb5nGC2Fvd0gbRM+s95MEhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4551
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140124
X-Proofpoint-ORIG-GUID: X1W7K_p4oJsqlilcp1lBua_UZVTN5MQi
X-Proofpoint-GUID: X1W7K_p4oJsqlilcp1lBua_UZVTN5MQi

On Mon, Jan 13, 2025 at 10:53:33AM +0100, Alice Ryhl wrote:
> On Mon, Dec 16, 2024 at 3:50 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >
> > > These abstractions allow you to reference a `struct mm_struct` using
> > > both mmgrab and mmget refcounts. This is done using two Rust types:
> > >
> > > * Mm - represents an mm_struct where you don't know anything about the
> > >   value of mm_users.
> > > * MmWithUser - represents an mm_struct where you know at compile time
> > >   that mm_users is non-zero.
> > >
> > > This allows us to encode in the type system whether a method requires
> > > that mm_users is non-zero or not. For instance, you can always call
> > > `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users is
> > > non-zero.
> > >
> > > It's possible to access current->mm without a refcount increment, but
> > > that is added in a later patch of this series.
> > >
> > > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/helpers/helpers.c |   1 +
> > >  rust/helpers/mm.c      |  39 +++++++++
> > >  rust/kernel/lib.rs     |   1 +
> > >  rust/kernel/mm.rs      | 219 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 260 insertions(+)
> > >
> > > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > > new file mode 100644
> > > index 000000000000..84cba581edaa
> > > --- /dev/null
> > > +++ b/rust/kernel/mm.rs
> > > @@ -0,0 +1,219 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +// Copyright (C) 2024 Google LLC.
> > > +
> > > +//! Memory management.
> >
> > Could you add a little more context here?
>
> How about this?
>
> //! Memory management.
> //!
> //! This module deals with managing the address space of userspace
> processes. Each process has an
> //! instance of [`Mm`], which keeps track of multiple VMAs (virtual
> memory areas). Each VMA
> //! corresponds to a region of memory that the userspace process can
> access, and the VMA lets you
> //! control what happens when userspace reads or writes to that region
> of memory.
> //!
> //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
>
> > > +//!
> > > +//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
> > > +
> > > +use crate::{
> > > +    bindings,
> > > +    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
> > > +};
> > > +use core::{ops::Deref, ptr::NonNull};
> > > +
> > > +/// A wrapper for the kernel's `struct mm_struct`.
> >
> > Could you elaborate the data structure use case? When do I need it, what
> > does it do?
>
> How about this?
>
> /// A wrapper for the kernel's `struct mm_struct`.
> ///
> /// This represents the address space of a userspace process, so each
> process has one `Mm`
> /// instance. It may hold many VMAs internally.
> ///
> /// There is a counter called `mm_users` that counts the users of the
> address space; this includes
> /// the userspace process itself, but can also include kernel threads
> accessing the address space.
> /// Once `mm_users` reaches zero, this indicates that the address
> space can be destroyed. To access
> /// the address space, you must prevent `mm_users` from reaching zero
> while you are accessing it.
> /// The [`MmWithUser`] type represents an address space where this is
> guaranteed, and you can
> /// create one using [`mmget_not_zero`].
> ///
> /// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its
> destructor may sleep.
>
> > > +///
> > > +/// Since `mm_users` may be zero, the associated address space may not exist anymore. You can use
> > > +/// [`mmget_not_zero`] to be able to access the address space.
> > > +///
> > > +/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its destructor may sleep.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Values of this type are always refcounted using `mmgrab`.
> > > +///
> > > +/// [`mmget_not_zero`]: Mm::mmget_not_zero
> > > +#[repr(transparent)]
> > > +pub struct Mm {
> >
> > Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
> > use `MMapReadGuard` later.
>
> Those names seem really confusing to me. The mmap syscall creates a
> new VMA, but MemoryMap sounds like it's the thing that mmap creates.
>
> Lorenzo, what do you think? I'm inclined to just call it Mm since
> that's what C calls it.

I think Mm is better just for aligment with the C stuff, I mean the alternative
is MmStruct or something and... yuck.

And like, here I am TOTALLY onboard with Andreas here, because this naming
SUCKS. But it sucks on the C side too (we're experts at bad naming :). So for
consistency, let's suck everywhere...

Feel free to put a comment about this being a bad name if you like
though... (not obligatory :)

>
> Alice
