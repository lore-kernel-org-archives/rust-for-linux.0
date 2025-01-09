Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31DC216E0E;
	Thu,  9 Jan 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422219; cv=fail; b=PC9nnwr3FbmL9U1VFRexHhyA64nmevZDY6P98bFC0oQpNDs4DgpVy/bA3oWsPL0lFOjeSnOIKq2iv4YI+wVCEvuAeGEF0wWPs407EpEF+0afgkIuxJpJLL8t4Pbw6k32YE2bxUDcOr/2O+hZG1pi5E6qp63+0hgMQosZWMmf+VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422219; c=relaxed/simple;
	bh=cwGr8zPp+5rTITiUDCFVtTs9C2nkei2wtd61Tu5Fr14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GLOD+CKGfN3WhnkhcJTV+0DNnmakEdoor3+Geqv3MDkkFe98dUpzIP/qCZ+I+JA85MM0P0ICrn2L5V/r4T4vIyUpqVeeL4MogBL4LBYzsMi8ws6kEqGGGVxEK5h9XBHQymkB6gHmqqGtxsgVbogcl/2FGjCCI//ZCp9GDNyWrc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fr9D99tq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XvPUZP8S; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fr9D99tq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XvPUZP8S"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094hEL5017586;
	Thu, 9 Jan 2025 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=N46w5Z+frqJ1miG46+OpYA7MLV4wwLuXAEvX2ZxVOn4=; b=
	fr9D99tqVnK0mdhklGVQK2BswL9PELkhkWTQLu+K1AhIW+lqODEDNbLJ1ty8kWqK
	wbsLH1VBOTP5YoSgeE5U7idcEwVQ1Idm5uZUSQzOkHXh94G9Tp8ta59t1SK3Q2RB
	Z/XhJUYjc0kHLUUi9100/jWAlGTS1ryvJtBWjGJMB6NtU507VFyZizQ0HbqpJyrS
	t2R/Xhiw6bybfFwyUda3PaObmcHebfdoINJUO1XvgQcJpKzhNj+v09LXSh93BHVg
	8fJeztrv0jl/D15TpxP+kBqJ9EmDosuLvdn5/O7SzXOeBAm7iuduFfXvo5dm072Q
	D9EvaffTq3YSZc5XMDssyw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4427jpggw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 11:29:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5099qrNU011203;
	Thu, 9 Jan 2025 11:29:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xueata1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 11:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wir5/0zKcoBVQnsXqN9L40/e1p4GXBp88FJB9xVZSUmAn7UbZc7j6syb/x6wKe1h2nRmTEE899haGipVrbXC3ovSG0wfXEC4oYWqx5MuYe7TcdL5K7tCqTD99rN/un8KpI3aUKrnBQbiXZ1qmsvJTRSqd/PM0accDL6sZ8/prlduqiPq4HiqvBtYZUvw89ICb72O5WV72jyc9vOYo+rPZmsYC3gUplbwoYcZhDcD88kBu7YkrQuTvKAZ4LFU9d1QdHWNwhm52drP/M9IkY0KcTU9vjMCyOP7lAOfi7Ko9wMU+yJNkLpTWWMD/nugSl0r8rLQZ+ZzzzVAE9rTu8Wv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N46w5Z+frqJ1miG46+OpYA7MLV4wwLuXAEvX2ZxVOn4=;
 b=NHobsW9MIEwNEg2DS2r3HJJ9+cMdVgqbgp9q6svo0rB7aTov2hN3iAV0epHL6I1+ifhhtRt2zCNaERylLMBZUHUSq55XuogvZ2jX2BamXBMyg6qAoO9lH5SZK6/eJz1atbuzIJhnYbgvnWd+I/CK/DUQTy0rMFLJnU+VMkC5orfi0M74NdLYHP8NHBfDKnLWVhpD8IKOLvpc7ejjDPfpwvo5dM6I9pZgliItJWg+OQkd8k6y9/sOQvsEYIOl7dwP93OarxBib42q7e2IpcheBhD31Ivex0AQGLph62UhD7dxTE5GH92GvcZqJkzWmlvKI9qKOCq6R2uQCPf53anIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N46w5Z+frqJ1miG46+OpYA7MLV4wwLuXAEvX2ZxVOn4=;
 b=XvPUZP8Sxdgg/NeqIZhwrPwYFBcW1FJV0WxVLI8CJO0cIISmhe5kxrBeAqpDs3s0pa2/n+In0oEseOZcZgqI+PuFFV99BTA1ExmIS1jW4oFBxKHTdYQbJjEsZkUiDw5fPKRWdtb5uhFTf58dDXFlLwrqGkzT/SuH0cI9JJjes9o=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by BY5PR10MB4354.namprd10.prod.outlook.com (2603:10b6:a03:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 11:29:46 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 11:29:46 +0000
Date: Thu, 9 Jan 2025 11:29:43 +0000
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
Message-ID: <8b803030-0ca3-4591-b2f3-bb9bcc2aca21@lucifer.local>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
 <20241211-vma-v11-2-466640428fc3@google.com>
 <874j33ddxt.fsf@kernel.org>
 <51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
 <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org>
 <vH_JjBon9WfW7x7OzrUfhGFluWCiBwsPZDkHbFt77nth4SFWJ-4W2vXXBYmE8WEaEJsibxx2N4iXS8Vx6RbAQA==@protonmail.internalid>
 <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
 <87msg09uzu.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msg09uzu.fsf@kernel.org>
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|BY5PR10MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdaae4a-d197-4374-34e5-08dd30a0eb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk5JMTVNZGE3dElNcWpkUGFNL2gyZFFvWENXN3E4eHEyS2N1MmxQRnBsWU4y?=
 =?utf-8?B?bFczdTcyUDhOd2lQdnl0bjlHZEx4MVcwSUdjYnRxTENOOW9OcWw5MVd3MmNs?=
 =?utf-8?B?NFlzVkpFc2FZMU1sRDh3ejZoOVA0ZW5mUHQva3FzSEdzSzFqemMwQmxlOEpG?=
 =?utf-8?B?WkFtK21oMVFkMTBMbnh3dGtPa1l4WHAyMEVPbGY4OWJqVDhTaStCTk5JdzBa?=
 =?utf-8?B?a1kwYTNzdW5USXZZQXh5TjBWd1hiU2NadEZqQUVVSGVCektOYmQ4MlBBZ2U1?=
 =?utf-8?B?Ti9ScmpTMHhXa2R1Y29rOXZIaWxocHdzNDN0UDIwTEVIcE1waHBsQTNHSEEy?=
 =?utf-8?B?cHovdWdJUFhCeE04UWFnWGlDeW1kdW1wb2tiOGhndjhnOUNNM2Z3L1ZBTkxS?=
 =?utf-8?B?RENOVXNCTXFta3Uyc2I1ejhFZzA4NHN0a1RtWmVRTnZQTjdxRWJRaXhKdkho?=
 =?utf-8?B?d2ZMTWRkZDlWVmp1WmtxN3R2STlWNDZjcVZCMTdreldHeEMzQ1QxV20rTmlx?=
 =?utf-8?B?UE9sUXhUN1FWcEppNHlJSW1TcUJYUGkvNDFPRWZxMVRoaUQ3TkR5cU10SDBi?=
 =?utf-8?B?MjdIUDNuK1F4UEhzSHBYdy9LYnF4cDZ1M21mQjRBYjBSZytiZkZaeURNMTF1?=
 =?utf-8?B?YWpJRnlTZ05hRC9yenpqcnlSTkJtdkFyUkF5eFdxUVBxUDFabVdwc0w3b24v?=
 =?utf-8?B?V1dwZUVuU0RsdExxTUdWd28xOS9wTCttLytTSmE0ZlBEYVZoekV4am9WaXMv?=
 =?utf-8?B?NG85anE4RUVCQ20xeFFlM2dHOFZPZXBtUVNLYWhWN1VvcGVnc3I5OWRQQS85?=
 =?utf-8?B?L3ZGY0FuYncvVURKWitBYmlSREVFUmxPV0VNZ2ttcFZnWjdtK2lyY0ZPTXJk?=
 =?utf-8?B?alR0YnpBbFhtTG1OcFBQc1JSaVhLWWVaQ1lSQXNRcEFyK0RrOGNnaEh6Z3p6?=
 =?utf-8?B?MXBGK0QyR1daNXh3S0IrK09SRFlhNEtiU1BMSzIvS3FxdDRocnh1WjhUVlVT?=
 =?utf-8?B?WU9Fb2tZWVoxN0FHaHZNbXM1Yi9tS25WRE1tZ09yNlFHRXRqaFZyOTF2NTFJ?=
 =?utf-8?B?endYSEdOK3VCU0xmRStDUFl0SU5nVHdOc1NRSW9mdFE0c3hhRm4xQk9WdHNB?=
 =?utf-8?B?QitiSEtOYXI3REpmYkJMUUtNQmMvakludFRhb2Q2dkxPcGFJYytRSHNpRjRk?=
 =?utf-8?B?L2dBVWlEVlE4Y1E5d3c2TUc3VmE2dGJnemZJbUZVc2dXTm90RjArUkVqUG4y?=
 =?utf-8?B?c2RpcVYxQnZoNDVEdC9adHB5OHBIYUcwUS9oT0R1YmN6emdSVHVJV3E1MmVq?=
 =?utf-8?B?alNEM2lrN3k4MXBBYis3QlM1bDA5SVA3N3BhZjhvK1liRHkvNUdMZUJHcVhQ?=
 =?utf-8?B?ekJOcG5ZelZ0YmRpNGpxbnY5SFJYeGJVd1U0MVR4ZzExYWJhUDlkUURJLzdo?=
 =?utf-8?B?eUhyOW5kYnVkY05JeDhyN3R6M0Zkams3QURBbG1xVTgyNHFLL2xIczcxUFla?=
 =?utf-8?B?ZVY3QjkxYTU4TVBYdTFJa0xNQ2xydGgyVlJKbjdXTXJsY2MrT3MrNnhwRkRr?=
 =?utf-8?B?R3J5VGRqK284Mit3WktnVmFZODJqNEI0V2NHMjA0cEh1M1dpZEE2dEFvM21K?=
 =?utf-8?B?dUtkb0tRbVRRa1VLWjZmbTIxeEx6WjBYNy91VEhPMHBrVzBDWlJvYVJDS0FG?=
 =?utf-8?B?TzJWdC9Jcm0rRU4yMldTeTMyOTJ4TytHc3dXdTM0UERBenhVWjk3YUtUL01a?=
 =?utf-8?B?OWc0Y3Z2dDdpRnprdjlnMXphRWdoaFBEL2F6Y1ZPWE5LZkF0VjZibUZyLy8w?=
 =?utf-8?B?OHZJdEtNeGhyaHo2ZldFcEFWb0FDb1p6ZjR4TFdYR2JHUFU5T3diRjFRZ2I3?=
 =?utf-8?Q?MJDMJxBfM5J03?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alhwYzdOQlM4UEdSWmU3UkdFdEYvQmpYUXVDaFJTTGxKdzY5clI1NXVwRExw?=
 =?utf-8?B?UWQrTG9SZmlPZ3J2YjZiOElScVRBYnVYbkprc2lUMnNWLytJaGh6TGJ6NE0y?=
 =?utf-8?B?ZjdzZlFaT21kMHRLRndWNm10SDhSREsvdWhEUVlRblNiQWFjblVBby85U1dn?=
 =?utf-8?B?UlJXOEF0aEN0VE50SEk3MmNhWWdQSmNTQzhJZWhrSnRpQWxtOWtxRCtXbXBx?=
 =?utf-8?B?b1Foc0gwL3NwNjBwQW5TOGkrMVI0cmtxOEFaYWd2cFk3c0tzNzFTKzFGS3dk?=
 =?utf-8?B?ekQwdHMyQ3pPOE1MUTE5WEFVSTFEVDd4YUJJNUhxYWkyZXhhZzFETjdZSDdu?=
 =?utf-8?B?YzNub0tTOU9oblNZY29RTFJTZ01zYVYyZkZDQm11ZVBORDJIU1hFbU9ueHFs?=
 =?utf-8?B?YW9RUEVtQWMxQ0svdFJ3alRoQjNlU0RieGU1TG96TEJEeFBjQStjUTNDUW1T?=
 =?utf-8?B?ZCs2U3RlSit0SlMxQkg1TWtBWkFHY1BXME1KTnhvOUxOOEYyRVFWZm9lOTRV?=
 =?utf-8?B?N0d1UlU1OVZRbnpmYzd6RGc4WCs2eFQyaXFnUTlBT0JQTkIvanp2M0g0dFE4?=
 =?utf-8?B?VXFlcUtwTjFwMmZUMGlpMnRLUTJGZGVnR2ljNWI2aUcwdHRuc2FMbDk3OFBt?=
 =?utf-8?B?UFlSWUk3Z3hNelBDSkU5YWZoeVBEVmJmakJnR01KcnlkWG1jRm9CQkZTZzVH?=
 =?utf-8?B?SG83M3drVFhjMmtqdjRYKzJaOTF3U2NRQWtieHZXRzNSdTdzSEpGL0pCY1Jz?=
 =?utf-8?B?OS9UV3lRdnN4QWE3QjhKNTkreFo1TDNVNEFodU9tWEhxTmVmajE1dlhDZzhB?=
 =?utf-8?B?OTB2YUxlZTBUdnZaQ1orL0hCRXRhaVNBOUR4MU93NE5mMUlSbitnV1p1MExl?=
 =?utf-8?B?OE9zeUJ4aHF3REZPeHVxQkJnakpEcXVLYVNOQ1plb2ZDL1hBbm9yNUhyejQz?=
 =?utf-8?B?bjhRT0E0S1p5b01ZdE5LRFFtVUl5bjVkQmo5cjhmTmpBQm1laHZsaDhSLzlU?=
 =?utf-8?B?SndDd1paOWZOWitBTzF0dWJiMWU4WWZWWVRLMGpEY05QYysrMU01ZURPYmhG?=
 =?utf-8?B?ZnFmRjZlU29qK2o1R0J3ODVjOXNUWlU1UDZyQkVxVkFWa05NcGpRZ2Q5OVor?=
 =?utf-8?B?djRZYjhqRmFnaFF4MDBOSzl3dTVCalNaL1VITmFUcGhWTEl3aTROT3JpNk1a?=
 =?utf-8?B?a2M5OEVSQnV4SjVpdDdaZjhDSlo0dGduOFhZTnluRXZuTnd3OFVVdC9PcklE?=
 =?utf-8?B?Z2wydSt5eVMvOTUzQUNha2x4eUJBT25iUVU3d0k1cW1kQXVla3BLWVlTdlRV?=
 =?utf-8?B?a0ZsNVMwTWNjYm9aazdTSkh1UHJKSzdTME95SEtJSHR1WmFPRzNEVzJKajc1?=
 =?utf-8?B?UFNEZVlBME42OUV0L0puMGhzenprQmJiR2dwRUsyMnI3cjIyS3JwWjZNTDBq?=
 =?utf-8?B?NEpydUw5RU44SzBqQVNnT3ljbjJ2SGk4TEFURys2aVlyRkJka2E5NUhwNHI0?=
 =?utf-8?B?VjZPUnRVdFB6NkFzNVdoa3dCMWxPSmJvaUs4THlrT0szYUdzZTMyMlNPWVdn?=
 =?utf-8?B?dFVhZ1RTTno1YU1yZUg4Vm1jcmVFc0kweTVJV05aanpOVThLbFg0ZWlkbEp3?=
 =?utf-8?B?K2tWakxlbUdLUWtwaENXZ3hjajdKUERMQWVJNFEzUVF2NlBjelFwSW1QQ2Fx?=
 =?utf-8?B?WkRVaGNFQkZyU1pTZnA5c3U1dTBhV0xaK3BhMDNhdStCaHZOUGo2c0J2ZXpk?=
 =?utf-8?B?UmMza0lNOXNITURtMWh1Wll4UzBoWVp1MHJaR2k4MEVhQUYyakZVdlJWVTJp?=
 =?utf-8?B?VE1BZXJJblVMOEFFTTRiZVVTKzJsYVh1NGU3TFpmRXNtZ3lVM1l3NzVwWXlU?=
 =?utf-8?B?STRqN2I1NG44MllYczIvM3M5SmdiTVo1NjVaTjRnR3Z2OHY5WllSRTkwM1BD?=
 =?utf-8?B?NUlQUmRYVTJVbTZva2htdnhFWUtGaENwV0V0NlNmVmV6REFKVFF3WFJ2dVJB?=
 =?utf-8?B?Q2xUYkF3TXRHZ1hGamhrZXovWEFsZmMzWUxJUVpDR0FyMmd4bkNpaDRZRlFx?=
 =?utf-8?B?Vm5mTEdtQ3ZaK1grM2h6Z28xR0U5cHh1OWRPV3ZQR3VzbnBTQzNsZXZwZnpX?=
 =?utf-8?B?ODdRazRZT2d5cjFwdEdTeUdOeEQ3NG1kd3lyeGhrNzRpZm5ybDNGM1NIK01l?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xBS9Zc2dbukqEdhuBrPpGSqhI552tI1Cu3LqUGT/qlB27J/mJMlYQrQEEAkktHPvgoZyltb+3z3zyQcEeNyVyeaGaTWJwvmgm4miLl3z8um6n/UnIPe8yNi+SpsjuAPifCUZZhbAwEk0npPDa4/bRwaJlMdcrX+9x+XgI27CEf/iLXHii+USV2Cm7XSG62ZoduxyeQhQPMVWvvybInrzwyIjhdOIH3hOaAgpkGpqCarLqzq7C/D7wC5BN/o6l411aXJp4Cxoji46NvemNyrYQohznnlSIzlp9xxn0srTV5J9Zqc2exdpikKtAaTYZa7LTzYl6z8FsUiBOmVZ/r3ZE11Uydl9XK6xdlqlnHDUihWrcyfAjX6nqPiR+ruvY1O76aQ0traYQyOdfppu8drkjD6HSns+JATyci0NUq+tIzzm2PG8YBuNj/1KyQcOOJyTHGDh4HNpz0DxV+4Q9o/H2tA/OaCYs8FI97Jsq5dIyh0uaAWHdEgdjvx1nKT0wMsKKNDAbekFFLE2FaD0NeKxpGk//NCrroxIADJg/RaJU/XKfO41RF+SevFEgGJor8vmUSyt/MWFz2DrzNnDrkM4/2zKza8xCm7ytWem2sgciPU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdaae4a-d197-4374-34e5-08dd30a0eb7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 11:29:46.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxghzuECCBgTPfmKlfR3PvSfoJfS9kkKYProT2twxKtxP/6QjvDYc0klS6fFvTfJuyGHudnpWaXfZadkecbGrRl0QWQg2OFgilyl6qUJazM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_04,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090091
X-Proofpoint-ORIG-GUID: PzgzkueYT6iFMYFdLG9eU0fsni-7a5Td
X-Proofpoint-GUID: PzgzkueYT6iFMYFdLG9eU0fsni-7a5Td

On Thu, Jan 09, 2025 at 10:50:13AM +0100, Andreas Hindborg wrote:
> "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com> writes:
>
> > On Thu, Jan 09, 2025 at 09:02:11AM +0100, Andreas Hindborg wrote:
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >>
> >> > On Mon, Dec 16, 2024 at 3:51 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >> >>
> >> >>
> >> >> > +
> >> >> > +    /// Zap pages in the given page range.
> >> >> > +    ///
> >> >> > +    /// This clears page table mappings for the range at the leaf level, leaving all other page
> >> >> > +    /// tables intact,
> >> >>
> >> >> I don't fully understand this docstring. Is it correct that the function
> >> >> will unmap the address range given by `start` and `size`, _and_ free the
> >> >> pages used to hold the mappings at the leaf level of the page table?
> >> >
> >> > If the vma owns a refcount on those pages, then the refcounts are dropped.
> >>
> >> Maybe drop the "at the leaf level leaving all other page tables intact".
> >> It confuses me, since when would this not be the case?
> >
> > I don't understand your objection. The whole nature of a zap is to traverse
> > leaf level page table mappings, clearing the entries, leaving the other
> > page table entries intact.
>
> As someone not deeply familiar with this function and it's use, I became
> uncertain of my understanding when I read this sentence. As I asked
> above: When would you not clear mappings at the leaf level and leave all
> other mappings alone?

Because these are page tables and page tables can span multiple PTE
tables. Correctly removing at the time of clearing would be expensive and
require very careful handling.

>
> Imagine you have a collection structure backed by a tree and the
> `remove_item` function has the sentence "remove item at the leaf level
> but leave all other items in the collection alone". That would be over
> specifying. It is enough information in the user facing documentation
> that the item is removed. You don't need to state that a remove
> operation on an item does not remove other items. Does this example
> transfer to this function, or am I missing something?

No, because we're dealing with page tables and you are explicitly requesting a
page table operation. Knowing what is touched is meaningful.

>
> > That is, precisely what is written here. In fact I think this
> > characterisation is derived from discussions had with us in mm, and it is
> > one with which I am happy.
> >
> > Why is it problematic to accurately describe what this does?
>
> Again, it might be that I don't properly understand what the function
> actually does, but if it is just removing the entries described by the
> range - write that. Don't add irrelevant details or specify what the
> function does not do. It slows down the user when reading documentation.

It is highly pertinent as mentioned above.

I mean we can expand the comment to explicitly add some detail around this
since obviously this is confusing (hey - a lot of mm is confusing - this is
an ongonig problem and why I have gone to lengths to try to improve
documentation and wrote a book about it :)

>
> >
> > For a series at v11 where there is broad agreement with maintainers within
> > the subsystem which it wraps, perhaps the priority should be to try to have
> > the series merged unless there is significant technical objection from the
> > rust side?
> >
> >>
> >> How about this:
> >>
> >> This clears the virtual memory map for the range given by `start` and
> >> `size`, dropping refcounts to memory held by the mappings in this range. That
> >> is, anonymous memory is completely freed, file-backed memory has its
> >> reference count on page cache folio's dropped, any dirty data will still
> >> be written back to disk as usual.
> >
> > Sorry I object to this, 'clears the virtual memory map' is really
> > vague. What is already there is better.
>
> Would you like the proposed paragraph if we replaced "virtual memory
> map" with "page table mappings", or do you object to the entirety of the
> new suggestion?

I object to the suggestion in general. The description is fine as it is.

>
> >
> >>
> >> >
> >> >> > and freeing any memory referenced by the VMA in this range. That is,
> >> >> > +    /// anonymous memory is completely freed, file-backed memory has its reference count on page
> >> >> > +    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
> >> >> > +    #[inline]
> >> >> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> >>
> >>
> >> Best regards,
> >> Andreas Hindborg
> >>
> >>
> >
> > Let's please get this series merged. I think Alice has demonstrated
> > remarkable patience already, and modulo significant technical pushback on
> > the rust side (on which I defer entirely to the expertise of rust people),
> > I want to see this go in.
>
> I am sensing that you don't feel my comments are relevant at the current
> stage of this series (v11). Alice asked for reviews of the series. These are my
> comments. Feel free do whatever you want with them.

I think you're getting the wrong end of the stick - you are making comments
on something relevant to mm, as an mm maintainer I'm giving you my point of
view.

Your comments elsewhere seem highly useful, and review is always
appreciated, if you read what I said above - I defer entirely to the rust
community on things of which you are expert - so there is clearly no
disrespect intended.

I'd also ask you to respect that I have gone to great lengths to review
this series from mm side, motivated by a strong desire to help the rust
commnuity.

So where I am coming from is nothing negative, quite the opposite, I simply
feel _on this issue_ it is not worth holding up the series for.

This is no way intended to do down, disrespect or seem ungrateful for your
review or efforts. Apologies if it seemed that way, was not the intent.

And to reiterate what I said above - I want to see this series merge :) so
there is no ill will anywhere.

>
>
> Best regards,
> Andreas Hindborg
>

Perhaps the correct approach here, as alluded above, is for Alice to add an
extra commentary pointing out the role of page tables here?

To complicate matters further (of course) there are recent series which
actually _do_ unused clean up page tables, though not (I believe... I have
to check...) on zap. But of course we in mm JUST LOVE to complicate
everything... ;)

Cheers, Lorenzo
