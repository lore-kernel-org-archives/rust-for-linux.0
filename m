Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD820551F;
	Fri, 10 Jan 2025 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525418; cv=fail; b=ocK5MNgb3rVCWGDkjmOZIW+OmgNmdMbG0+fSQyVkCN7p6wXNktkQl2DsB182u7H7ropnQqI1EyhRiyAkZLHN2EMPC7A7uTifleWAoZgWdImBj5a9Zw5Z/qCllnLjXcheGVltdxOU3urh+Du47zGa61YiwdJ585HOz1L2uWuyB+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525418; c=relaxed/simple;
	bh=8558uLbdZgfHgMAxXL2kx68vPFJO3pP8tQXHO5rJIPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VE+AYPpxfuu65FndcypR9Ut9wJsYdpWkV5/xaJH1nMkxPRl+5h1hSwP5e9RCj6Gf763WnyrFH8oE49hfIqX+NswRPg3Exrz7xCO2nTKySpJ6CVmOjhUPNktWwhTnZYcjEP+j5Y4K3U2Bc0utBj3cbpvBYyKUPspjzDQPDyft+vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m6PRBhB0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xP/3/Ce+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m6PRBhB0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xP/3/Ce+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AEOGGa016411;
	Fri, 10 Jan 2025 16:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=GWqI9YfOZBHuAswyZv6U29mPY9MeH3Yxdq27CaFoV34=; b=
	m6PRBhB0LVVA/0MuU0Y7Hek9Ma2bAuYCruhBPwG+dhPba4AGAIloGZIB94AIvVa9
	nWfofWhpsYeM6OCOBYJ/wE0exa3FM5hAvrvYlcCXq6WIners4hqLifmDoeyKFBIr
	XUOtFkmuK4uZLx8ngnPeOIjZ8IUPN9Fl/l9VEMKnUFydswDPigz3Ol61cXzFVPQy
	9uYvjA6r2STVB/u2eGYK6eSyuLxgnTzmacS17DPriF0yZFTl/ut4vvJk4g+/HE7a
	oAvl0jI6RKzjXPC5Fq3FaGX6Y6IOtN4Q/oO5ad45sAlArL4qVulAS3xOMqNbR9Ss
	ky9EgnqmcEXGBwcZsYG4Yw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442kcx9t8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 16:09:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50AEZha8019879;
	Fri, 10 Jan 2025 16:09:42 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuek06jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 16:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZzRTdlqsPL6/0r2JLsDhbZnST0qZWYaEV8WpOfem8z2LFssHIBcMot6oR6D7eyAJTJSGWzXuM2E2N2bOgIs7MUN18WBa+H4P7g/4PbEqaB2jO9HlmgsiHIIjCUU5u37Lfy5XuWel8HcOmYxmy3CeaDEJ380nfXO7iiNTASB36TL9bm1LTQd8IKtRH8t9bv3YmlgphGxXoX+qEPdHE05Cl3QDJ1L8WCDuyDFBVaVyolRjL8HALRUNUaLOAADRk5wgytKBrbTMNVF6OQOEMdfNsOMlKXakgHWYuyDv/7E1TCz/c30eZhjIEjG82550URYPjS+5c8DrmXre99ibcQVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWqI9YfOZBHuAswyZv6U29mPY9MeH3Yxdq27CaFoV34=;
 b=MNs3wSQGrMKwPeTUTogaBSHl4pzebikrnDqA+1iAnoQFLPYIW088yae1SRJ0cZs5pZnfI0hw7d7L35LTuWdrzo0alu21yjJgmi1M8NVct+ODnFR8Rr0AVfAPoJLp2QH9IDcuR+gtqbChrk0eg00lHO2he81G+rKQ7FE9vDNTz4nlzEKp5IvuvQaJor9QsnmhAswCW15bhue2oueH0FIqB3bSC5kOZeobtyRUOZU+HtOC+uW9VbZ/elZcqGWqEFaCAeo1ayKJ6y+Snp3I4Vn/f6uZCMoBiWO/8lHlpEat1qhxogfT01QRIB+hBpWtg5H3uJOo+Nnu/1F7Ar2oDXZ+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWqI9YfOZBHuAswyZv6U29mPY9MeH3Yxdq27CaFoV34=;
 b=xP/3/Ce+NnSss3a4b177/Top8Z5bEzNuLrLYOJK43PSTSdt9ZsXcNjeASKkvQPI2p8+znKPkZb6fl7DKV8me8f7wCkVOVoxExinqz0IueglOEkGDqlXcrzst/YFUKWBL3FwxpXoYzpmOWDJeGEs8lrIMDAVHTHmTmbjh7VLFqPg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB5728.namprd10.prod.outlook.com (2603:10b6:303:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Fri, 10 Jan
 2025 16:09:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 16:09:39 +0000
Date: Fri, 10 Jan 2025 16:09:31 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Frederick Mayle <fmayle@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
        "Liam R. Howlett" <liam.howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
Message-ID: <a1afdb55-29e2-4214-bdc7-8a0e6df65c14@lucifer.local>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <20241211-vma-v11-6-466640428fc3@google.com>
 <CAH5fLgjBmErL48-+Qfbz+4SPn49tUdS-5CYLzyPBAN6oWNvt-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjBmErL48-+Qfbz+4SPn49tUdS-5CYLzyPBAN6oWNvt-w@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfd4939-6b93-4170-0237-08dd31912f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG1rTHp4MDJkNFRrUW1Ed1ZJRW1xQVZGb1FVb3VzbEtRbEY0VlpOUDRKK2k3?=
 =?utf-8?B?VW0rYlVzMG5mN2k5djArNG1icE9OblFXRk5mMFk0MkZxZ3hnejd5UmROSWZF?=
 =?utf-8?B?cHR2Nk9FY2xUSldrSFNxRStuNDNaeEdSUjZGOFlwTGdYSE5pdXJOQlA5Q1VO?=
 =?utf-8?B?aFlQMFVDSS9vZTZoVmo3SWZnR0xESHRtekRtYVlDYyt2enVVOHJFV3dzT3lN?=
 =?utf-8?B?ckJOT01RWS9KT09LQVNzT2llNlZmUVVUS3R0M2RxK3c2OERvbDRHT1JhMVBH?=
 =?utf-8?B?QmJTNmY0WXBybW0va29WRHlGUms2VlBCeWsrN3VSemJjdFZCdEhSTDRXdEJz?=
 =?utf-8?B?eVVhWlY4VDlNcXg1SU5QcW10bVVyZXp6TGZ2WTNXRFVPVUdrNk11RnpXKyt6?=
 =?utf-8?B?UU5TejBHQk1TT1ZDSFhzUXZzYUxrMXBIeGZjZmY4UCt1QU5KempiaCsvMW9E?=
 =?utf-8?B?MktpYmFpdm94OENwYWtSV2lHS3BoWCtLTTJqMjA2UmM1K0pYSnVJL2tZRkI4?=
 =?utf-8?B?MzNvNlo3WU84cm9wN0wrVm82aCt1TEp2cGtIVTBubUg1K2VxWnZYdXkyVE5s?=
 =?utf-8?B?VWZMTStrMXl1akw2MHpmZXB6aTdxeFJkN2EvVzY0a1VsTURpY2x1eExVQXZB?=
 =?utf-8?B?ZStieXB2YlVKbyttV2FBSy80U0pST21lZSsyTE9YdzNHV1FybW5FZmZqdmFl?=
 =?utf-8?B?b1JyZFlpUHU2K1dLc0ViL1Vzd29KT0ppMThkdGpwMDBkMlkzZGhUVFB0eERE?=
 =?utf-8?B?R0FjTjYyYzhCNnNyMllZQjB6aFNIc3c5Mm9UYlY0WElidGtydVhsZ1ByNFA5?=
 =?utf-8?B?YlhyKzJUM3JQUzRybkZiaVNSdTRhb0dNSEtXeUhuVmVsVzFWMHlxdmg0enJP?=
 =?utf-8?B?S0tjKzNUdjAySEM2TDd1T3BYN1pKcXh3Sks0S0VYVkRnYTNhRWFLazZZZkQv?=
 =?utf-8?B?WnVIQzRrcW5kTWJFYWwyR3hmUnZqc1RLODhTRExzUHBEWTMwWVJZdUlhaU5Q?=
 =?utf-8?B?ckFRTVpCb1p3WWc1NFdnRVlBVm84UzJpODdDV2JtdTR0SkhMbEt0djhCSG5h?=
 =?utf-8?B?K1UvbnFvM3VFVHRRS09pbE13dTkyaysyQThGbVk4dXgvYWhuYTJrNkdidmlD?=
 =?utf-8?B?bmcyZ01tMnlIeHRMZlp4WkNLR1BTamdTSldmY1NaeVJPS3dJeDJGVjZsTHVO?=
 =?utf-8?B?WTdqMGsxSHA4bUVaY0JsSGJNUWRlTVpFNGpCb0tlMUpVYkh1QlpUYUVUM0Va?=
 =?utf-8?B?K05UTkhBSmZ3VEhyOWF1VTh5RjNWUUhHMmlPYWFCK0FSNUJrK2xNVE00aUVq?=
 =?utf-8?B?eUJkK2NlVFpEdUtwTGxvSFlwVXFJK3ZhMWpzbGZyOVA5c2grd241a1VMcG9Q?=
 =?utf-8?B?TVhYSVd0MlhzQ0k0RFpWRlp4S3p6MGZuTDh1Vm82c0NMRXJHRGRCTjVYU1cz?=
 =?utf-8?B?RC9WZFUyS2J6NEJaYTNrdmkzTWY5WDhpYkdkblk1SERaT080WUVxaU0wWVJy?=
 =?utf-8?B?SUZDZHNKUEQyMmZ1OEk0ZDFVQ1lPQXliUGhVc0VqTWUvRkNwVUR0elVwaFZF?=
 =?utf-8?B?cDFMYzB3SEs3V3JOd3djdlZGWWt4bjZ4M3dndTQzNmp5Uk12QmswWmJ1N3I1?=
 =?utf-8?B?SWdLdDNtblN1OFdIK2xQT3hDUmd6bFc2cm1kaWgxWUVGUFI3OFlyZWgzL1Bz?=
 =?utf-8?B?TTAwUzd3YWJHa2FIMWo3RXRBTTNzYmpFQk9xdVZwMGNsNFZFWmZTcnpMRkpp?=
 =?utf-8?B?SWRpOVFjeGdqWm43T2c3WmFpZkRrVElKV0hiNHNpVGUvQVk0Tk4zWmRHSU1E?=
 =?utf-8?B?a0gxZDYxVitaQld2NDFzSEliU0R3ZXc4dnp1STFuRnV0R1lrWGdpSkpxQzFk?=
 =?utf-8?Q?F5knuPPTFkLQB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmY2NEdkMmE5NlVXTFEwZjVhK3ZZWmFQTk9qQ1N1T01OdlpDNGo0ZER5N2E1?=
 =?utf-8?B?cWFPcWY2NGcrOTBqTCt0M05OdE15ODUxSDRlL1lKU09vbHh6dkZIczRyNE53?=
 =?utf-8?B?VHVaUmh2RjRnbEtlYTdMb1dBK2k4ZG9WbWNneEQvWklSWW9ZeStacy9DUnVO?=
 =?utf-8?B?SjI3QmIxRmh1MStaUm9DODJNLzNRdXJQNkpDSzA3ZVU4YksvZS9OQktsTjJM?=
 =?utf-8?B?SVZsK2Z6cEpYcFlkcmJtYXErMDdXdkdYT28zZ201dW1aeVpDdk54VTM2MElD?=
 =?utf-8?B?dEJmQ3VBMXBmT1VHbHdwTWtVSHJFbnN1cm5IR1V0blYyTVUybjI5QVN4RzNT?=
 =?utf-8?B?RjlkbTZkejVkTHlMbmlOcW5CNXdxd1BLMTFEWWduMk1ESGdTRU1oWHVYdkdG?=
 =?utf-8?B?bDZ0Z3MvRnc4YXRjQVVNT3lwT3dqd3BEeGdpRjRDYW1CVmtEdkZteGlaRjJx?=
 =?utf-8?B?Y2NYa3lRRkJ0eUMrSklJZ0xuMERTamtJZ3FNY3U0NzRUdnYrZ2dYYjZjNHNZ?=
 =?utf-8?B?UVlMajJlalI1a0g1Qko3dWp5aTN5YWdLdE41US9FNjBsbzN3UktYTkdmdE1T?=
 =?utf-8?B?UDgwaWd1K0o5Smd1WTdjRngrek9ocVkvZk5DaTZNWXBVcTBTL1NxNWU2YTlD?=
 =?utf-8?B?WDI5RTBMMm5NYW84TitxWm1vZGxKZW5oTm5zUkNIZEdvY3Z4ZGZkbHk5S254?=
 =?utf-8?B?VXZkWHd4TTVSZFpJL20zaTlWTHV3aGtLWjIrUS9pT29nVjRmTndVVCs0ejJH?=
 =?utf-8?B?TnhwckpYVSs5My9wbSs0eVVjcDI3MXAxQjdLdWwrbTVKQWJITzJMNkNTeHJT?=
 =?utf-8?B?cnpSeXBtenFvSjdUbzlzK0pGM000R3JTcm5sYklZNzY3RmM3cUloeDY5emZx?=
 =?utf-8?B?TEgwMnE0SVUxMERaUlAxSmVwRGxtd2xKTUFQTFF2SHV3Tm9UQU1JQVFocmZP?=
 =?utf-8?B?V0ovdjF6UHN0TVFybFY0NXFQeUR4N0FObHFIb2VxaCt1ZGZISXFGNzAwYVFU?=
 =?utf-8?B?S0NpZjk5WVlZSTlhM2J4TThFY2JRbDZGUm12VmRCblpFM3FvWnVoeUhRR0lW?=
 =?utf-8?B?NmJiZXM3NmJ0OUp5L3FaUDZJcGFIUGs2RkxvUWFSeGs5RWpvWjV1WTdwRjJO?=
 =?utf-8?B?eUZXdmhoY1NxRDZoM3ltL0lTdG5hNTlCdVRwNmpCVTRnc1pqWUtMMnhvb3pX?=
 =?utf-8?B?a3pKRktJOTd0MjdldjFHcmRCV2FHeW9VcUxTYjF0Q3haYnVEMGdsN1R5N1BI?=
 =?utf-8?B?WXMvbDBuYVVpTWZPWVpPNUc2bmhpUkN2MnA2UkdCSXVBOWl6NEd0d3o3THcx?=
 =?utf-8?B?ejRpNStnMk9GVkhURlFQS2czbU10dXBVRnJvQW5DY3lHMENkWksyOVZNM3Na?=
 =?utf-8?B?SndkU1EwNUcrWnRhSkVCbWVVcjhTa2NJeEhrekUzVnhnMjRKdVpnSFl5K083?=
 =?utf-8?B?VlVEbWtvb1hHVDZkVW5SK3FpV1owN1A1eTJoVXQ4dWtjL3FlbXVqdGJtQ1Nj?=
 =?utf-8?B?VVpLOTVqMHZ2cDlCTG1jbGJSa21yR3I2M0dOL1pZdkVBVDBHZmhBcG9PUG8y?=
 =?utf-8?B?TzJaT0RPZXBKWVk1S1B2YThSbDFqbjZjUW5MYlpuYnNHQmMxZExzaHZKMjda?=
 =?utf-8?B?L2ZBbWN0RDVtdTBTb09BeXFvRmM2cmNqWGN0ZGxWcVRYalR0RkNYTVZQUGNy?=
 =?utf-8?B?eTZ3M1V6YUU3azN6Nk1yeitTVTBiM0RmajI1bG9iVWdTUXNOa1NIT1FUR05Y?=
 =?utf-8?B?bUhoVnMybXB1R011Z3FaSVN2NTk5bnBKNjczRVhFbHZ6NCt1OW53WC8xUEg3?=
 =?utf-8?B?U2NsRXVTYm53L08rVXZvRm92cGdkK0llWXc4eFBkOW9jbzBXdFJ1bkkzcGxn?=
 =?utf-8?B?WFRDZFhrZUZiSk5vb0JFOG1oSzJVTWFkZm5wMzVsN1E5N1pUakNhait5Q1d4?=
 =?utf-8?B?anByNUJTaDhaNGpTRU5DK3pWWTVQMkVjay9ncTFpR0tkbHgvMmg0U1RZcFJm?=
 =?utf-8?B?OGFTK3FmTm1wUHd5TFNkZkV3Z050b1FRRVg4OVpWYW8zclJjaUNOaU9vQTZW?=
 =?utf-8?B?c3IxbTJ6T1hkbkVEaHhtaHkxZDgvL2V3NWM2NE5mUUo2bVFLR2Jrd2xsODZ6?=
 =?utf-8?B?bEc2V3BnRVgxOWgzR3hvMzJiV2J5cG5uVUVSa1lwQ2hET29xL2NMaWlLck1J?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	87jJLFkW2fmpzKijOB7icIbYzEeXMM33Sx0HyTRpcWwl0ayU+cIBYHyI249XzTJG1Gb1sC/1LUGSGA+a9/GDjopvQSbtVFiWg7XyTrt2lBf/jjtyrrzzq/LQdkNk9Cr7one6hL5zD1yV4DF2whTfMmyNq5EP9SovFAEbVVBGe2lFswih1a3v+b29l3a4x0/Zsk8Lot6RF0VQd7mF7LM1IK4F5nykPBO89R81hs5gYrQS49oCBYEPh/yesutesjCCFdJzlyLNcYrAmWZvSbW/wyDZZmvnkLvAktwDFYa5vqHTjUQ8a4sKFU4/3rPUvcbC4Nw+nyWGsGxAmSV9s1PLKj7axAHmusHU8vN4wWs9BO0DRrLSYv6EetOJGFJlS18w3lCN0cftX6h7CnS/jdvrC07Wo1v8KWpb/PcoTnluv/qkNucaC8d+l+aFG/IzEexpqlQRafEOH/72b+GtA90LTtAht49hZ9h1W8QZiXjNsY4poaoYFha9dNTqdyPBtDm9mstouohZv9ZP7xBz+8Ydxm5blNNPN1Utw8+0Fd09ewDQr1lN23OL9I+0sMqK+QlMA42TOti/ZNt+WUgCYrtEHt7ffUxuwamk0XL0DwSiCHE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfd4939-6b93-4170-0237-08dd31912f31
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 16:09:38.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pfURw4l6uz0Q/3gy1SX6284KHH2QzZer5NpQtbi4o6Z8etSmP3wLhQaWfCiEexJvVTv2cVh67WaqAVFpCpFHkXZ37RBj8X6JsYIJWypJH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_07,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501100127
X-Proofpoint-ORIG-GUID: Y_r1rf7swnVWPY2_oIq3rhbJ83SEUtUA
X-Proofpoint-GUID: Y_r1rf7swnVWPY2_oIq3rhbJ83SEUtUA

On Fri, Jan 10, 2025 at 02:34:48PM +0100, Alice Ryhl wrote:
> On Wed, Dec 11, 2024 at 11:37 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > This type will be used when setting up a new vma in an f_ops->mmap()
> > hook. Using a separate type from VmAreaRef allows us to have a separate
> > set of operations that you are only able to use during the mmap() hook.
> > For example, the VM_MIXEDMAP flag must not be changed after the initial
> > setup that happens during the f_ops->mmap() hook.
> >
> > To avoid setting invalid flag values, the methods for clearing
> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> > the return value results in a compilation error because the `Result`
> > type is marked #[must_use].
> >
> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> > we add a VM_PFNMAP method, we will need some way to prevent you from
> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> [...]
>
> > +impl VmAreaNew {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is undergoing initial vma setup for the duration of 'a.
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
> > +        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
> > +        unsafe { &*vma.cast() }
> > +    }
>
> It was suggested at https://r.android.com/3389887 that this should
> take a mutable raw pointer for better intent. That's fine with me
> (Rust doesn't care). Lorenzo, what do you think?

Yeah sounds reasonable, in C it's mutable right up until... well ok it
never stops being that :P

>
> Alice
