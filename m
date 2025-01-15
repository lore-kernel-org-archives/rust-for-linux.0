Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4421EEA56;
	Wed, 15 Jan 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943238; cv=fail; b=BaeLjO5QOH7RztNHJkfNBJuuLU+jxQellK1mWF4SR7KFqdoI6dZm1bxk6NKb96Up6LtsRNyZUwbNIKdBSqnw88W4el8uHMN7vAFZ5wUZft+qKYawq6lhwGKzTMuBYezrKF97UKGstBUM6n8SPZjOefg4Bo/PWvqBcT8SCavGtWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943238; c=relaxed/simple;
	bh=5Dx0M0cyjBekiAeSSrwLdHYr8Y/xJt0genGcd4Gy+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L9oJ9S2SioLPf17rWJBVOXM0uFcitroku1kU4dRTfrcdSrHuIvgNKZYBzgIMM24aTNPgeGmecHKEn5ouVByplgYLyRx3e5Tx6IT1N2vyVS6mLjoNUzqP3RrGJqkkdV4ME0zUujT5GLXEJGiUTxfxiTdj/UUdvPfR9pUWFRI/Szo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Na3eq59N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C9aned91; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Na3eq59N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C9aned91"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F8tw9e014553;
	Wed, 15 Jan 2025 12:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5Dx0M0cyjBekiAeSSrwLdHYr8Y/xJt0genGcd4Gy+n8=; b=
	Na3eq59Ni47Z9ZB067fNApsyzpdW1NH5jNt0RRKQrihZUfgTysWvZFs5mkXR/jSI
	sKvhMnqTf28rQ4O87QdiGgDEzHuwemQ2nFTOwHzhjADvasqyBrxwIGzYXjSN6+aQ
	ocYKFW5JMszSRE0irnkrMEbAb+h7vYWnfoKw1sNKcRJvGWUYQTTIyEAyNJjSLqx8
	tgxQZGNGRMGWGJhs/Zg9nHyzkbuuqRjiOULi3IPeADfnIOIw0uYgRkfZAif+I/SB
	DagwFB/UFoBw76I96raysaM3+CqVynJAjaZCTdTI53NLStoi9hqZWBAXRgmK71hx
	NDFsRKGzvubBRk80oNavbw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446912rjmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 12:13:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50FBqCCt037226;
	Wed, 15 Jan 2025 12:13:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f39x2yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 12:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxLSkpkXe3mRj0o61g1GqeZOWjy06E6lvgL/DPINA3oXbGMldPLjA8wW4SBJRLFPeg/rQJlLjyXigEF9JU8WvuVcQOq+0ltEvY5YuXVAZu5hmFDH7dlP1rq0b8Rj8MGXJoBqEXWqfI/SG7797WnE2Brr+8YrOfUz+wvMW723rBrirnQKTI+eBKOl6QhkWmqiTRtZ1wy5s4zzjiM7jr1mlMZIMcD4J7+V+lIkVei21Q8zO62qbE0er1+cMnZIJeVs9cV5Na752Ps0Vkn9X+5eGuASZUvnBUwv7AezTSTUbRK7bh2ns4FUYSulvJ2kIKKAQiBSIB7Wh/WjECLIcR+07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dx0M0cyjBekiAeSSrwLdHYr8Y/xJt0genGcd4Gy+n8=;
 b=VIcmwdxSQ3IrhU4fQ9wvdPiXczzEkOQe2BhRpHdSeSSCxUcfbMNux3/yEb5hDaAxES2V5uwbxoymiiBWdiRhEWuyoNm6Fm3eIFQ8AJ5mvJtl87TuhfY8slwp216fFHzZG9T6k07zr9EHZlxBdvc1SfhVuqB7YM+eQVJj51Npt7GxwuLwlyAJAooLflTXzU0Zd9wZtB2Ot/ArlaL7HzGSGZmZNGZj9KqJBwEilqjkWz6OUG3zp76yi8BtowZaPh+dOqRFqhTgcZg2bJPu6Y9gMEp71+9iyHnCDVdKmTo910MInTiXJCWei3ejzgfDOcnkKz5XDY82QK57YfSudpg+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dx0M0cyjBekiAeSSrwLdHYr8Y/xJt0genGcd4Gy+n8=;
 b=C9aned917eblIxiWrj36EGN/EHIEPoFVH0y+lZG76MDvtOGDM4PIsABcCAJE/j5YELZZu3hnPe19K0Xg6e1jjilT+CboiPbDQS9odYLF/u3gYNh9mC3yP5mVov6KbV9tff5RXp5OSMkyH9LF87Q/AsuaDS58yu77ZzAdkTz9gwk=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by DS0PR10MB6245.namprd10.prod.outlook.com (2603:10b6:8:d3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 12:13:14 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 12:13:14 +0000
Date: Wed, 15 Jan 2025 12:13:12 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
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
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
Message-ID: <dd64c7c7-b5bc-4c0d-8f34-a70862f15e9a@lucifer.local>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
 <20241211-vma-v11-1-466640428fc3@google.com>
 <878qsfdftg.fsf@kernel.org>
 <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
 <082c3703-c540-49ee-a5b3-554fdec50825@lucifer.local>
 <275ab6d2-3db3-4d2c-80b0-1ece4fd6fba1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <275ab6d2-3db3-4d2c-80b0-1ece4fd6fba1@nvidia.com>
X-ClientProxiedBy: LO4P123CA0233.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::22) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|DS0PR10MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: fc59c67e-20c9-4239-e38f-08dd355dfc79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJwL3A2ZU5xRmNPanlSQWJTaTU4ZUZ4Y1hwbW5DVnY2R1pWVldsL1ZpeWpu?=
 =?utf-8?B?WkdzdnZsQnZCME5WbkZ0eFpVUUZDWW91LzIzM0hoWTkxMk9ZMHdZdCtqbHR2?=
 =?utf-8?B?bVVJWmEvUXRNUjhDaDNjQnRrWVJhV0o2ODZuYS9tZHA2Yjc0ZElEL3lyQzZi?=
 =?utf-8?B?TGZ0VlJBL2t1K2NPdDFxbjF3SUhqUEJ1c0JsM0hzVVdnSDJGN1ZkQUtTRFN3?=
 =?utf-8?B?RlVRKzBSYlF0eUJHN3prOHJ3UXFVME0zYkYzVU9Vck9Wd25CVDkvZWhPcjgy?=
 =?utf-8?B?RVdKV3BNVWVyeDEybVk2WlpOb3NIQ01IM3RtYU16NC9rUk5wL0QrZ25wZEwr?=
 =?utf-8?B?NGdsWFlxbzdseEVtN0gwSVNJN05nbW5BZzlKdVM1Y0ZVV0FHNDZCVllVR3ZU?=
 =?utf-8?B?ekVORVU1M3hsd1loK3Nmbm40TFM2Z0d6dytidm9tRGMxOHNzdXlHMmhoMmpB?=
 =?utf-8?B?OGcvTFoyRzhOVDhJQTR3ZkZVN3F5NlJrN3kwWno0V21kUXFRTXhEQ3hLZ1FL?=
 =?utf-8?B?dk91Vzk5VXErbVlkOUZWcml4MjZrRHRKSHBiek5WUmh2Yk9kek44SWFhZGgz?=
 =?utf-8?B?aERveDdRbTRZczIyaWpxaFdJMWZnYm91TGJqWU9LZFhUL1dIMXRnMElhNm00?=
 =?utf-8?B?bFJYWGkxbTBXMkNNU0hjLzNZVW1xeU9tOUdlMThQYURWY1VLVk5JTkozc00r?=
 =?utf-8?B?ZEhKTitGcTc5UWlFcTdVUVdiR0NHNTd4RXJnNTVNYWVEUlNXVjFMSzZ3Nlpi?=
 =?utf-8?B?YVBKK05Mc1d4VzB5UEFDWHp0SHI2VkwydDRkdXk5UTNsak83ZSttTTJtNHJl?=
 =?utf-8?B?K3ExaHoyalREWUs4ZVZQaVYyTUlZclRNQmttYmpEd0trME1pN2VJcEttQTJD?=
 =?utf-8?B?RnNtZFUzcTVxTThWUUcwclI4VWJnNW5qNHIvL2U4OFBHd0k5ZnRTSlFmMEt1?=
 =?utf-8?B?K0JJYmxSZHZFWm1WUytHeURzL0dyNXRoVWRWdjFXYmJ0WVdKbjlpOGZad0dN?=
 =?utf-8?B?YTR4dTNLV3N4RmJ4R0EvZUNwTER6VmJlN1k5bmJwMXhFWlVoMEk3R3hBUTFo?=
 =?utf-8?B?L0VTK3BJNU5OQVF0cHYvWk9wWTUzN0ZQMmdwTktsWTR4SkVCSFVHd2RxTnM1?=
 =?utf-8?B?VG0rVmdTanByQ2Q2M3Ezd0dySFN1bEpjNFN6OXJsYVlZR2VqYW9iNzJoSnlo?=
 =?utf-8?B?cTdRMFpkYUJWVnN6eXdCODg1WXZqWVpvWk9LQTF6TFJYalY3MjdEaDNFbjBT?=
 =?utf-8?B?czhlYjZqUjJ6clhDcVI2RGlKVTZ6SkU2aWhBSEVrY2wzeVRFeTVyZEIvaTFF?=
 =?utf-8?B?aTJSYlNVbCthbUJLaGtMN2RLaW1ndXM1YjhZYUczTmhOOHJ2NTNKSm1GK3BW?=
 =?utf-8?B?T1IzRFcvOTd0eWtWV0NDRUJFdHZtTkQvczJwNHRBTWtSMmppeDNoRXlPUU4w?=
 =?utf-8?B?b013MGFVVFBRNjN1WTRrQmZhVCt4alFVR28yaUpXekd0dTRSallMK3VyNU5o?=
 =?utf-8?B?eHBUamsrR3dVelNXcENUR2hCK0hBS2MzQyttbm9JUDJaeDdVNE10L0UxOWYv?=
 =?utf-8?B?VENRNGdUc0F0SXVaVkxreGNxQ1MzUWREeUdvZ0dZVU1EbTUrR0c4OU5uQjFJ?=
 =?utf-8?B?Um1nQk04WmhHMTErbGtBNE8wVU5UVVNtWkh6ek9Qc3BHTkNGOEZUVktzdDg2?=
 =?utf-8?B?c3Q2T3FoWkYwNG1wYzRTVjl3RlczVlJ1SEhydEdQeHVyQURtVnFLb01FT0N1?=
 =?utf-8?B?SDAzcmk0QTFVOHl2WENOYVJRaGYvclNhMFNjVWZXb1hCbGhPVUc5ZjdqQkJ0?=
 =?utf-8?B?VmhhMXMvcVh4ZHB3aTQrYTBqUXc2NHN1YlVWRXVvcENicHY4WDZGZ256N09Z?=
 =?utf-8?Q?/XCABtqEWvnYz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TElCMG4wc0ZDTVJGY090L1ZwdFo3SHQweVdBUjgvNU12VG9zYmtieWxlZXhF?=
 =?utf-8?B?eVhiakRIc28vdmNnazhrYUo3MS9UeUtSK0hHam9ZUVBkSHp5SFh1YVp5azBW?=
 =?utf-8?B?c1lZUm1KRkt6eDVKbXM3Z1ROV3dZWHlzcklUOUM4bTFaYnpnL0UxOFpzZWRD?=
 =?utf-8?B?clQ1MTZoOHpIUDN5MjJtUjg3NVBhQUtZSThHRXNDWU9KUlZsSTBLYmtkaVJN?=
 =?utf-8?B?MmtBRVhGVjZlRmdCUGRMOFhlUlNiaDMvZmRJRy9yNHZQN2VSZlJDSEJnWnRp?=
 =?utf-8?B?VmhmYVhITm9YUkhndlJubEw3SW03Nkd0NTc0cktQNUtaSnMraGwvU3QvcVRX?=
 =?utf-8?B?VHc0MjlHcDNSY3JyanVvVEF5ejlwRjRGczJVczNpb2NXN0FMZTRGa2RpaTRU?=
 =?utf-8?B?NjZnYzlXNE16b0MrR2dvQ2J2N0orbEJhUzBDaSt2Si9GWkFwVDZDZzI5b29S?=
 =?utf-8?B?U1J5dTZtbUxzMHY0Z1BtbWZpUy91N1lLa3k5M0VHVTBBaHAyQjdxbFJRaDBH?=
 =?utf-8?B?eUs3WGM4Uk5FU25kMi9pMkl0MjVSc2wxNzNvVWhaZkpCaE1pZ2p0bjdVQ0VD?=
 =?utf-8?B?NFFkTnNUMW1CL0RLUU5oejNtN3RpZUVhUFRZZjFiQUNzbTIwNHdTeGEzNnhR?=
 =?utf-8?B?NkVHRGZxZUxjMTY5NTFMK3lMWklzc2lWMVU1T3NlbFJKQ1NEMXNuTUdkSnBp?=
 =?utf-8?B?WU0wVWlEcUkrdGdmY0NMRDQ1cXFTT3FianZlcmNaRXZBdUdUMFNsZzgyWFNs?=
 =?utf-8?B?OFJpV0ZlN2svQ0d0cXU0bHdsZVBEekZMdmtkTVZxV20zL2FYTXJCMndZenFm?=
 =?utf-8?B?NC8xWnlFbHJGWG1ZQnNXKy9aYnlBSWRnSGFnazB2TE43bU5EMWxBLzdnY2ZK?=
 =?utf-8?B?cDliUml0NGhMVVMvZU5INzhyUWpkTm94cnRxTFl3K3I1aWpEaWdBWkxVVyt5?=
 =?utf-8?B?eldrMmo5eC94b09CYWg5cXFtVjM2Z0tqY3NzZmpwQWVicVlKM29ka3h4clhx?=
 =?utf-8?B?QktCd1lCbjFVL1JXNTRhanVkT3RpMVQvWmZoOHcvWVBXeFVVYUo5c1ZkOGdm?=
 =?utf-8?B?T3Rtdm9JaStaK3l6THRxOEV3WE5obzZSdi9nM1hweUdoQXJWcUVxOUhXSU9V?=
 =?utf-8?B?aEVhZHF5cDU3ajZ5cWh2ZTFEZ0dIUzQ0WG93cnBETDVjRU9OZXJsQ3VxK0pt?=
 =?utf-8?B?b3E4bHZ6cFl2ajIzZFk1NTU2T2FaeVFIWXQ3cWNyR1hxbm1FYkxGd3FCM0tm?=
 =?utf-8?B?SjVMREZud0lvN05KQklOcGdYQkxUdnJTTXFCUGdiSGh3K3JXdVlLbnRjRmJ0?=
 =?utf-8?B?R0pjdnlSVkJ5aWNjZGxMR0hqOG5HTjRUS1NMelU2NXVwS1ByVkhKcHhvOEI4?=
 =?utf-8?B?ZkJqMm91QmVPRWdHWXQvODZSc2ZOdllydmZEYmd2Ly9INm1vMlJTMkU4bC90?=
 =?utf-8?B?a3QvdzhvQS9zYVJXNGJWbE5zWUhMTkhMNGt2Ym9icjM1N2VtS2lDZGtwcDhi?=
 =?utf-8?B?Vnd6K1BFb2s3NEpndmU3VTBOOUVvam16R1E2Y2luN0lFVUJKcDFyakdaTXNJ?=
 =?utf-8?B?aURHTWVQYmhSclpKWkFQb3VrZXpldDBFeHVGOWZwRU9obkpxNGxoMzlwcGVj?=
 =?utf-8?B?U1NOODBocDY4NS9UanNZbDZHOS85YzM5ZnE1WVRTSU5PSndwWnd0SEtKb0JF?=
 =?utf-8?B?K2Q0RW5OQ1VhWFFkaC82WmdHZk43M1ViYlkybFpiYWhZSUpEMHBBT3NOeTd6?=
 =?utf-8?B?SGU2YXduOERBMUxzQWdDK1lnbGFzSldGQ2ZRZURWQ09RMitMdU5CbVBVMjJ0?=
 =?utf-8?B?SUJpMHhCZE5WSFVsY0VwUFB5WFg3djF1MTBIbHhacHZYLzU5MzF3ZzBLcWZB?=
 =?utf-8?B?VnR5d08vQWxGaWoxV1BPMTA0VFc1NTQrM1VEQVZXZkk3SkdPK3FHR1RYTW9n?=
 =?utf-8?B?b3FCL3NhMWdWaGtyYnFwMFpFcmxZamMxYkJ6Y2pJUWE4MmY2UEdYN2RhbkhD?=
 =?utf-8?B?RWhzdksyOW5UMFphSDhwM09pWWhwOVV1OVRhYmdOWk5yY1kxRm5seis0UkJO?=
 =?utf-8?B?NUNJNUUvK0tTelFQNW04a2V1TVpqSGJmbTlaUFoySWZEbVR3ZDc2QUxkQ0li?=
 =?utf-8?B?UzliQ1gvTHhZSmt6NEVBeWdoTnpya1pLQnJCYTMwTmtIdTY2c2VMS0dGNlRM?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D5ZLgRT+OsblQAZni4Bqqte1H56NpD6GN0+Gkp7qj3uNIcgQSAzkuQZ4pqk61LPrqYweocOIVMMlu3SdYk5n5HnmdMHGOtYlN/sjUBCltBKW9ThGyHqt0pwP6hUeyOdTnNvOwA1Q2Bmai1z3JqQ42Vr1w6pMAhYagEhs4wRzz/VBO9sfymBTHqUessSkdT368D2tkrQr77jN+Yl/P9B9G1geU0DH9JxUw9y0s+2e0DzE2RW198oxRex6LMzLkw93TvPsZPTm/Sp50G20BUv/yUv1uxXayR0OgYfh9xPx9Qas0sDaDVxH4F9g4HSj6apsJLG198OcUfR49Se8ZQaSEfnw5A7M9TvWY0OxCww08Nt97PrPguuLIvcBofx6sjaItLxC5EMGb5UPXact3msyMX4CZf1A3Jnp98zYKUKK1jy/fm8H9PacPauEN/1GP62t/p8vjraenFb7lJf2pDhuuH/VYKAFntrGvEoJ3snO0mnSncuBymFb7O0aKJ2R9UbAptqndNCfLOMnfoPo2Li/g2jcO4bE5svrYf2jpEyKrGD9vg8eoKmND/qlyrdbIHxfVzizr0+7UEbpCvcpI4WYR8UDXKpKWkRUc4Z8wpGFE94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc59c67e-20c9-4239-e38f-08dd355dfc79
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:13:14.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28+1DGcuVY+gW3DQQ1Ukq//aOrIKrzbym0XBitKua1bTHQ4rV7A8HUw4Q8oBjPR7JizWH8bMHtmcDhL41gJkgxR6Mb9CkVzQN7bzXX68er0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501150093
X-Proofpoint-ORIG-GUID: OAnhmwsea_fEiYz2iO2Ik2RTCK990hLe
X-Proofpoint-GUID: OAnhmwsea_fEiYz2iO2Ik2RTCK990hLe

On Tue, Jan 14, 2025 at 05:54:15PM -0800, John Hubbard wrote:
> On 1/14/25 7:48 AM, Lorenzo Stoakes wrote:
> > On Mon, Jan 13, 2025 at 10:53:33AM +0100, Alice Ryhl wrote:
> > > On Mon, Dec 16, 2024 at 3:50 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> > > > "Alice Ryhl" <aliceryhl@google.com> writes:
> ...
> > > > > +/// [`mmget_not_zero`]: Mm::mmget_not_zero
> > > > > +#[repr(transparent)]
> > > > > +pub struct Mm {
> > > >
> > > > Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
> > > > use `MMapReadGuard` later.
> > >
> > > Those names seem really confusing to me. The mmap syscall creates a
> > > new VMA, but MemoryMap sounds like it's the thing that mmap creates.
> > >
> > > Lorenzo, what do you think? I'm inclined to just call it Mm since
> > > that's what C calls it.
> >
> > I think Mm is better just for aligment with the C stuff, I mean the alternative
> > is MmStruct or something and... yuck.
>
> For what it's worth, I think using the C naming here is a very good approach.
> Because if you come up with a "good" name that is different than what C has
> been calling it for 30+ years, then we have to be very thorough in associating
> that new name with the C name. And it's hard.

100% agree!

>
> And "mm struct" goes waaay back. Just use that name and everyone will know
> what it means.
>
> For less well-established areas, with fewer callers, there is much more
> freedom to come up with new, better names.
>
> >
> > And like, here I am TOTALLY onboard with Andreas here, because this naming
> > SUCKS. But it sucks on the C side too (we're experts at bad naming :). So for
> > consistency, let's suck everywhere...
> >
> > Feel free to put a comment about this being a bad name if you like
> > though... (not obligatory :)
>
> For mm struct? Maybe let's not! Explanation without the criticism seems
> more appropriate imho. :)

;) Well one could phrase this in a relatifvely benign way for instance 'while
 this name may seem a little unclear, historically it has been used as a
 shorthand within the kernel for time immemorial' or such.

>
> btw, I'm very excited to see all of this Rust for Linux progress, it is
> wonderful! Thank you for this!

+1 to this sentiment, am very happy to try to do my best to add value to get
this series in as - from my perspective - I want the compiler to tell me when I
make mistakes nice and early :))

Thanks Alice, Andreas and all involved!

>
>
> thanks,
> --
> John Hubbard
>
