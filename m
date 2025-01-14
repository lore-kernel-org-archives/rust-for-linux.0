Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0C1E86E;
	Tue, 14 Jan 2025 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736868885; cv=fail; b=eKGyGUdYa5+x0W+fDvkbpWHctmKkoosCaSWKQ9cpjgjoonrmn8Ye+Qd76AOg3aS2J33SQIZ17TIl10tDegHftLZpXBbEvIgvwKK1+MUqvNRkjYGsqwnNd0DmsFxpboi3obaO8uhYNF/jSDyz7Y/UtSbEbu2wsJuwKjXHW922ieU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736868885; c=relaxed/simple;
	bh=Cnn7tVaJq9kwjiRPhRX8iXrkN/3b25PffKdldYmUrGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XCs6bGgrYEXaZtt5giOP++oVisRlZi9+jkmjNsFoeX9pqo/xsyv62ndoEN1ODnbrE5cZ+msn95CR5vkFNFEwt+8+YoReVRnzpmh/zYbFkPrOaaeYsMoaAP9DjIJboarz5VfdohSN1hYx1k5I6+A455tVQnbksjWcdPTlBx4/TvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hy6qMX8e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D//8iEq/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hy6qMX8e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D//8iEq/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EC0qSn020953;
	Tue, 14 Jan 2025 15:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Cnn7tVaJq9kwjiRPhRX8iXrkN/3b25PffKdldYmUrGI=; b=
	hy6qMX8eEyZZUMDCh22PzgFwTJFoIyu/N8FJrHFfWgzpzFY5V+7CN5LgICDdCks1
	rXfy+U4c6qjRd5QMh49a9q6qdaa5mrJiKfC+EeW25RWnu8StV98aowsk0WTExwiA
	bQeVQ8R6216O2/Y4M7oeAmrhPdl60Fa74ILtFUl8o0R9aHZPyUiZ8wodXbfBuYVl
	XJlZ7MsHLiLteiHspCVzZghZvXRo1l/t7thxQW49WsaCqm9dQ+vZQYf/3QSvfPYs
	tDOi/sGfzt+nJuuKKrEedv8JEOJCjs4JOucaBz9WV9GPolfhqHM0uoP+q/VnyO9M
	O2in+pWP6h31xLHV7mKNLw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443h6swvsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 15:34:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EEJo93034784;
	Tue, 14 Jan 2025 15:34:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f389gmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 15:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWNiOfSXM61mvqko11r1Si3MUUrZ2SRq1mf6V4gzQNNSCwwjCdYUoRzbaaEj27qgBe3vNED5Z1IfQp1BcD7ccyjpj+0/P22ygtZJVhsdOS8YIA+muHIB6kDv8Cm+uRyj+IUiplvHoAWHTMA3/u7gZmCDOl0uqUdTD5QEUsDIiBz6tX7bX15soylNVyy67wx7Yx4OR2ujldeNq1ry4kv6Avp04P2VfUzYBid3wUO0uMF5f9ZGe4A/XbwxQtRn8SkwIK24BniMqQ2MoKGGBx5AhqG+6Bf9E5WBDUr1jNoGWt+ZOiNRDzy5/Jbt8W3DE+a2eDRxCp0zbEcWTdHADCs1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnn7tVaJq9kwjiRPhRX8iXrkN/3b25PffKdldYmUrGI=;
 b=HS3qUzL79QKUyf/Zk15qjbnfWQ9oTew7zy8ngXL8aRFLPshuW/GWrvX0Zlxtg6WA9pgGkyNJN3E+ibYe0503Nc3HCtKj3/2k77wUHUjcd+zaAc2z4oCX5Z7/3Y7+IvVucdQhuAShWs+ugYl+SL5SXoZnODECjWvLE5IIAOKy0gDzgHIfrojSxCHYCn0AmZqgW1zZRiYwYTo1qshz7eSjCRk2PL3mWMP+W9L0iYv6OOo5dDp5KCVvFqAnZ9+/57XzOwmrBM64dPpeJ8wUK0m2Qhb3w4xact6h16fJfdfzYH416cndSv1//6S8zldKbJBH3N+HBU9qF+GS5nlf1zc23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cnn7tVaJq9kwjiRPhRX8iXrkN/3b25PffKdldYmUrGI=;
 b=D//8iEq/hz7nx8n5TcdK68x/hRSl45WJHvNm1HC98B51y69QKiF5MjSGzt4lJ3LVT3tX4KUvG1LJtoumV87ai7DSiQyW+o7Sng/nFCWUOOnSeaEATh6u/hx4nQYSJE2IuEQEgItFF3FgVgrny6ahq0WWSL5y4+Red5egG9acZXM=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ2PR10MB7670.namprd10.prod.outlook.com (2603:10b6:a03:53b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:34:02 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 15:34:02 +0000
Date: Tue, 14 Jan 2025 15:33:57 +0000
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
Message-ID: <cb8d8595-5a74-42f3-821e-75cd0bbfbfbe@lucifer.local>
References: <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
 <87msg09uzu.fsf@kernel.org>
 <qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
 <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
 <871pxcgg02.fsf@kernel.org>
 <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
 <CAH5fLggntnvMLoZHTm6zx3nSP4nq7iruK2c6iXBX-CXtVPYbcA@mail.gmail.com>
 <195559a2-8c5e-40f7-b60a-8534dc177d9b@lucifer.local>
 <CAH5fLgg-f6LvCTejO6f-04cQTRNC4rE8AwnQdN1NGuN_W2HxNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg-f6LvCTejO6f-04cQTRNC4rE8AwnQdN1NGuN_W2HxNg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ2PR10MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4443b9-9216-4989-e977-08dd34b0de86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzhIU1FHVXBTOTJ4cUdFbVRxY0dkU3dhMFpkMHdXNVRyR1grWWFnNnZnTWky?=
 =?utf-8?B?MGhjUjNTeGdyYXgybVdIOEdJVUZodzk2djBTRDVMMXh1RTI2aDVFWTI3ME55?=
 =?utf-8?B?ZW1ML3dMbHFDOWIxV0phSmQxNE01QSt1NHFlYXJhaXl1Y0JjZWJac1ZkYzVv?=
 =?utf-8?B?UEFoL04rTDVKTDJjV0h4TWl2YWlka0JXbUZZTkx4SjJDRmZIRmd2dWNBdG1q?=
 =?utf-8?B?UkRLSWNnTDM0TDBVdlQ1dXZZZWtYWDlsNG0xZkhjRytFamVQd0hKV3ZvS2V5?=
 =?utf-8?B?UC9QeVpLR2IwSjNUQlA2TVlNdFMzeTd5a0RXdnAzYk9CVkpuZHFKbitnZmcy?=
 =?utf-8?B?OFhhbFdIb2NNRzIvdUJNVlhMWE9DK2NnRWpwSDBxWU15cFo2UXNZMTVTMCtK?=
 =?utf-8?B?OWtpSEtEZXE0VzZQMzQ4c3MzK1RTRmxVTlI4aUZVcXp4bWJCV1JZbnBCb09Q?=
 =?utf-8?B?cm90azVBcGZNSjVzTkVyQUZFUktkS1g1d2N4ODRFcUZJZTM5RDNEakgyUU1K?=
 =?utf-8?B?aVovc2MxZFRUUmNpMW0wMnhCMlpqSGlmSjIwM0hINjZVRUgyWm84V05zSjND?=
 =?utf-8?B?RnFBRVBodngvYkpUT3hleUZMRmc0M2llUzBsWW5ta0g1aTVyaXRiNzAvelB6?=
 =?utf-8?B?QUJ5d1ZnRmlvbXdaSmlSKzNXUHc1ekloaTN5d2FwVW9ZdjRRKzE5Tyt5Vm50?=
 =?utf-8?B?MWVJbW1mZ003M3o5TzRzVGxFYUozaXRGTlJrTU5pRElzcDZYNGRFQ0xvQXV6?=
 =?utf-8?B?WTk4YmtuTG0rRFdKY2lXNUw2NTdWdkhVTmxnNUozdGNEMU8xZnk4aUFDQnRW?=
 =?utf-8?B?NytEV0lZV2ZnREtJTkllQ2gxOWx3WVp4K2tCcjI1L3pWdEFTbW1QNk80OHlC?=
 =?utf-8?B?Q3RnODJyRG5OWWgvMEhaZTRBdVE4Q255OHdWRlp1ZmhETXAzcHEwTGYxRUdZ?=
 =?utf-8?B?cFEvNy9UUWNmc0pKYTNvdkxvYWRnZGRmTHRRWUxKWVRuUzJlZ2J0VS9zVWVO?=
 =?utf-8?B?WEl2TVdQYTZCc1g5ZlVQMEtFT0Vxbm01OW44S0xneUx1b3BXcVQ2bU9RWFVi?=
 =?utf-8?B?ZW5ySUtFTy8vOHlyWUhRdzdnS1FLM2Z2aU5VU1ZMb1BGb1p0eDdUL2NPWmRL?=
 =?utf-8?B?T2VsU2Y5UVplWWh6RS9UTlk1WC9jNXdqMlhvbUt1d0pweDBWc0QraUlTaE80?=
 =?utf-8?B?VmJlbDBVSGZYWksvaGVsWXFRU3ZVcnVMdkxpaTZuclZENHZZUi8wcHFVOWpq?=
 =?utf-8?B?SytSbmNpNkpMVlpTWklyNXpTUzJiT2dGcnN1OFZWRkxOWU5mSm5IakJGMlA3?=
 =?utf-8?B?ZU8zUHhnbk1HNm93YVQ3TFMxRnVUL0ZiaVJPWkR1VkFUbmlKcENXK2QwdEtK?=
 =?utf-8?B?SVJFTDZvL3dqWjQ1elpjcWJVUUlyQ0pYQTMxaCtwTEJtZ1VBM2M0RzE5ZFds?=
 =?utf-8?B?d2ZkL2ppb0VjSG1vWUI0R3lrZkcwTWRadTFxbWRUS1FBRGF4VmVoczByZDUx?=
 =?utf-8?B?T3VZZExucmRmM0dleUtmeEJ1T1pQQjd0VzZoalQzWDhTTEp2NURySGlPSWhM?=
 =?utf-8?B?czZhZTdZRW4wQnBZQkRLVW1paHBUdW9pMjFaZ2VuZW9yQU83L3RRdVY3Y1VP?=
 =?utf-8?B?WlhhQlc5N09WdytybUkvVFBKcmhLSSs0aUt0THBjdDF3ZHd4b2llSzRlc0xy?=
 =?utf-8?B?cWxKR09xWTQ1dUpwWUVnOEJkKzJjekhVRVBHUkdKdE9CMUpZWE5mMGIxTW1I?=
 =?utf-8?B?RUZvZUlGU2FzUEl6MFRTSHVRSmJ6Rlg4d0NPZm5ySjROdWpUTHVHL2lVMUxk?=
 =?utf-8?B?eW1XSHZ1Znh2UE5Ickd6bXc0T3dmMVM5NEV4TEh0b3pNbkFFUjlxWnM1RFRp?=
 =?utf-8?Q?191RaX7SSjobb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHhsS0Mrc2RkVUVyUUNoT2NRM1VBT0lpbUdJVjVpR0ZTZ0c2dUlOV3dVbVFo?=
 =?utf-8?B?Z3hDekVKcWVEYnFleGQ2dHg0ck5KdXVnWXREZG1oVGhpNjdiTksyNmVQN2FF?=
 =?utf-8?B?U0pWM0dCUE9xcDRPUm4yalJLOFpJajdKVUdscER3Szl4Y05MMTNodG1jSFpU?=
 =?utf-8?B?RFhEK3ZFTzhUeHpmZE55Wk9VQVV1UFhLOWpDUHBzUFlnNVhscWQyczJSc0kz?=
 =?utf-8?B?Y3hRZnZBc2FabHk1WTNHcDNYTlZNREJia1pjbWhKNW0xRkwxZmFjM3c3Umd1?=
 =?utf-8?B?bTYxT0xxcHJlaUtmRXFsSDlPRGlWeDBFYSs4cXZtcEpSY3ZvZkZYY1dxTVVM?=
 =?utf-8?B?KzVvQStLNmkrWHdjTVZodzRWNnhjTHpKeUloOUVFTFJFMVFmMXY2TEI2bmJN?=
 =?utf-8?B?MklPcUdCU0VMM0RVeU5aR0EyVlhBNXNTNkE0aE56NHVwRnpuamdZNFB0bWxX?=
 =?utf-8?B?NmF3RllFeUxVMmhIZ0lSRGdxZmUxZEZsc2xMT0gyUjM2ZDdwczU0YkY5ZU5P?=
 =?utf-8?B?Mks4blp4RjQvYXNMZzJORXN5MC92Z2syQm1aeWR6MWJPZVFxdjd5MXlNMGRm?=
 =?utf-8?B?QU1LbGkxaVJ2TG01dGxHbGc0cmhCTzJvdTNYcG1RS3Z6Qk9ZbWFkdWVEaUdZ?=
 =?utf-8?B?WW9XU2JRNmF4cTlBVWxuZExSblI4K0lad3cwbytrRWZaTUdZdG4zUUNBdTMz?=
 =?utf-8?B?QXVDRUswQlhhTE1sU3d2YjFDZlk4cG94akNYYndzMW9jdjhXWG1TOTBKTys2?=
 =?utf-8?B?TGZOYkJ5SjV0Y2RvVEtGRXdscXhKd0FpdFFJUTMwdFFCdnM0cTNXS0xpbUJJ?=
 =?utf-8?B?NTZVSUZjQXB3VHBTZ2EyZnlSVTNPc0VIa3M3bkxwa09IbHUxU2lvKzVDN2pD?=
 =?utf-8?B?eE03OGJjZEQ4dzA3NHlDZnZUQWFQUk9vL29sT1ZRdkQzcjBXRitQRmo3MTcy?=
 =?utf-8?B?ajhNYldJR0dITTYwTTJZeFRpNi9XWEhVRk5Fc0FNVlcrenhabjVDRm5KZFZS?=
 =?utf-8?B?UmdIZkhkbjFGbzNudHNvb2hYR0lTM0dLU2VyVjJwNGZHS1U3cnRMU3hObG81?=
 =?utf-8?B?QzkzQmNBYXEweS9UaEtEWmpOMEc3cHh5NzdUUlJZc0RmY0xBVjkyUnp6alNG?=
 =?utf-8?B?YS81NDJmdG8rbVVSV1d4aDZQMVpWTVhFYWh6TGtMeUgvemdWNDEwMnVWL0pm?=
 =?utf-8?B?eDlPeGJsam1GUVMreDZvbCt0dXNKL3JPaWE3VjdMYS9lT1kxdW8yYTJ2RG92?=
 =?utf-8?B?WUxObWVDUUFVVnZYRWZxWkNxTncwU25nWFUxTmRiZEU1K0J0UnlRK2x3Vysy?=
 =?utf-8?B?UC8zaWNudFlDejk0Y0pmdngwREFnNC95SlE2ME92aGYwQjVXOTBOdFlyWUhD?=
 =?utf-8?B?QkZRYXNScnl2UklRRGtxeG1xbEg1NVl5eG9DMUJWczVBay85T2IwRVlSQkIz?=
 =?utf-8?B?M002ZEVuRUtnV3VZZWh0QnVyS0xVdG1nZXVYR0krNlduVlpBbzVML0lJcFMy?=
 =?utf-8?B?M1ZYNVA2Ym84UkY3aHBIaHFEc002ZGlJRzlIYTVsUlZ3c3JNeXhLdzFGM1ky?=
 =?utf-8?B?VTBwOUlkUnVpaFErNUVtWHpmbEdMam5YV09TcURxaWUrRGxOc2o5NHdOUUNK?=
 =?utf-8?B?anFVNHdxSDBoN08zQUltQ20xWFEyRE52Z25Cd3FkdDVhSVlucm9uSit3YlhB?=
 =?utf-8?B?akNTN0NsZndlZnE0S0R3U2xZazhKaHJNZGd2RjQ5NGI1Tk0xaVl3eUs2OHBX?=
 =?utf-8?B?RjRCdGQ5Z0ZrZUVkNWFDT3lHeEF0N2ZRK280WmZYMHB2RFN3SmZnM09HZzFX?=
 =?utf-8?B?MVYvbm4zcDRHdm5nVTF1Qm00akh3Y2dsMmdicjk2cUFiN2hiSUhaSUwzMm9O?=
 =?utf-8?B?czBYNk5WeURaNmw2N0xYYWxPbFlQWFJRMEprZGhNcERUWVhjRlBNako4akdY?=
 =?utf-8?B?bXJvVnBEQVhyVjdGd3NNdy8yZ3lHODJVY2hjTHVpUzV1aHlTZW9odDV4elB1?=
 =?utf-8?B?RDcrbkthdVBpaHNMVFcwcUUydnJaTUxiaDhTTVg5ZHJneTdwcHl2REoyU2RN?=
 =?utf-8?B?aGptdlZrd2hLajQzL1VxdTcycGRJeU9nT0JIcmYvOFg2b0VvOTdMYzV3K1I0?=
 =?utf-8?B?TnZCQTRYNXhabTI4TUZlN1BIOEV0Q2VMWld1emttNEhkUzlKZmJPc0VLand6?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/ikEBKOSirqeMt24e/2TLAEWFRRIgplsHOozTb4ULXXxjuhw/P0XdJpfv8V6Mw5eYWauz1wCrPG9xurN+wYPUEuhnin7G0nxPiC5HIp6GZEpm+hfVKR3zvVHJHfz2h7O9n48R+MP6C8fm4mVhqH5TY5UuMVTRk0OwdKJJKLldY2MZCvvBiqopz9qljfKQWypmuWaPk/3PwnDX7KZJoRe9clP/kkKGpUqUor7Q3Fmt2T7+MDnwwIuvZ3zmhSuxOQJmm27AE7ZZR6tNrqbaWtQdGRHzmbBf7nHxytDag4qOzlWVBJJuV/Kx/tDhJXQsZN9LBe24SggIGJk6nEd4GgS8l+To6VwIKsXKZFcZdOMmH6LaWVEQqeJH3nUPJztmDYCcafHcH2Usl0gHx/2zt0LHaUkcLZYni/6wNVbgK1N3oqoDVJ+qMTl2IG+P9wB1+O2qAfs4gUaXaMTp+PbXGdXTrxk+fYtqQ0pB/N6ckbs0zKFh8hYSvbOsfx+nx8eKtVx+TobsXrrfbkBPE4ZO0xaJQTHnR/IsMj0GhCnEqrkc/xJoofUAJ4heJn8yVvg8LiVK8teXsyuLvJNbcCv6aitnmVHposA+ZN7Gb1F2UF/dyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4443b9-9216-4989-e977-08dd34b0de86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:34:02.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaX9YxE5UE/DBWBg/xECDkKmi8Q0MM/L+p+cM6qFhUQ9WwiYLoWrIXJrB6j3Q2iH34D7veGv1QzIpdPbWofSreVzhVzte3isbuIBs6Fo6Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140122
X-Proofpoint-GUID: 3ylZEQI3bzp0qu0u5FcYFcgPClVxKf4L
X-Proofpoint-ORIG-GUID: 3ylZEQI3bzp0qu0u5FcYFcgPClVxKf4L

On Tue, Jan 14, 2025 at 02:42:05PM +0100, Alice Ryhl wrote:
> On Tue, Jan 14, 2025 at 12:57 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 10:50:01AM +0100, Alice Ryhl wrote:
> > > On Mon, Jan 13, 2025 at 3:45 PM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > > > >> > For a series at v11 where there is broad agreement with maintainers within
> > > > > >> > the subsystem which it wraps, perhaps the priority should be to try to have
> > > > > >> > the series merged unless there is significant technical objection from the
> > > > > >> > rust side?
> > > > > >> >
> > > > > >> >>
> > > > > >> >> How about this:
> > > > > >> >>
> > > > > >> >> This clears the virtual memory map for the range given by `start` and
> > > > > >> >> `size`, dropping refcounts to memory held by the mappings in this range. That
> > > > > >> >> is, anonymous memory is completely freed, file-backed memory has its
> > > > > >> >> reference count on page cache folio's dropped, any dirty data will still
> > > > > >> >> be written back to disk as usual.
> > > > > >> >
> > > > > >> > Sorry I object to this, 'clears the virtual memory map' is really
> > > > > >> > vague. What is already there is better.
> > > > > >>
> > > > > >> Would you like the proposed paragraph if we replaced "virtual memory
> > > > > >> map" with "page table mappings", or do you object to the entirety of the
> > > > > >> new suggestion?
> > > > > >
> > > > > > I object to the suggestion in general. The description is fine as it is.
> > > > >
> > > > > Ok. I'm raising a flag because I had more questions after reading the
> > > > > docstring than before.
> > > >
> > > > Sure and so I think this is valuable information, and indicates it's
> > > > probably worthwhile adding a little extra information on mentioning page
> > > > tables.
> > >
> > > Sorry, I'm a bit lost. What would you like me to add? Perhaps there's
> > > an existing file in Documentation/ that I can link to?
> >
> > Sure no problem, I propose expanding:
> >
> > /// This clears page table mappings for the range at the leaf level, leaving all other page
> > /// tables intact,
> > /// anonymous memory is completely freed, file-backed memory has its reference count on page
> > /// cache folio's dropped, any dirty data will still be written back to disk as usual.
> >
> > To include information on page tables. I suggest something like:
> >
> > /// It may seem odd that we clear at the leaf level, this is however a product
> > /// of the page table structure used to map physical memory into a virtual
> > /// address space - each virtual address actually consists of a bitmap of array
> > /// indices into page tables, which form a hierarchical page table level
> > /// structure.
> > ///
> > /// As a result, each page table level maps a multiple of page table levels
> > /// below, and thus span ever increasing ranges of pages. At the leaf or PTE
> > /// level, we map the actual physical memory.
> > ///
> > /// It is here where a zap operates, as it the only place we can be certain of
> > /// clearing without impacting any other virtual mappings. It is an
> > /// implementation detail as to whether the kernel goes further in freeing
> > /// unused page tables, but for the purposes of this operation we must only
> > /// assume that the leaf level is cleared.
> >
> > Alice, Andreas - please let me know if this makes sense/is clear or needs
> > further clarification.
>
> That looks reasonable to me. Thanks!

Cool!

>
> Do you have thoughts on the wordings I proposed here?
> https://lore.kernel.org/all/CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com/

Oops, missed that. Do always feel free to ping me if I seem to miss things!

Will reply in thread

>
>
> Alice
