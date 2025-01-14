Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C582361F0;
	Tue, 14 Jan 2025 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855877; cv=fail; b=TgSu97G+LjoXEFzHANF1aDowBUtuAXMLOE91OgIYztDd7SOVsp9l3cL/oiknYHxESfiQ1az8QfAJ8cR7dQEc0RVzSq5ruqpZLNQiGmciEMRrFMBEJGOo3v0D95SxgAf8MCi3cOHluEuT0KDF6rFhZfFJr0ITzF1KoL7c193X/QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855877; c=relaxed/simple;
	bh=HJl/CZwvXh5hcecveLVNVYNG57KrvGxaRiJJPdwCFyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MMxuLKMiiKTR2jNtgAXrU5QBe8E9szJOFZ5HcMhbd8bjl+AOS5L+mMcbjPuak8fEEGNJFF1cWsGGjvjBt5ivLp0y65EqIIN+Ka37vtuyrXDsE2dQ3JpF6t6KT15vy7CCGvuhlW7hQSdM2egy0LjLO7bCP+xTfAJbu7sCXxLD8jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RikUckov; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cz8S/8+N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RikUckov";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cz8S/8+N"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBfqHN022203;
	Tue, 14 Jan 2025 11:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HJl/CZwvXh5hcecveLVNVYNG57KrvGxaRiJJPdwCFyw=; b=
	RikUckovbHqm+KSw1z9M5mLB+UsXBhhwHoDXqrht8A5EnIZ3ZrhHsP+ACZ+yDrvt
	kdw8G74wEKKtEC8v4v41Bntc6dK47G2CvEJzddbQTZPZkh7OKrJ/LHZwk6pRwlVl
	/em/9TMCINnD0ry7tBXfTKTi2ql3lGF7eXLB4g4DreJbJWk9Hg/BopKlVWawq4xh
	2KVOevug99ZLNegrY1CAIZfwyiVsDk+WpfFiD07y4H8kg07YxwnNcmFIoZQUCIIu
	KNNEYBH4GEf6w60PDdBygHeWsSwsqVyEfhhSbP82F5fofrdWjq+GtAjLswx9DCZM
	cXoPZfVqj33qNX5O4SM27Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f2bwkwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:57:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EAg9fD033248;
	Tue, 14 Jan 2025 11:57:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f382xgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 11:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC0nwv11o3GBNYAuSe/dBedDD+oxiQnAdjYD1aLf2ZRmoQiplBsiO+gxRqhwpbG01alm/hPPzhUw1By6ZH/vyBDKHi+fA8ZWR6qAxU2rNIbnwADHBP0PTGfdlUeveovfTjdVybj4IZRAp7JxaL/oz/MwRM8pGmiMz61EF8jhNKKoxREUtniw9MhWX6wOt/3ixI43Xu3KHqZa2xeue5z+OgSDkoC9ql5SAcDaociePGy+rDU/cx3PYa90L9d3ESpXoOhgHeqIkwT3dBdLPNSHO1OmVQjC8GpuDIS9i94vnJXciAn/xei9LGvufX5oYiT1SxULMl6eJ49dS7byJssNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJl/CZwvXh5hcecveLVNVYNG57KrvGxaRiJJPdwCFyw=;
 b=Vh/KAimCbov8ipdIYbG+oScLuTHP2OuhD5CLZDG4Uk2Aa5kJf9b9qUTlgYEfEQ1MfKyBuhEQ31HKL4MDD69iUEmgqisTo13dhzm0jrg/fHL1pgowilfJhxcKs5U7LMUCQ/kbiXXuU1s0O6M6EWRIBfB+RNMHYjZQXeV1s1Sfjlf6mBAdvuiM1oQVwn1a0vfX0mH2vOislO65CMGDBg2wWkef3fzRSlqAp3jstka2FXKcS4mhLQOYU8gYS+iXn0psrU92uK28yn+cG2MrhW1/CGHaT48Lm9TgJ+3P7JprGPL0bSEj5OOOyhN+N5Gnky2WmabVHz8motyRJbJWk3E6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJl/CZwvXh5hcecveLVNVYNG57KrvGxaRiJJPdwCFyw=;
 b=Cz8S/8+NROs3yMXMzeHauqKHiFKLcKfmcFAWzi8hxsTG/XPBMmMpJb3NV3anF+azed/AUO59UM7eQdOs6whAGH77bdz73mJRHDe3cFoQARKVpWAMvKtaLRIULDUjRCbxEqAphNbq8QVFagoM04S8eDuYQK/ArLJu/LUOCBOMCJU=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:57:27 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:57:27 +0000
Date: Tue, 14 Jan 2025 11:57:23 +0000
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
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that
 require read access
Message-ID: <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local>
References: <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org>
 <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
 <87msg09uzu.fsf@kernel.org>
 <qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
 <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
 <871pxcgg02.fsf@kernel.org>
 <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
 <CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BN0PR10MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: b88d18e9-f0b1-4b93-345b-08dd34929d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjNmbnlVMElkdWljMUt0ckdZamJDU1kwakRDSW5ZTWdKdUlDNWVMeExUYlJa?=
 =?utf-8?B?V25CYThTOStVaEhyZElWcUN6cWFRcVhQNnJ3TlkzekR6eU1RQld3RWYyTmIr?=
 =?utf-8?B?RUVuQmhlN1BtUXNPTG9VWXYwVzkvWk44SjA2RUlQYW9aZjg4Z1dqeVpwRUl4?=
 =?utf-8?B?YVhiTEYvdnpObVJ5WHJyTVBiaWErK1hOVG4rUXpqNktsdVdxVktOS1BIN1JR?=
 =?utf-8?B?ZnNkeFZtZU5MUE9lSW4wbGxOdExHc2htVExJK3E5Y1hTeDYvZVBPZ3RZUDYr?=
 =?utf-8?B?ZGFsODMzSDl3T2cvY1lhd0RJU2pmTk85ZWRKMERIWGI5U1NVbjNidE1ERDRw?=
 =?utf-8?B?THMyaVhySS9CUjVqMnpzRk82U09BN3BhZGl6QW9mS0twdFRxaFl1VmYzZ3Ba?=
 =?utf-8?B?VU90cGpmZzNpcUZEeGpuRTluaEpxdWFEaDRDa0RsZ2pPRERodVE5Z28yS1Zm?=
 =?utf-8?B?cWhZMmorTU1aTGtJdTc1L01EUHZaVklVcVZrTFFRUlBubjdoN3ZMOWlZQ3lM?=
 =?utf-8?B?ZEZwNXNDeTFOK0c3M01hYXM0MXRTZlIwd2laVzRKWXpLZjFGMDExcS9vVDNQ?=
 =?utf-8?B?eFpnN2hYa2sxSi9wZ3pkb3BISjVZSlBLdTY5eWlFV3BjREJBVmtZUys1WmtS?=
 =?utf-8?B?MFc1WG5jWDQ1TXIrRDR5NWpNYUhSNWpKMFhTdVlZa0QrU1VWU3BPb0hmVmFO?=
 =?utf-8?B?N1BadURFeTY4MDNaOXRZWEpXRmVVenFOcGFGMUVGandQWm0rRXo0R0dPWWJC?=
 =?utf-8?B?Qlk0QlJuOVdTT2dIWlFoYnllbjF0YU4xZkhDQ2U0ekkveWZiUFNRSG55RWZy?=
 =?utf-8?B?RnBUQ3Q0cmRxSGZ3aTVVRExwUVZMVzM4L2lIT2l1QWMyMW9FSGZCNFQvdk5x?=
 =?utf-8?B?ME5nNUhOUS9HT1hzRGl1T3AzejlVQTU5QVEwa1QwNG9iWjBRd0RVUVo5SW4x?=
 =?utf-8?B?cE9tWSsvMUxjU21MZ1d2T1pObnZDWFRLNTBtSk5xUEd6UFpNaVlzaGJMQk4z?=
 =?utf-8?B?OTBXTmJyeHd4Qk9IR2s2N3FER29jNGdsNDcxVjRQSFJhODBUbTVyWG1xM3Zr?=
 =?utf-8?B?OUxFWTFXWnVzaVA0V08rYkFENFF6UmJWc2M3VmpNdHlvaEl3b1puMk85UWl6?=
 =?utf-8?B?cW1XMUlpaGVJZUl1a2x3VHpDN3YrQ2sxckhPd3FEM3paVnpNZGJhVmwvY0Rk?=
 =?utf-8?B?ZHRqRFpyTGxKK3EwK2NWSTNyVTRRM21XazBXSFVvZURIWndiaFYzYXV5YWI5?=
 =?utf-8?B?c29KdWZSOVByL1ovNy8yYm5IVXNVNU50UGl2dUdIcjZ0UHJnQk40aDN4Sjda?=
 =?utf-8?B?Tm9ybnMyb3Z3N2RRVWJJU0NhMTJCVkV4VFdFT2d5Vm1Qd203dHFLeFdZYVE1?=
 =?utf-8?B?ZHo1R0RGT29VU0RieGM3cllBTFp0TUpYSXdWUnUxV2pzL3RMNklRTDlCdGdC?=
 =?utf-8?B?ZkZzS2ZaVStxQW1mcFFQcjNOQ2FueEdXNnRCL1kvU2s2TE5GRThrRzRrSzlS?=
 =?utf-8?B?OXZBbGF5enVJNThMOHlFbmJlTTd2RHhrU2dkR0tiY3VCZzNnMEVac1ZsZjY4?=
 =?utf-8?B?SUZlTFpuWjJ6MmZPVVBtYnh5VW5MNDlKYVUvTTQwc1UvN0ZkK1BjNGFxU3o2?=
 =?utf-8?B?YjZLWnRLYUVPWXRhYWJhdmE1bDJVWnlaVFJEaFlmTGFyTFF0NEdJMmF2dUpn?=
 =?utf-8?B?RDhnY0VDVG9ldjhQZFJaeXRKTWxFNEZyVFBWaWswUS9jZnpaSjN5KzFaNG5Q?=
 =?utf-8?B?Q2hSVFpxMFVDT1E3dlA3Q0lLTEgyems0bUYzTGdUQUp2U2NqY2xnSVhVTkdk?=
 =?utf-8?B?ZkVYYWp6YW9QZ3M2bHlZQ1pCOHl1UDY1dFlwSWxJZmtJb01jYXNJclNvYmZW?=
 =?utf-8?Q?trnAIiKz3smvJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhJczZFVTBkY01PUnRFMEZUcGpHUGpicE1VVEg5WUlXQVgzSTk4aUsrNzBp?=
 =?utf-8?B?Q05NeHZTY3hnT1lCVEdUcVprb0QydlREQmZRVEJxdHB3MHNmeFZaUUt6TS9C?=
 =?utf-8?B?RmdQQmFwS1kyYy82a1JtbUZuc2RkZFNaZ0lmbDB2VDU3cllCV1FmeDJwMHdE?=
 =?utf-8?B?VC9FdFFwUC92WkY4VGhxRTZ2ME90T3FXaFR3amVDalpjRXFFQXIvWVlNU1Yw?=
 =?utf-8?B?N2djZWVTNkZOMmY5cjNPWXVDYkFGSTdKSnk0L0VOdHp4SVVHQ3JLcG5CNGY4?=
 =?utf-8?B?R1FUVllBQkxpWmxyZk0zK3Q3dWZRVHFmcDl4aDRPaHQvMnRZd3R6Qlo3VXZC?=
 =?utf-8?B?RXJHSEpXOFo2K3hlb1cvY2xSMitZYUFlTFdTOU5vWEZqUUJQQVpkR0k0dXN1?=
 =?utf-8?B?djRFRkRIQXNFRXZ5OElaZUJlUFNjUjdBZUgyblFqOTVZbHlHVUNnMmI3b1F5?=
 =?utf-8?B?a1J6MmNXS0NXREVoVmp6azZwLys5QkFLUTNMYWlNWkhSYW5NNnpHdUgxK2lV?=
 =?utf-8?B?VEFNYUJESmdIQkJnb29tWk1oMGd4RmxUeWpLOTFWY2hYaVRKUFJkbklrMmFv?=
 =?utf-8?B?eDk2MEV3ODNlYXd5UGxIRm0zVHJiRThWaXFOSXR6NG1QWkhmem9BalA2WG1N?=
 =?utf-8?B?Z1pmZC9wMnJmY1RoNWRWMHoyTFdraUZGbWw0T0FYWXFwdzdjR3BKdC9rcWJK?=
 =?utf-8?B?WXdKR2hsNXJsbElTb3AxNkdjK2hlNmQxeUtRSGM3NzRaZ05OajVKMjJleXJC?=
 =?utf-8?B?bFQxeWxZS3k1VVd6Skgvc2laTEZJRUJHZjJaU1dCY0svbHZmd2Fyby96bkNL?=
 =?utf-8?B?TUJRSVZ4Uzk5dXVxUUNDSFlMRitkNmwydHFGVGlMQVloczFUMi9lLzQrUkRj?=
 =?utf-8?B?cUtWWGszcFo2MXdGdjQ5anFHaXJ2VHVuOWc2UTVDZVlhOTRjYW43RGVrYURD?=
 =?utf-8?B?cm9hQzExM1dTMFREV0ZDeUY1WjJRRW9PV01vUE13bkxoOGFoK28rV2JUVm5I?=
 =?utf-8?B?MWYwdTFDNHNhUlZsTUNrYmN4VVVUbDExNnM3a1VQL0tsb0dJYXA5V0VNYlJ2?=
 =?utf-8?B?RmlzT1Y2dGtObFgrNzBqMUxkaE1pRVRINEJlZzUvTkJrYmZEb1R0MVBuaER5?=
 =?utf-8?B?UVlSVERNZjdWZjVVZlZIRURUc3pnL2ptQURXUVpuSHBsVDJKR0lwSVFLVXBq?=
 =?utf-8?B?ZXoyREpZL1VlTzVlVUZhYWpRQXN2UFFlcFdyeW1Oa1dqNElIYWpNWkk1aHBi?=
 =?utf-8?B?dDBCUzNlR3lFVVVwTnpoWUg5ZEVzV3hWdUNxeXRDdXZLaHh6aFduQUxHdGRl?=
 =?utf-8?B?WnJhVjJXeS80RlczQ3czU3ZGQWFHbWc1L29EcGN5NlNQQyt0UFZsZmwzN09V?=
 =?utf-8?B?TEJHNmhZaUlrS0JyZHJYdGtJaGFSM1lNYVNsaDdSS0hBejJ5MkpBRGF2L2xq?=
 =?utf-8?B?M3IrcWtBNnVBNHNKNFQ2K2NPQ0pFQWgzTUlHSFFqT2k0d2V2Q0J2cmJHVGdF?=
 =?utf-8?B?VmUwcVpmODMwY1Jyazd6WnJPMmVXZjhjMXhMTDBXdlNNU3pJNWR2SFU4Kytr?=
 =?utf-8?B?MXoxZytmOW9uREc5V0lhS0JEWTBsL0tKdDUyU0tMd0tkdGsxc3djMDg2OUlW?=
 =?utf-8?B?TTBBU1RvaTR0bWtXZXZLSVlvNExkUzIvZ3ZRUHh6eXpjM0F3T0oyOFE4NkRt?=
 =?utf-8?B?eFVXZFkrT1BsQUoyZldEcW1NUFNmaUluVndIaksyWlpBTXVLNDJYdHRXZ1N4?=
 =?utf-8?B?SnVFLy9pa20wL3BuZVhZR1NoWmNadHUyWk5Tclh0WHJRM2M0NFpTWTJNMnNZ?=
 =?utf-8?B?YWdJalJXeUg1QUJtK1c5SFY3OFdIamNvMWlnSHZCcStUOW5uNDdkcWhHU3Z1?=
 =?utf-8?B?ZitoZXo2V2M0elVWWHVXb1lnOFB0MVJKM0RzU0w1cjR0ek9EcTFzb2FMd1F2?=
 =?utf-8?B?OXFFNzZ4bk4rMTVidlpVVklPREhNc01iOStRVjJjZmJRNmloWlZ6Ym93dWti?=
 =?utf-8?B?SlNnWWFteitTMUlrUXM5bEZ4dytzS0xrdHJrOFY2a05iMjVpSGkrdWd5NzFG?=
 =?utf-8?B?NkFhcFFmc0Z1N2p1N0hCbHR4L0tMSXJzdk1JYjhlTzlPUzFiamU2MEtDMkwx?=
 =?utf-8?B?aTZIT01XRmZDQ2tPTjRTTHk0Mzg4d1ZUZFRadllPSDFmNE9hRW5sVFhLR2VM?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n+qLH+c4qI+tfiIOJKX5yPUifycrj2OYKba0BKuangrDPb0ReDrizNas4cE1mIWTLVSTa/U6A6OXNpsOF45phno6eipPsA7n5AzT8mvvO/vAn3HIIf9MfTWgexP1j6YXnRRSqGssjRxjfqye+CKDBbFw1FaVeEv9g/PnRiWt/zieFDAqt4/im/KI8wG99v3mPq/H+1wkrl+kYkHWiP2/XFH9W093UurBxfMIPe6/ALhSFHjfzgP2tSRN9PiCF2VYJNpuP7eocZQWTTRiAQkJe4ICabQqo25VFytDhgqXuXMpaENplJWK97aS4N/NfO+lOSG82ZXW1AU8OmXWRlIMU9P849ZuUU1GG06FbSSR0VTnddGdGSEaMTnJ+tBOm8jL9osvx2L10GosdD+FkATmgw5dMCT9DweaVcyTcqkfJ84sC+4NRkIpFoyti1VDcPvJ4YowCi00ecEf9lAFJVGmHhgiENC/jHhyVHCpyEeewLdbAvMAqD7Kj0WkQ1GhJg/hwVm9+HVGA6491Y7+cgyTHHLS/hNSKrJWtlub0vz9ore06HXmL4f84bDcpzPzlfRJTExr0mEPF2by6d9o7zEW+Pzz7hNsQn+pk90yyrUKqyE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d18e9-f0b1-4b93-345b-08dd34929d71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:57:27.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E3jDwN18CXpTyeLeQVCeDMuySpupeVvyHjbNEBtrO8MyU+8ko4URAQeh9pDe7YR+XWWwjJ7ksqzZgSuIk4XwkCte+aGB1Zxe4tcN1mBkOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140099
X-Proofpoint-ORIG-GUID: gVPaKkipmDvpYvtjhabi5lewVGT4sFXE
X-Proofpoint-GUID: gVPaKkipmDvpYvtjhabi5lewVGT4sFXE

On Tue, Jan 14, 2025 at 10:50:01AM +0100, Alice Ryhl wrote:
> On Mon, Jan 13, 2025 at 3:45 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > > >> > For a series at v11 where there is broad agreement with maintainers within
> > > >> > the subsystem which it wraps, perhaps the priority should be to try to have
> > > >> > the series merged unless there is significant technical objection from the
> > > >> > rust side?
> > > >> >
> > > >> >>
> > > >> >> How about this:
> > > >> >>
> > > >> >> This clears the virtual memory map for the range given by `start` and
> > > >> >> `size`, dropping refcounts to memory held by the mappings in this range. That
> > > >> >> is, anonymous memory is completely freed, file-backed memory has its
> > > >> >> reference count on page cache folio's dropped, any dirty data will still
> > > >> >> be written back to disk as usual.
> > > >> >
> > > >> > Sorry I object to this, 'clears the virtual memory map' is really
> > > >> > vague. What is already there is better.
> > > >>
> > > >> Would you like the proposed paragraph if we replaced "virtual memory
> > > >> map" with "page table mappings", or do you object to the entirety of the
> > > >> new suggestion?
> > > >
> > > > I object to the suggestion in general. The description is fine as it is.
> > >
> > > Ok. I'm raising a flag because I had more questions after reading the
> > > docstring than before.
> >
> > Sure and so I think this is valuable information, and indicates it's
> > probably worthwhile adding a little extra information on mentioning page
> > tables.
>
> Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
> an existing file in Documentation/ that I can link to?

Sure no problem, I propose expanding:

/// This clears page table mappings for the range at the leaf level, leaving all other page
/// tables intact,
/// anonymous memory is completely freed, file-backed memory has its reference count on page
/// cache folio's dropped, any dirty data will still be written back to disk as usual.

To include information on page tables. I suggest something like:

/// It may seem odd that we clear at the leaf level, this is however a product
/// of the page table structure used to map physical memory into a virtual
/// address space - each virtual address actually consists of a bitmap of array
/// indices into page tables, which form a hierarchical page table level
/// structure.
///
/// As a result, each page table level maps a multiple of page table levels
/// below, and thus span ever increasing ranges of pages. At the leaf or PTE
/// level, we map the actual physical memory.
///
/// It is here where a zap operates, as it the only place we can be certain of
/// clearing without impacting any other virtual mappings. It is an
/// implementation detail as to whether the kernel goes further in freeing
/// unused page tables, but for the purposes of this operation we must only
/// assume that the leaf level is cleared.

Alice, Andreas - please let me know if this makes sense/is clear or needs
further clarification.

>
> Alice
