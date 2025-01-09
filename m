Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01141FC11F;
	Thu,  9 Jan 2025 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736410833; cv=fail; b=BZRKd2crkl7Z/uEHJv8udgBGstsDv9ChSiv+t0qWPBok6x0vuwQXAzHS6naUqMyIHp1BAm62EFjxxf1IwDwumzyJ0eVwCznTkHqHchV97jQgElXyx4AO9gZs+khpqD/CoLnGQPX3q/dR3rc11+7/J81ySMNXwBs1T0PckdVykXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736410833; c=relaxed/simple;
	bh=50AV4InCWhao4C7n2AVKeZJgUbwtKawVL+WjvOmNXWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JOeeKHaVgxHytJoGpvtG5sIMsHcUDI6JxUVL4KNUJA1Y/8LgYu0XE8qN14LGAFwlZcC9sDkBrxAD0vMEZjuxZHhsRiXfR/BF5jOCs9Ht+Fyr4Pthg3j900I+iWyOgzejydtxtAhZmIClfWXI/XlgSadXhNdQrBSWbEeMTse4wAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GIPdh1Wh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cWJJFXA0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GIPdh1Wh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cWJJFXA0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094hAEM019117;
	Thu, 9 Jan 2025 08:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=yVy4pg6Qk5gymeBs76vO3hrEGColaeROE/c/bbtUIt0=; b=
	GIPdh1Wh+0CGR03gq/CAndDXsbM2ZjSX0aPA08UHTZFdLNaKU/q9cpnk1KJovYWo
	izBJIprav7C/nM0pgA4TWW2Mti+VVzi52Z6SjDyP5+u+ymzaSCI6+Dx2Ko99qegG
	sqHjiYXe0l8Wj6vaSTPjANu2YD/LqeOyrsF9/yw53TInJHYX7jdxpX8VlDcx+eMd
	Z4xNL0BOPKP/jn5Mvm1l3ZPgDfkLu5OPOEbyXdJCY3kAejxUC5cJ1u0NUOaKv31C
	6xh3wEUBKiQuQanmsmbuGYKnR5ZIvCfJ0pqy3UxNk6KuiLNB/vVPWpUIMr5v28Id
	+hQ5AIwjF9hNzGdVdHMi2Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudc8mvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 08:20:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5097jUgd004767;
	Thu, 9 Jan 2025 08:19:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xueatd05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 08:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAu+eb2PKG3v3Dujcm+I/a+It8a8kuP/maLoAeB92SalLExBsGdbpMsKNVWX52b8G2Je+JHlPB58NkOGTf7B/a2U1K6jwQGcGrxAuFyZz6awhW6FyXJ8Y/iF8Vp0DT5ULUxenOi7oRY4/Zmr9wqzFnED5IZsVpe9wp+G8gwsQm78pOcwyGZ5MqqGowJZE6lQ7flyOKfIy+VAVTQ+Hv07ocznnUvQvQE6aJIRw5s+MsgHjOprTz8xJvK5tMYTxN10H7f4iZOCVbiXbr2h2lhu8OArU7qaYB7oOttRRVFRCIUhUEyOJcIydLOtWguYBOIj94YhFvXtrNRAeiOlWvzBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVy4pg6Qk5gymeBs76vO3hrEGColaeROE/c/bbtUIt0=;
 b=rlm9wEaKveqgVEt3/otimsyF0dwOhH86a6TiTd4lfkaua0Yh2IEr1XoeX9DLYvuc0tR6qHIdAiaqWVZcuKQfO6Kb2rhvRPtp4vUjFltsSUlrkqbAnpfl33TVnWR68fPqtFX3T812GH0PHp6bHN1S7zxTERpy/jbzzF8fCFLzpsDC4kxNkE7neFzs6d71TWGlF3/E4vxLGJgpKXtRpZcvlYzcL4YB//MnPv/NwEX0v7f7Vf8MjHGujaPY+Q8fIJ9e5dDIHKFHeES8D9EwTn8Vz6fgDal60D1FRa0Z7VB9R7l7CDnQiewDjpmWSQvn3O8V02TSfXGbsZp9EBv422m7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVy4pg6Qk5gymeBs76vO3hrEGColaeROE/c/bbtUIt0=;
 b=cWJJFXA0u1ZXxUSfxrIbUBI36+IyS3FYwvOJ93yjrHNgSt4A4DcsrCBZsw7G/OEc8FbYYxULvtQpn6ET6gG32d2R0vg3DLelZ6E2qNLfzSfborJ7rFXu3HbmhvKH1ArBI9zhYrmPHD0QIm5XKmbWMKxXSQEkOwgUyEohn7GhrFQ=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA1PR10MB7709.namprd10.prod.outlook.com (2603:10b6:806:3a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 08:19:57 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 08:19:57 +0000
Date: Thu, 9 Jan 2025 08:19:53 +0000
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
Message-ID: <18bc911a-ede5-410b-9955-5382bcef975c@lucifer.local>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
 <20241211-vma-v11-2-466640428fc3@google.com>
 <874j33ddxt.fsf@kernel.org>
 <51PsGz5tctBZlyC7TWAGRwZbM13r71BM1gtm1Y8F4j2w3FtKSXtkVrsvwILAqvSBPrFJzahyUVDum-JXO3yZUw==@protonmail.internalid>
 <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
 <87frlsbekc.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frlsbekc.fsf@kernel.org>
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA1PR10MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc7d85e-4e35-4a92-4b69-08dd30866703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0RHZ0pCeFNvbzcwaDBUWUo3YWFXc2UzTk1BQ1ZEWkl1eEg4U1dtQkZ1Vjk0?=
 =?utf-8?B?aGVwV0tYa0Z1Q0M5dWlyb2tadHUvOUNqYTlmb01VWlR6eDhIeVFYTFZvdytz?=
 =?utf-8?B?OU1UREY3WTYyTEp6eXdaTkk4SWZsVm8yVXFpQXNMbmdYc09YSW9ESnp2eUl4?=
 =?utf-8?B?YXQ2UWcxbUdGVllmNzlVeUlJNUprMEFTbDJDb2FwQitJbWd2WGVHMDJuSVJS?=
 =?utf-8?B?M25yWkFlbmNJQ2ZraFhibE9STm5WcWg2dHZvajlVck8xWnZhY2t2Z3BybUpV?=
 =?utf-8?B?TFhBaGttajN3SzM5UUlMZGJ5NkhuK3RrT3ZtSEU3YTBvTHNYRlZScll6Q0l6?=
 =?utf-8?B?TC9ZdmFyb01OaUNWU3Y5dFBZcVAzRjQ4RGI2Z3MraTBxRHEzQUdkWTZJZ2dE?=
 =?utf-8?B?WlQwYVluekxoTllueDNtRXp3ZkswTDhPVkNUNkppTVlPRkNiejNUUkRBaVhY?=
 =?utf-8?B?ZVYrbnZJU1NyQmZpQWhzTTZPZmxLK1pYejI3QmxlcVZ5YjdZRDhzRU9aOUVD?=
 =?utf-8?B?b2htOUxLbnJ1ZUFHbEg3RVNvZ0dFeVcybll1NUU5WjZZbHphR3c5eCtnbzQz?=
 =?utf-8?B?RWI5aGVRQVd3SEVWVkVURHN1TnRRalVDVW5SbTR2ZDN6emc2U1VoWWlkQUlY?=
 =?utf-8?B?SEZCZVN0MDdaaXBxZUhORG94MFRCQmpUaHVUYU1aakJQd0NxV1IwRHU3N1I2?=
 =?utf-8?B?UWZobmJ0dVJrdFZZY0ExQmFMbjR2TEk3ZHdFczNqTG5YbjhaVEc2NnpxenZi?=
 =?utf-8?B?a2k0MGVBbVd0SkVHU3h5VlFiYVoxbzU0anMwQVVSL2JiSEhiOSt0N3JPa2Iw?=
 =?utf-8?B?VXIxNWVUMmszdVBmK09BVUNyRjE0ZTBzRWV4VGR3bW5GSVJyMy9OOHJyRSth?=
 =?utf-8?B?ZU4za3NMeWphWjMwOVZseWF3UlA4OXkvUjNjdFgweEx4M2dIcllnSjJJYlR1?=
 =?utf-8?B?cUdGTktDZkJSNTN5TVJRblpuSno5SlVvdWhYZWJ4NDV0OGtqekdDUmZRalox?=
 =?utf-8?B?SWRpUlVQcEhjQ0svQ2h1bmk4Q3N1RVRwRExZOWtaRVhob29MeG9PSlF3SHZR?=
 =?utf-8?B?NHE1bGFna3pDRzVRTEZHaXNGVThMejBFL2ZFVWhsU215OU0xeUoyc2kxaXN3?=
 =?utf-8?B?SzRPTXhzRWhWVXgwOGN4anJXeldJRlVCYTFEU3FpRkRHWWxCaDdGZzR2aDQ0?=
 =?utf-8?B?bXlseDBMNThVSjI2bEF2RlByeDVCbXFBTVU3Vkx5eGdxYzJBRmlhT0FJYko4?=
 =?utf-8?B?ai9pZmdoTGx5THlQd0NMZWNtSHNiSW1OTk9HNFdzZHkwN3NKU1BYbTBjUnUx?=
 =?utf-8?B?bk5adWU1TmJVZW1heG9LT2QzVk5qd01CNXlvMG1sRENnZXc4UndvRmxSTGVN?=
 =?utf-8?B?ZUp2WkFPTGhOZFpaMDIxTGVMY1hmaU1ZTGxPSkVqNUdKYTJlRnpWek9icnJk?=
 =?utf-8?B?VVFXMlExL0xjQTNua0lMRFlnOTJVc0dKMkFHNGQvbmFsTFB4d2h1bDkyOFZQ?=
 =?utf-8?B?RHp5dm5idWRPQnFiek9ZSUx6K3dWREM1MjFnT2Q4aHpYaTJNZWphRDYvQTl0?=
 =?utf-8?B?aE9rYjdSVEw0OEVhVjZzbkNEYVNzVmNvcGIwK1lXTDJ6cDVIcTF3OGZsTWJP?=
 =?utf-8?B?V0VQQ3htNnBWc21nWWgzOEVSQ2lINnc2VWFIZU5tZFZqbnNMS2pLUG5DQ3dr?=
 =?utf-8?B?Q1R0RDlhcEx2QmVWeFRIdWxHdzFwN05JM2FxTDhwRUpST0F1YTc1MnJjY3JT?=
 =?utf-8?B?WExEUC9BWHNSWnFpNWszYWZ6alYxZ3NOK3pzeHhvNnNSdXBTTGlGSDlXYUgr?=
 =?utf-8?B?b1NMSzUvVWs5NExESjZWR1RDQ1BqWStwREhSMFBuRWdrZXQrWDZSTXpKeFl0?=
 =?utf-8?Q?BF1D2kRAMO15w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU1kRHhUdXIrYVE1N0dYc21nZFl1VVYrdXdMb1hPM0o2V2hwSVNkWlJNd1dl?=
 =?utf-8?B?ZTYxTW0vZjc5WFp0T2xHRDRxS3FUb3FCZFdycjVmSWppY1d5d0VSY2NSTmVj?=
 =?utf-8?B?OENkbnVpcG9xWTNSWWh1OWdwdWJ6RXJWMjVHdXN4UWxzcXhiZnlsUkppd1Yx?=
 =?utf-8?B?ZlBtOCs1SDMrcnI3a1RYNnJ3YU1WcW1DRGl0NHVrb0t5SVJnMXU5QTZJdzk1?=
 =?utf-8?B?Q2VIUXFEalpraEtVNng1Vk5LZTBucFM3b0NpYXRQY0Vza0JQVkJjTDNmUmpu?=
 =?utf-8?B?RDVUaCtyRlQ4ck5aMmUwM0FhdjVwUSticmVBY2d2UHRmbzdaV2IrZEVPQnpy?=
 =?utf-8?B?Rm5kQ29PY2FNbjM5UmtMR2RDbm9OVUQyWEJETDFZNXBNeTNSL0VINTBXNnpB?=
 =?utf-8?B?RFFaU0lZZjRYQ21lZWtiU3RhbmFqK01IU2J2NWxaQVVGKzdnaHVPdzNJR1B0?=
 =?utf-8?B?akUvejJTU2I4aDdFUW02clFGT0NjQUJGWDVndDRRd0hoSVN0c0VuSVhuWE51?=
 =?utf-8?B?dUNpa3NNdUJkTDN6ZEwxSmVjM0xnaWh3NDNEZU5YRlNwdmVibjlvZFpDUVRz?=
 =?utf-8?B?NlNuYzA5STQzTFNvenV1ZHozcjVvOXBnZWt0NmNGWnkwRllrd2V0dm9TUXdZ?=
 =?utf-8?B?OVZiSjQvMlJHK2tidFVtZzhxUXUrQ1kwUTFGWnhOcGRjd2dxaWpHYUtTWDQw?=
 =?utf-8?B?Z3h2N3ZpdTVRZmczRzZsemRqN3ZVUXFIanZZVENhNDhpYU83WGdBdXNHUzlx?=
 =?utf-8?B?aGF5dUtIOGZoZzgrNHVDU0MvVGs2WHBoN3ZDb29hRXp5OElROTc2ZWtTaFpK?=
 =?utf-8?B?OFRDYnU4b2FKa3YzdVVDLzRUWFJFTmdISjMzSngvYk1udWt5UHpoV2M3Mk1W?=
 =?utf-8?B?YWpDVk9ta2FkMXpNMGJqdk5hOXgzMW1heHhQTWNRSUtxY0gyL1kvWVg0U0l0?=
 =?utf-8?B?bDZPVHpWbWVYUnZheUtNWTdLcW9IaW5NQjhDOFZvS3c3VVc2cEhSRkpkR1hH?=
 =?utf-8?B?a2NQYkJlUzJMWElRczQ5L0JKUXUvSlc3MUYxZEp2b2NrRTRyR2JEWlZ6VEZZ?=
 =?utf-8?B?WjI4VlcrNTJ2Mm9ySmhhaVdqcUlIR2dmM2VCRnFWaDVIdlJGdWVCUlA4RHNh?=
 =?utf-8?B?MGxMU0FjTGV1QzBKd0pxcGZSZmJRWGJBdFk4cEZJOXpwMGpiSFNKZy9kek5l?=
 =?utf-8?B?VGhteFNRVU80VUhvMXl6TjRQRW95eCtYL2FmNkd5cUhtOHVzcUxUTzVnSE1C?=
 =?utf-8?B?K0NlOWZ0VWJCbVB4T1FDNVB1aVRTcDArWkFRamg1T1VHOWZuTmo4dVF2MENP?=
 =?utf-8?B?VUtDMWl3Ni9BZ0pVc1gzOGRqTDMrRHBjZ0NyaDVsMlJQVUJBb3VwZTlYSUNE?=
 =?utf-8?B?LzdiTFE1VE8vam04YWVWMk00R0NDcjBRNGVDQmI0bjVLaTVYWVJ3ZVdweUph?=
 =?utf-8?B?NjZvc1pOcmZJTUluWDBTL0NUcUFzOUpyaTZ3Z0hRZFBmRHNFanhVVUkzeDZp?=
 =?utf-8?B?Wlo4YkE2SnFrb2VNT1JmZ2FZd2tWYmdvam9VRnhRR2VWOUFjdms2WVMyRW4w?=
 =?utf-8?B?WXZlQ214d1ByRmY4b2lCS3RDdDd4NTlFNThnYS83alJQUUZ5UldldHpOYzZB?=
 =?utf-8?B?Z1owN0hnZFlkcHlCaTJ5UVJueVk2RkZtZHJrWDdOTWdlTi82YlFORHk4WEZX?=
 =?utf-8?B?WU1sZklYZlJidStHUHFUelJackZHdzNBT3ZlRFJvTTI2aFBRS0xYZlg4TDNq?=
 =?utf-8?B?K1hnOE4xcnhhQUwvdnliUlFxdmRPaDQ2Ly9TOE5lMTFXdUhab1V5eldoK3Q4?=
 =?utf-8?B?RzBNbzc1VlhVdmN3YzdzV3ViNDcyNVFaV1IrWEVoaHlXRWh0Yk5ZR3c0Y2pF?=
 =?utf-8?B?R3QvTXRrLzcyQnlLZ1hSOEhuN05qa1NyRVJyYXdLL2plVm9pemJ0c0xkZThy?=
 =?utf-8?B?WCtNZDR0MGtKSEwyNTgvc3V3RHIzUkdPWE1DRm5sSUxYSjN5QVQ2VW5HUGs4?=
 =?utf-8?B?bU01SnpEcmZid1ZneGowRnpRV3JKNHB5WEtqQ3ptYWtzYjR4UlhxYUdybnFJ?=
 =?utf-8?B?L2Z3ckVpQzNHRzR5dllUMVp5eTlYeWJHQUpCQ0pQMTErdUppSDdQRysvMDZl?=
 =?utf-8?B?cG4rcXJSTWgrU3dEMUJxYlZ2Szl6QjhaUlBlVUZRTU1vZSsrWGt2bEtMS1RJ?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hVfhfXi/SbaWbzgBkwJrdPRrNeoDLnAReSY1euISVMm50yepQG0dUM30od2HDE5TszEMybKZUlxkrIbSWiLPxAHDq0R71viQ/rrnEiysNZ/gNo1m7+TzDvlGBiFQos67hW7u2y5m/9y1o+Z9evSUvhDQHv7VhqamPmggvv/FWYPGaX0ctLiI3LzoWKztPGq0kB1itmRiMg/Tb+UL3XSAEsT4Vw2oh5Jf10JTDXf16ciypyqP6cWadDdmnIXkSVEV54ZFzfWqOXZfRm79IT3nonpDSuBLfhJhK1LPhikBfJJkmktYftR2MRfxUzP4WskF33tLCM1/f+xwjwFDIecNNME7EX6LQNDwFUnQmQQTsE19lvzfHbneK+SCABj7KgdGYN+qoOgCgmH+GQcinufLkU4Wen01aowsWf0UljVJT+juDQxv2ibm/Kvtn6yImbISMcyBMIL9gn8aCPdyT1VL0bYlPMj8ZteH9FW1jDvVrYhjg7DxAvw38OAbL3BV+9blurrL746p7T2AOnnmwd7kQJkaCL1IM8zlS2+Fx+/3gkui8Yk7/aG6bfVUNOu5dinTCjsbHYiwIUG8j8uenNiysEkJxI3qhkUvIwtnXxvLoks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc7d85e-4e35-4a92-4b69-08dd30866703
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 08:19:57.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XKgcQw91iCT1EQ3ScXHxwWwVbFF6M47QPt/zBZd11dlosJagdUIS4O2ckHYT379w5WR4Grg7bP+z5bzcJsJxAw4OaOQ9X0eIlefGNxr0oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_03,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090067
X-Proofpoint-ORIG-GUID: IKOYNfcjRbLWvddDrcm9N0RBuWZjf3TN
X-Proofpoint-GUID: IKOYNfcjRbLWvddDrcm9N0RBuWZjf3TN

On Thu, Jan 09, 2025 at 09:02:11AM +0100, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Dec 16, 2024 at 3:51 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>
> >>
> >> > +
> >> > +    /// Zap pages in the given page range.
> >> > +    ///
> >> > +    /// This clears page table mappings for the range at the leaf level, leaving all other page
> >> > +    /// tables intact,
> >>
> >> I don't fully understand this docstring. Is it correct that the function
> >> will unmap the address range given by `start` and `size`, _and_ free the
> >> pages used to hold the mappings at the leaf level of the page table?
> >
> > If the vma owns a refcount on those pages, then the refcounts are dropped.
>
> Maybe drop the "at the leaf level leaving all other page tables intact".
> It confuses me, since when would this not be the case?

I don't understand your objection. The whole nature of a zap is to traverse
leaf level page table mappings, clearing the entries, leaving the other
page table entries intact.

That is, precisely what is written here. In fact I think this
characterisation is derived from discussions had with us in mm, and it is
one with which I am happy.

Why is it problematic to accurately describe what this does?

For a series at v11 where there is broad agreement with maintainers within
the subsystem which it wraps, perhaps the priority should be to try to have
the series merged unless there is significant technical objection from the
rust side?

>
> How about this:
>
> This clears the virtual memory map for the range given by `start` and
> `size`, dropping refcounts to memory held by the mappings in this range. That
> is, anonymous memory is completely freed, file-backed memory has its
> reference count on page cache folio's dropped, any dirty data will still
> be written back to disk as usual.

Sorry I object to this, 'clears the virtual memory map' is really
vague. What is already there is better.

>
> >
> >> > and freeing any memory referenced by the VMA in this range. That is,
> >> > +    /// anonymous memory is completely freed, file-backed memory has its reference count on page
> >> > +    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
> >> > +    #[inline]
> >> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
>
>
> Best regards,
> Andreas Hindborg
>
>

Let's please get this series merged. I think Alice has demonstrated
remarkable patience already, and modulo significant technical pushback on
the rust side (on which I defer entirely to the expertise of rust people),
I want to see this go in.
