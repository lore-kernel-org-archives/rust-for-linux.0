Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE5C1FBBE8;
	Mon, 13 Jan 2025 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779559; cv=fail; b=khqNiAZWj9sOH1tinriuKcDUiJL+iBGYFkS1nqMHmL0WDfgF8x7/SFFoUPCifJR1e+TnpdOimP10xInLtpbWwpMcwb+l2v7YCpzauEzkg1keUdLlKQ5PNWIwkm4V2+3xH5RV16/v2d/F8PF1A0mtdF/rDJgvNX1lEJdeeneb9qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779559; c=relaxed/simple;
	bh=c7MqG56Aa+x7MQXcaG40dXbKP21h54jjGcJJiJSo4Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AbRhO4bxcNcp/38N6DVMQlkJFEYOaUsfs7xnx6L6lb7gks2R9ItTIwVEGMGk68rSnBCeJEHUwW61dbmBk/h3tjNXSIJJXMyKmc347h9GOflZEx2mjXqZzA7FlFzdzuviErWggrI5g/mAKk/oBtWOYlMYb67a/jWmyKgWsYGkenA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ow7IXmDw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lclhz00P; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ow7IXmDw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lclhz00P"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDi3kF018852;
	Mon, 13 Jan 2025 14:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+jQCp0n2mqw0B/X5JIejtlhS/QdgOjQslSAtBGQ0p50=; b=
	Ow7IXmDwZOt8+gOJnbK6B2bjNU/qAcOTeisLJJ2j0g6I9ZubDw5D5ghoMAvET8gs
	XN/RvYt67Uk760jveQczixgd1oJoEp2cMIZhpWv7YYG+3BQSkTiv3wFq5uXO/aWw
	U6s793Y5GhNmkh9N/1mYV+aTKHMwkzp5KCfUtM4eoDIef4Pb26plV/xk1gL5xnE8
	BVM75oIwx+GRoFNuBbUlCFfzI0TAOXgj/KnSYytRiZmwYhOaT116qqTLM/g7U6Gv
	NmJxoJOhlk3Hti38mFf26pvm1Bbxvq3zkdYisafq28ff3WERByysy3rys7khlXJF
	hdIVVxtJj1MpkjME7R332g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8ukv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 14:45:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDkVIb020411;
	Mon, 13 Jan 2025 14:45:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3db2je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 14:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5gQ8JKDtktS/h5HsAe5thAFthzCrcZ1D3QaQ+BiDJw2RvjJ+4rUjy/KqS38HbVN5KjPc1m59K9G3bKaSDkJ1+qjW4bKb5h+xjXeN31fHF0TFloA/z1W6kHTMBDn02ALmjwPR8kI9Av0X8Pj158iHn37QIA09jc5BPXSjFfoZXaixPin/D9RU9kcVo1uXGuQ96bKkQdFUOJsda9Fu+zqI2VJG4yQa6tk/gux/FGfEwZAzNfULqnmNigxaXM3ZhEjlRgSCUAeX9ZtBNhP4fdToS1G/gU/YDDkkP+3rtZ0NVbSt7DYNA7UbLlJjHWCOJsfwSmTOuqGuQlvEfjaKGxdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jQCp0n2mqw0B/X5JIejtlhS/QdgOjQslSAtBGQ0p50=;
 b=uVJMDMSGyPGzHt5Tgu/vv4NAvGnKTKJvh1KXe8XgURr7Td0h4FkKpizPs4ZxYuQNWvCcXzxbVhhK3vZVnxTl3mv1Hh05VKzwYnHlmB8rvARgImETrJpr4I03ea9rba52uVPZaiBPscrMrmiBoUZSSFp89fbg2iaGj74I0Kf35Y6NpIs6SJCbVO7k6FsUpqtSJjRpy67N6qRZ4iCG5lezDNBPwNZlXhy4gZ6i9e1uRtpEo4hjo30/Im6eYiBEoRWcefy4rZjyIcMTvcfGSHRvVSY6IsARDfMIhYB4uGn5+Sii4nsi12uEjgTskTPtZYQ+k2jVGqKdW8x6gFR0B3uO7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jQCp0n2mqw0B/X5JIejtlhS/QdgOjQslSAtBGQ0p50=;
 b=Lclhz00PQ+8Kt0Wmmg01pgcbVBscc6wArt9UZLerPt5vm8P0m0HKclBWLqApDpbyNTfbCW+VrHIpWl8cHzTQ3v5pef3QA54u2utMxwlh4liUfS05i7WRevxra59k/Rmbf8Tb6EExaMMo//TwTyBxvkuqqGWmfpJ35Jadssgs+a8=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6996.namprd10.prod.outlook.com (2603:10b6:8:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:45:19 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:45:19 +0000
Date: Mon, 13 Jan 2025 14:45:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <ec1e87e9-2d84-435a-8e2a-1d426a9c13a0@lucifer.local>
References: <874j33ddxt.fsf@kernel.org>
 <51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
 <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org>
 <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
 <87msg09uzu.fsf@kernel.org>
 <qG6w11OwPsgdMa-EKR7V-NiBoOsQocuJDWurazcGSwtN601gK8RP1_un0Gx5MF0pPoKPnEL4ssYKiJUUIkF_Hw==@protonmail.internalid>
 <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
 <871pxcgg02.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871pxcgg02.fsf@kernel.org>
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: b135c1e6-91c1-42e1-76e1-08dd33e0e6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXBYdjNYbU5qR0p4N3BSdExYR1NZZ09lM1kzRFF4SHFrQk9CNkh2UFhPbnpI?=
 =?utf-8?B?cXUyR3pobXh6Q3g4ZUhXQTB4eEpFTjhxaG1PZ2gyUVljN1dSaC9YZmpDYm54?=
 =?utf-8?B?SVBsZ01DSmI4UTNoNDJqelJVcW0wQmNJdnlCMTRScm1JSVYvVmtiQjBRUWNJ?=
 =?utf-8?B?bEd6dDBSR29HT1cwTDNkSzREamplQ3RHb1MxdnhUNWtnem9GaG5wdkFPbHRO?=
 =?utf-8?B?MUozZ0RkUUdWT3hRS1E5eWlhK1cwYzB6TDZaRjhkd0FXWldpa2xtVlBmTldK?=
 =?utf-8?B?RFpXdnhWMUNKc3d1RGJpdHdzZHhjUnloWHJKcWNlcjUzc0g0aHZWeVMvVzdZ?=
 =?utf-8?B?WlUxUEdSQ0k4MUNlcm4zUVhJUzRrc1A5ZmNQUzRmaWY1cVVlZy8rVG12UzJV?=
 =?utf-8?B?NW42ODF3Z1ZSQlNzejRZNTVidGRUOFBjeExBSjZOSHFueUdIT0s1czhuVWJV?=
 =?utf-8?B?aGkwT3lOSUtrWi9oUjBkdXVIVUdvcHhCcDdRMTBOUXpxWVBTc0ZMamNnWnhm?=
 =?utf-8?B?MG5ialN2NkdJcEZJeW1uY2psem1sMkZOZXJ6QVVjWFQzT1ZOZnVUSEsrK29H?=
 =?utf-8?B?YWJNVHZwWmYvZENDNEErS3JLL2JKakJRa0lXVE93ZnZBOE9MUGlWeDhOUWRk?=
 =?utf-8?B?clpIMVNwcDZscFl2cDdaaE5hVERQaGJRZlBnKzhOSXVhdHJnMXRFQTJad2lZ?=
 =?utf-8?B?MVJOUnI4UGpKak1TRjlKUUxjUDhVb2tsSnVSenRZN25yZnBEL0JhRWU3WG1Y?=
 =?utf-8?B?ckhhU1E3cEpUc0dYL1JiQVdYSG5wUzdzU0ZtTnlsRkx6a0ExajA2ZDEzS2gy?=
 =?utf-8?B?R3FzR211Wk5WVGJiL096ci9MU1V0NVBXTEU3Tyt6WFNodmp2QUhkd1pNL2xI?=
 =?utf-8?B?OHg5LzNLZ1NUNFJMZzBxRjJOSGptSnNXWEVER1VZQzVwZ0xZTXRHVHZSUVNx?=
 =?utf-8?B?dDBaQjNNVWgvQ2Vab0pzLzA3WEJ4VFBpZFA0YlFuQ0JnNFRnRnBRTWJOTnM5?=
 =?utf-8?B?SlBzNkFpWUtEc2JObFFBVU95TTBpWVFMMlFScDBTcHhzdEtTQ0JzSi9EWTR3?=
 =?utf-8?B?TjZDcUZZUTNObUtGSmRjLzh1eStldDFKSjJTSWJMa0VQZTlTWWhXUnRjL2tQ?=
 =?utf-8?B?MU04VkJ3bHpKOFQxNHdyTFlVeFRnb3FTWWNhMTBFRTJtTFpuSm5ZMlFZdTMw?=
 =?utf-8?B?MFVTVis0VkhuZWUyUTVTcy9YYWVKYmRRcXlmYkpCd0JDVE5Dc3pIZm53Qk5G?=
 =?utf-8?B?RHBnRFFYUUNnUlhpUEIyQjVpaDR4Z2h1R1NNWjMwTW1uUjdQYXJsbW1mSDUv?=
 =?utf-8?B?RHZMN3Y2b1VPZ3pVeVl1dFVZOWVUYXpDUDJxMGN2RTRHelEzMHR3WnhMVHdp?=
 =?utf-8?B?UGh6VUdod3lmem0rdk1BdFRIN3lxSThSYmxVaEJlYk5PdUNBbmh5V2Fzd3lZ?=
 =?utf-8?B?WXVFVDluc1RXWVUzM0xyTWozcHVoV055YUJaUUplUlRxblpIYVNFcVpPU1Vj?=
 =?utf-8?B?WjhMOVRqQjlNb3dibTQ3SHJNSUcybVhNbXBseSs0NmdYZ3BId24zSDR2c1N2?=
 =?utf-8?B?RXg1U2IrZExyRnBzUmlkNzBtNkR0WXZtMUpxTDFIeGliWStjUEJ4Y01aa0th?=
 =?utf-8?B?QXNMaXBPOGF2VGJOM0NEMDBlU1B3RjI0OGQvSnh0d2prc0dNKzdTREEvWjFr?=
 =?utf-8?B?RDlpaTBPOE9KYmo0OHlqVzZhNnR5YkREb0Z1eGJtNjFkRmliMVUyOEZIWXJG?=
 =?utf-8?B?VThybXB4UXphdnNjb3VoZmpVZFB6dGhTdVdrL1pYcnlYanNCRTlkK01rQnhO?=
 =?utf-8?B?cHVua3R0OWx5MWVXLzNLQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHZIdVhzOFBVM2pDbVMyOFJXUmI4NTAwc0xia1gweGpOT29WUzVxQll6ekVP?=
 =?utf-8?B?REU4RmJpNmE3M1ZaMWZ3T01rZ3llZGRtMDJ6cmlRWnNJSzU2Z1FPeUZTcVM1?=
 =?utf-8?B?ak1IK0dDUWtqMUtuNk5wR05HYjE3Z1ZMbVljNGthNnVldHJPNkVkSFVvOWc1?=
 =?utf-8?B?M1IwQVRNVDltYnVzY1lCN2F5SGRyR1BXRnhIcVJiY1pZTmduTUZQdEhHakZt?=
 =?utf-8?B?L3NPWUNkVlNCQjlKY2RJODhWRk4vNUN0VU9wazlsd2NGMUxYK3FTWDZRUFQ5?=
 =?utf-8?B?a3pHS3pnYWZXaHlJVzhSdHFoMzVWSE1BRW5HUmJRajhQM082RGY5ZWFNWlRq?=
 =?utf-8?B?QzRnVHBld2ZOS1UwYnNFQWJ1UjNGemxzZmh0RjVGdmduSjdoV1dSSmY3VDBO?=
 =?utf-8?B?dUtTTUx0OE4wTnVDY2YvclFQQWNkTVdFVmtkSm5CR3NSemM3bkU0WHBNQ24x?=
 =?utf-8?B?ZGtQdzQvc1ZSR3lXcHorZHRsb3JuaTBRRGhjQnlZTjV0TEl3S2F2b0l3TGsz?=
 =?utf-8?B?S254Q2VyU3lkdWlRY0JTTVBFZkNPNTlFaFZOZmtDZ08xNVhTeThNMU9Ba0VE?=
 =?utf-8?B?Uzhud2FOUldpeFEwZlNHNW9PdERwaUM5VWd6WUF4MU1NM0c2Vm8rbDNjZDlQ?=
 =?utf-8?B?bm1PajJGVHo3SVJodVVKQUpGZkdMMVNCRXNGWVlMZ1lmMXIvSTBONHJsZHpE?=
 =?utf-8?B?dlM0STVvWVhLbW94TEs2RWJrTmFLUjVCUFRQcHdTaHM3alh2VzJJRXlRcXc3?=
 =?utf-8?B?bVc0Ni9BR2toeFZSY0FITFM4NzFVN250YkhzblZKZkYrOHBhZHlVbEN4MHFw?=
 =?utf-8?B?cHJjWjN1RHVlczJUS0FiZDlQVUxPN2YrRjZ4KzEreHgrY0ZmYWZqSG9jZmhk?=
 =?utf-8?B?N0NMdGxxZitmY3dUK3ZoSXdnYlRSTmpKMlRFQXFNYkptcThGVjg0UnBvTXNW?=
 =?utf-8?B?WUlVd0tGNTdrNG9QeXpud0tIVGNQUlJBbzV2V3BqTnNYV043ZWtxM1U3bjl5?=
 =?utf-8?B?YWFlT0xSK3psYk8wVkhQZkUzcGV0U2MxTGpzdUFSdjFWa3AzOGxUNERndExv?=
 =?utf-8?B?TzBjUXBvcjhVdThIVkxoZ2JLTTAvUk1HNVFVVFN0ZHFTQm5qaUN1b0JNa3Bt?=
 =?utf-8?B?S0tCaTJ5elYxc3dvV1RxZTltMlhjKzh0L1FrdlNOWkIwd2svajNpbmZKUFJQ?=
 =?utf-8?B?L1JXcGdjNE9JSmJXYjFvdStjNVRFMTdXb015MlR5ZFBlV0pHb2p6Vkg4YkM1?=
 =?utf-8?B?aXAzbm9sSElYblMyS3NrODdJNFFNWWhpTWEwZ0NlejIxYjN6NnZZRDI2RU94?=
 =?utf-8?B?TWJHQ0pVZWlUZHZ2OEVrS3VsMGoybTkzc1NlbTFrV0xhREI2TVRBK0R1TjNx?=
 =?utf-8?B?M3RWMExPSSsvYVBXKzdFTDd4TkNUOW5SQzBLYkNjU1lERzl3a0VXU29JV1VI?=
 =?utf-8?B?c2RPMkwwTjIxalJpN1EzZ1NMeTZDekptMDAzN2FxNHhsYTROKzRFaDcrZCtq?=
 =?utf-8?B?K3ZLdENUbUNwbzFUMGhnbW1QdVVoYTl4ckJUNm80bG1maDQyK05CejREREdX?=
 =?utf-8?B?aWJqNVNnMjJvSUZWc2FnV0tWL3REdDdQRkVYaWU1WFVQbU1reThWWXVkUmdK?=
 =?utf-8?B?Z0krY0dhV3V1SEV3K0NPYjZHRVZkeEVSTmU3bU1Ic0RhbUdudDVmNUZCSmMr?=
 =?utf-8?B?TTJucHJyam5abG5vVU1pbjN4aXc2UWxyRENNNWVVbWtHZVZmaUJGRkF4RCtj?=
 =?utf-8?B?cm1kU1c0TjIrVTlBMkR0Rnl3cHpCUnVnazNIem1IczB1OEdFKzJLMm9qcHJ5?=
 =?utf-8?B?RFd2Z3pjbklWV283MU45ZCtSdEdEVytXaUl0YUNtYmRLdCtuY01LajAzcHFB?=
 =?utf-8?B?T1pOeC91dExYbEh2L0E2VTF0dk15TU9jNkNNZ05jWEEwTG5FWGNuZVhKWXcx?=
 =?utf-8?B?bU14eFRjcmJ1aWVpKzZDRHNrYTFKSmUyWG55aXpPOHh0T2pER3VhSy9JbExL?=
 =?utf-8?B?M2NlZDNEVzBvU1p1UnN4a3U0YlBBRHIxYzFBYkxzZ1l3b1JvWXhwL3R1UnZB?=
 =?utf-8?B?WUtYUlU5ZkJPMmEzZTFhQjR6aDd1cGNNNWsvZzNLQ2h1d3ZYc05SWkZvV3NM?=
 =?utf-8?B?b0Q3b0NPRmxKUUtrTFdhVU8zUEp3RVJ5bkV5WExRUXlxeVpxWCtiZm5kaTJH?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1r75d+HZeEPGse9EgqrvgGWbmYHdhQuK++XhHVuSaPzFQtsRX4shl1NX35Nt+UxYi/NXpSFsfui0nNObHEvETOqA12YVu3COxAdfb3gWYgrypDzYayiiYiK1Uf3EHCp0mTLn6AoBQX0o4+k7tgcfdHEcfvmL/6c6zClHB5nbTmSUU9ZD52uAoiVJznYt5JL7BbwkpE1WS8o0GyxyYkD0uRdGeKHbqVk3bxowo5re3WaMN50nOlaMY6zQpK2QewXgadNBzKCW2OWeFNVeNFv7qWoTCLmUf3lvfLpYPZwMWpn1Q50s8ChFsOc3x1dHoIEgEGzUdFP/wy6nPYlXQs+P2F9JjmZJPgYjKY/XH15jYVdGjJ9dxfA8TszqBXwa2A7nq/Qy75hTuHsB1a6PyQmo5d7cOFCbmM+YrMyF8Df5vUnLn9v3PBTfq+dxPCJ7+v5BG1oHfV2d/wXdR72SO2LJk5AkYVhRVFTtPiZ0ViLBoGHOys9o7TgRNbypRsoFlCsdcq2IjOs0rGe04mA1TpGlPiqIKYv27kvPsZ9YqGiFkpovXUY/1bmjzmqIRz2cp4Yx9iMCELhkl8f0HNbNNHRJuZ35OyOZnIiFyjagvxneiwU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b135c1e6-91c1-42e1-76e1-08dd33e0e6af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:45:19.4458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU5bgNl//Sjlo/dFDy0YuFWCpk8rTAInCuNZSFokfwefO+ztUdeJw78lKL1tr4Up0+u5CpsD0PCLdOqNSjOAG/fYeR+XwuvHeESaZwZ7oOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130123
X-Proofpoint-GUID: y_upT8HGm2Z1CgkCfM33v07W4MFgYweX
X-Proofpoint-ORIG-GUID: y_upT8HGm2Z1CgkCfM33v07W4MFgYweX

On Thu, Jan 09, 2025 at 04:32:13PM +0100, Andreas Hindborg wrote:
> "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:
>
> > On Thu, Jan 09, 2025 at 10:50:13AM +0100, Andreas Hindborg wrote:
> >> "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:
> >>
> >> > On Thu, Jan 09, 2025 at 09:02:11AM +0100, Andreas Hindborg wrote:
> >> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >> >>
> >> >> > On Mon, Dec 16, 2024 at 3:51 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >> >> >>
> >> >> >>
> >> >> >> > +
> >> >> >> > +    /// Zap pages in the given page range.
> >> >> >> > +    ///
> >> >> >> > +    /// This clears page table mappings for the range at the leaf level, leaving all other page
> >> >> >> > +    /// tables intact,
> >> >> >>
> >> >> >> I don't fully understand this docstring. Is it correct that the function
> >> >> >> will unmap the address range given by `start` and `size`, _and_ free the
> >> >> >> pages used to hold the mappings at the leaf level of the page table?
> >> >> >
> >> >> > If the vma owns a refcount on those pages, then the refcounts are dropped.
> >> >>
> >> >> Maybe drop the "at the leaf level leaving all other page tables intact".
> >> >> It confuses me, since when would this not be the case?
> >> >
> >> > I don't understand your objection. The whole nature of a zap is to traverse
> >> > leaf level page table mappings, clearing the entries, leaving the other
> >> > page table entries intact.
> >>
> >> As someone not deeply familiar with this function and it's use, I became
> >> uncertain of my understanding when I read this sentence. As I asked
> >> above: When would you not clear mappings at the leaf level and leave all
> >> other mappings alone?
> >
> > Because these are page tables and page tables can span multiple PTE
> > tables. Correctly removing at the time of clearing would be expensive and
> > require very careful handling.
>
> What is the distinction between clearing a PTE and removing it?
>
> I asked above if the leaf page holding the PTEs would be dropped if all
> the PTEs it holds are cleared. Alice "If the vma owns a refcount on those pages,
> then the refcounts are dropped.". But from your message I am guessing
> maybe not?
>

No they won't be, though Qi is implementing a series which changes
this :) but for the purposes of this function, assume not.

> >
> >>
> >> Imagine you have a collection structure backed by a tree and the
> >> `remove_item` function has the sentence "remove item at the leaf level
> >> but leave all other items in the collection alone". That would be over
> >> specifying. It is enough information in the user facing documentation
> >> that the item is removed. You don't need to state that a remove
> >> operation on an item does not remove other items. Does this example
> >> transfer to this function, or am I missing something?
> >
> > No, because we're dealing with page tables and you are explicitly requesting a
> > page table operation. Knowing what is touched is meaningful.
>
> When would a page table operation to remove (clear?) the PTEs
> corresponding to an address range touch PTEs corresponding to addresses
> outside of the range?

Well we clear PTE entries (yes PTE is _terribly named_) in the specified
range, which might span entire PTE tables maybe not.

It also might span higher level tables if you are zapping huge pages, but
in that instance the PMD (or even PUD) would be the leaf table.

You don't touch PTE _entries_ corresponding to addresses outside of the
range.

>
> >
> >>
> >> > That is, precisely what is written here. In fact I think this
> >> > characterisation is derived from discussions had with us in mm, and it is
> >> > one with which I am happy.
> >> >
> >> > Why is it problematic to accurately describe what this does?
> >>
> >> Again, it might be that I don't properly understand what the function
> >> actually does, but if it is just removing the entries described by the
> >> range - write that. Don't add irrelevant details or specify what the
> >> function does not do. It slows down the user when reading documentation.
> >
> > It is highly pertinent as mentioned above.
> >
> > I mean we can expand the comment to explicitly add some detail around this
> > since obviously this is confusing (hey - a lot of mm is confusing - this is
> > an ongonig problem and why I have gone to lengths to try to improve
> > documentation and wrote a book about it :)
>
> That would be nice :)

Yes indeed!

>
> >
> >>
> >> >
> >> > For a series at v11 where there is broad agreement with maintainers within
> >> > the subsystem which it wraps, perhaps the priority should be to try to have
> >> > the series merged unless there is significant technical objection from the
> >> > rust side?
> >> >
> >> >>
> >> >> How about this:
> >> >>
> >> >> This clears the virtual memory map for the range given by `start` and
> >> >> `size`, dropping refcounts to memory held by the mappings in this range. That
> >> >> is, anonymous memory is completely freed, file-backed memory has its
> >> >> reference count on page cache folio's dropped, any dirty data will still
> >> >> be written back to disk as usual.
> >> >
> >> > Sorry I object to this, 'clears the virtual memory map' is really
> >> > vague. What is already there is better.
> >>
> >> Would you like the proposed paragraph if we replaced "virtual memory
> >> map" with "page table mappings", or do you object to the entirety of the
> >> new suggestion?
> >
> > I object to the suggestion in general. The description is fine as it is.
>
> Ok. I'm raising a flag because I had more questions after reading the
> docstring than before.

Sure and so I think this is valuable information, and indicates it's
probably worthwhile adding a little extra information on mentioning page
tables.

>
> >
> >>
> >> >
> >> >>
> >> >> >
> >> >> >> > and freeing any memory referenced by the VMA in this range. That is,
> >> >> >> > +    /// anonymous memory is completely freed, file-backed memory has its reference count on page
> >> >> >> > +    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
> >> >> >> > +    #[inline]
> >> >> >> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> >> >>
> >> >>
> >> >> Best regards,
> >> >> Andreas Hindborg
> >> >>
> >> >>
> >> >
> >> > Let's please get this series merged. I think Alice has demonstrated
> >> > remarkable patience already, and modulo significant technical pushback on
> >> > the rust side (on which I defer entirely to the expertise of rust people),
> >> > I want to see this go in.
> >>
> >> I am sensing that you don't feel my comments are relevant at the current
> >> stage of this series (v11). Alice asked for reviews of the series. These are my
> >> comments. Feel free do whatever you want with them.
> >
> > I think you're getting the wrong end of the stick - you are making comments
> > on something relevant to mm, as an mm maintainer I'm giving you my point of
> > view.
>
> I appreciate that.

Thanks

>
> >
> > Your comments elsewhere seem highly useful, and review is always
> > appreciated, if you read what I said above - I defer entirely to the rust
> > community on things of which you are expert - so there is clearly no
> > disrespect intended.
>
> I did not read any disrespect in your message. I understand if you think
> I am late at the party at v11. Normally I would not pick up review of a
> series that late.

Ah OK, good :) I just wanted to make sure things were clear, text is a poor
medium and things can get misinterpreted :) I very much appreciate your
review!

>
> >
> > I'd also ask you to respect that I have gone to great lengths to review
> > this series from mm side, motivated by a strong desire to help the rust
> > commnuity.
>
> I absolutely appreciate that!

Cool :) I am excited about rust's potential in the kernel, as I know you
are and you know I suspect _probably_ Alice is somewhat :P so I think we're
all on the same page.

>
> >
> > So where I am coming from is nothing negative, quite the opposite, I simply
> > feel _on this issue_ it is not worth holding up the series for.
> >
> > This is no way intended to do down, disrespect or seem ungrateful for your
> > review or efforts. Apologies if it seemed that way, was not the intent.
> >
> > And to reiterate what I said above - I want to see this series merge :) so
> > there is no ill will anywhere.
>
> We can always merge this as is and then discuss the finer points of
> documentation later - I am fine with that. But obviously I cannot put my
> review tag on it, when I don't understand the semantics of the functions
> from reading the documentation strings. Perhaps we have someone who is
> more well versed in mm that can.

Ack of course, I would never ask you to tag anything you're not comfortable
with.

I think probably we can agree that adding extra detail to the comment
should suffice to address your concerns right?

>
> >
> >>
> >>
> >> Best regards,
> >> Andreas Hindborg
> >>
> >
> > Perhaps the correct approach here, as alluded above, is for Alice to add an
> > extra commentary pointing out the role of page tables here?
>
> That would be nice. Perhaps a bit of module level documentation is also
> a good addition.

Ack

>
> >
> > To complicate matters further (of course) there are recent series which
> > actually _do_ unused clean up page tables, though not (I believe... I have
> > to check...) on zap. But of course we in mm JUST LOVE to complicate
> > everything... ;)
>
> We should make sure to document that :)

Yeah, I have added documentation around VMA locking and page tables which
relates to this, I can expand as needed depending on this series, when I
finally get round to properly looking at it...

See https://origin.kernel.org/doc/html/latest/mm/process_addrs.html for the
doc, which is being updated constantly also.
>
>
> Best regards,
> Andreas Hindborg
>
>

Cheers!
