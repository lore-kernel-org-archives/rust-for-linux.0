Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470693358D6;
	Tue, 10 Feb 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757208; cv=fail; b=QOdjR/0j2xhMD6g6gthFuvW5ia+0prfTE5oxSvKUfrGRsDiFBdAgRZ8Bgs9im9cMd/WkhjDy2ybw4pB1JRkQsmH8OhOxzH10LgXsDhGLodsGA8L9HIiO2NUc2KkUL6CItWjcmYW5co+HhNNLkRWf/MzlCiev8jrja5mkXLMqDr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757208; c=relaxed/simple;
	bh=M1hgXE/SwKeqHa/9cZfLmep5j215M0xrhb4bNpcK6zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Abr5RQgsd4eFymvj4jkyg4uqXO8ONuEmvgyCUDmKzh4CWCetHuZK1NOlNtaM+jtXswudcQq1s3kLjxDYr/Iz55dZHrdZ9PXq0x9Dkb9oSuUyp3rz9J24lf32gGTi/sPr8KSt2IiFZB7Eoq/otpX6lv1KK9YL3lBdVhz3DSCdYhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EnFd/9Nj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HrPXdBdz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EnFd/9Nj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HrPXdBdz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AGegZT1407140;
	Tue, 10 Feb 2026 20:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=s0rr4N5/hKRU18mXWtNjt+roRH8Kd8ZnAJTyxHGtG08=; b=
	EnFd/9Nj+LcIwGZ0cj2XXZL6IE8CILKq4Cq1ctUzabPPS7UHs9XO6qKiajVy1stL
	aR0iGpV+U029IT4KCZgt2uFLxxsP6F62RdYMAAisq1DiaBQKQg/f7wr+fbzF86he
	SUCTR97uPcSuW+tdNIMWYkHedKAgtZ/Zd2VrA3tbeRzOnNgSQ85fvBfGQgsau5SM
	VdRvCO1phBxqL8pwtKiJmKKXTg6YuMtmkISCW1uVbCdIxyBUKOGOJhnsEgWFvnXK
	dnCtoZ7wp73MlJQ0PgvIsQO72xy5j0xi9Wsla1nrl1ey6MehohWVBG9jHBwTNxM7
	Dk1d6IBb2t6eGt+ejThakw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88df0gcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 20:59:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AJqR1F013032;
	Tue, 10 Feb 2026 20:59:43 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c826ykqf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 20:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd8OKyU1s2mWAuUWTlnQ7pk2m6n1Q6mbyRQLrt9ved+euANVoZSTFMAvVC8pxWMT58RIU3qgMe0m1U1ooh/iGjNc2H07ff3Wx6UmA98c4uVieftE1vOYLfBKI/bwQuO014u6DMozqVEA9jNW4S7/+/GZAWQ3mpuN/dgFK8rb9foX4ZlCC/S1vcIptuhWiQfJjpCXMEK/NKB1prcnYkPYeJ/zUOi/YltOFUPofGsfxGYITAimJ6ucnU1QgPSco3jiCwK2RcytQEqmhHselNX4r3vq4ZduWlWwL7PPtHDI0hT4Jy33LVdcaSnPobsCvbZAwn+zD4Kh1OV+yrOjm8yQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0rr4N5/hKRU18mXWtNjt+roRH8Kd8ZnAJTyxHGtG08=;
 b=NmPXN0OCn/DVmNnQoNW4U2Gc9ccYnkyhDsdK2a2+/Mlld21ZrXz+NhOIAfErlRd2AJ/HsV9cmfstbAIbn7r9OGnSyuucy8BXrQZXP9pr1nSRbbFpi9hExqurlQQOPCa9iZj8kNwyqUfaR/93Ie86jT/0j1BVIb0CC/Y19FI+IP7eKQXc8ERfyPI9X8uyfnhvtb7333lOZdVfjFL2sBPhHVcQTqUVW/3cTT3S1SGCzavt5kleXQTbMRK+Mbq5bDJUFFlI6l5PZ8I3Ok00RHOun/s0koCl2tmlkfwtT0vd5iiM0VhkH+P2q6wjZLJnj/GXC0fBSD3biku+B5AdLG7UYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0rr4N5/hKRU18mXWtNjt+roRH8Kd8ZnAJTyxHGtG08=;
 b=HrPXdBdzqepvmYZyF9tqX80kuVL9wOQubjEczOjXiUgIDpBx08D3nuE8dVjmXTh5SsqB19HLAEpZkpPufzoymmKDZ2772mCF4g8lK+vRaNaWwFY4zYyCXTpgKMFKDytgm+IrmHR/ah21R9MZjShru4SU2HGwR9QkI+LEyQ2CC3Q=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4192.namprd10.prod.outlook.com (2603:10b6:208:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 20:59:39 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:59:39 +0000
Date: Tue, 10 Feb 2026 20:59:35 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
        Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
        Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Lameter <cl@gentwo.org>,
        David Rientjes <rientjes@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
Message-ID: <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
 <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::28) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: f35f1b35-cfd9-4db6-760e-08de68e74e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVJOeHQvM2xiaDFNc3JHb290MW5Gb0FTRks5VER6NnFDWkVuU3B2RUJXR294?=
 =?utf-8?B?bnJiUnMwWmlYcUp0UlAraDdpbUNPYncrdnB2L0ZvZzlaU2krMDNERXhNRDBo?=
 =?utf-8?B?OTRHZEc2QzBsTWVkVUxpaTBJeEhDSHdkTnEvL2RKSmNRcVVkNVdJRVFXZ2ph?=
 =?utf-8?B?SVdoSjNHeW16dFd6K0xTWjd1MVdQRWRDalNEVHJObDFFT1Q1VmZ4MWdCcG5X?=
 =?utf-8?B?amxDY3ZXMXlOeE9adWlEaVJsY3NEWXN1Qkdoam00QnJFYjEzRTlZZ2FQMWFE?=
 =?utf-8?B?K2NyWG1lanJJZ2t0UTQrR0NMRVNzd3A0QnJVU1pTdFhMUTBUY000WCtjaytI?=
 =?utf-8?B?RnhOK3BNaDgrYSs2bFJ5dlMrS3J6eTExTG1nejFuaUJVVEpJN1FmcHZIRlRw?=
 =?utf-8?B?Q09KQW5jNkZJZm5vNERPV0h6M3dGUlE5NTYyRG52ZHo0anYzekhwMlJSVTVN?=
 =?utf-8?B?dFlLZWNGb1AvL2ZNYzl6VDlwQXZZS25Dc2c3cW5jQktxSjRZZXZscHRkR3pK?=
 =?utf-8?B?aUFVdjV3cWtadnp3RFBnRHVOQzB0c090dUxiY0R5YlJBcmRONHFLNlVNOXZI?=
 =?utf-8?B?U1pLZWQzR2hucTlDeXNhTVFiKytPelVtbXZiTGVTZmR4YkdIZkg5K1h1bzhL?=
 =?utf-8?B?R1c3RFFVK2RBakplNG92Rm90N2tqbEZsaGVuR2RrS0RsZEdRcDlHRjJJMENY?=
 =?utf-8?B?OFp5UGpHeng0VGdSeFdLQWJYeUo4TUVWQkh5NHREMDVwZ3JsVnA4Z0l1enZq?=
 =?utf-8?B?VmpiVXBhNWJiM0dIWDc0QmQ2MC9uYWE3TGdIRkl3VGFWVXdIRGhmcUNmR2E1?=
 =?utf-8?B?NXp5M2lxY0FHTEdzSW5xcUFYYzNZdEk4NStvRkEwWU5xazlHNG1hOVdPZUhF?=
 =?utf-8?B?WU9MUDd0c3RHOTJvZHc2dFpqVzRWc3JCbzhmUFNtSE1USCsvSEY2SllhVWg2?=
 =?utf-8?B?SmswWi9DUmtaUU9JNmg4Tng5VDhWb1ZseCs5bWJMdnpkZkVGVlNNdEVaTEpP?=
 =?utf-8?B?ekIzaDZ3MnlTcHVlWFlwSkg4OXMrSkx2aHJSTDdleE1XbjhsQlhTRlh0OWdT?=
 =?utf-8?B?cGpIMVg0RTYvNUZQQ2lPaWtta2RLN1dIUFBiYWp2WVM1Ni9GS0hrcnZLc3Zs?=
 =?utf-8?B?SkQ4eVRjR3hDU3cwR2E0VGMzenQ0TE1GOUZnVmptUUtwOU81aTltSlVwV0pL?=
 =?utf-8?B?d0dqaitoSXRxUng5aVNuMWN4bEZaOVRPKzBjVXBqVGcwVE0vSmFpN1hWOXhS?=
 =?utf-8?B?bXU5MmZVQkV0SDBYVTJndlRhQVJlTEc0SW8vdTJYL3ZLQU1SOGRHQzVLNG1r?=
 =?utf-8?B?VndjcXF4WTZHMmNaSjNXbEIrWVNlbUxYSllURExJRjZTeGZPVkpDclhNVnpS?=
 =?utf-8?B?NVR4Ymc2N2FhNGpKQU4wL2RJUDF5V2xUcS9GMk9mMC93ejZ1V1I3UkNTMjdN?=
 =?utf-8?B?cmJiV0RBS3hYaGlqMURZOWZvV1g1OHJuaUJKb3VHS2RZSHJhYStKZHA4Ykxz?=
 =?utf-8?B?ZVhDWm1xRTZXNVNLQUUxU25lUlI3dFFCTEhVZXNuSVhhRWZTcEpLeCtpempW?=
 =?utf-8?B?Q1BDWnFGejF5UVVwS0xWOVliZkNzZG95ZEhHQWlwNWZNbXg5bWVZTjZjeHh0?=
 =?utf-8?B?ZE4vNWY1emNSVkVmUFpJRVlKNkpwMXAyWU1ScWN4NnBmM1lwVTA4OUQ3Vlhr?=
 =?utf-8?B?bEFQR0ZFbDVDN3E2YmI2SmdjWEw5bXhURGhyeitwVGNleGlhTFVJSnNHcDVV?=
 =?utf-8?B?ZkJjd0ZZTXhSZ2MxWUtHWERUZ0VLZzRNYTdudkVJNFhFVHpESXhHNlVwRVJD?=
 =?utf-8?B?TDlxZHcvUklnaUx4dGdVY2VhVTVSVjFWWjJtZ0N1QjFaV2dHSzJQemVtcmxq?=
 =?utf-8?B?THZEbGUweUszSGRvQ25CajRpYjJrNGVJWjFDMDNnNmx6dklJcHFSbmJzbWtW?=
 =?utf-8?B?VUo3ZlF4UEo5b1JKamZNa3h6cW90UTZxY2VoYjFMZGM5VE4vMS9UUDFZb3pO?=
 =?utf-8?B?ZHNpOHZZVCtTeTNJb0FzSkFhaUFGWXRTYTY3WWNWUWFqdWhiMis5Vm1jV2tV?=
 =?utf-8?B?NnRNaGkvZ3Zka3I3K1BjRmhMVlNGK1hvazZEZG9uaDlheVRleFF6MkZNci9C?=
 =?utf-8?Q?fxdM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHhnRU82K09LSDlMdjhZKzRVL3lVZ1pVeHhNcTBSdU9iTmVFVXlucVlIdnVT?=
 =?utf-8?B?SzJYLzJoQjVsbmxlZXFjYnVvcThiZngxUGhIY3dZZmlrR2tOeU1yVzZXUWVm?=
 =?utf-8?B?bUx5RUkrWmhyaVNIT1lKQzlZaHp0YVZkVUZZOC9CaG55TksxU1lUcVQ1QU5P?=
 =?utf-8?B?OXlrU2ZYZW03TXptemVBTi9hNERObDJQa2VoM0NnK0dWeWRLZldlcVk4YmdS?=
 =?utf-8?B?UHg0NjZvZmthdUdEZFN0bGpXemxxQUdxOXB1TFhzV3JoMUdTQ2orMzZaM0hY?=
 =?utf-8?B?SmJhY1pWS0FIV1NqMC9hNXczd2syNlYzWjl1bldNWld3TndOVGdWNWt6WEpl?=
 =?utf-8?B?SmowNzNUNHZmR3BsZERZaXZsTGJvN1ZhT1hwcm5jVXZnaHhpN2ZITzZYclNk?=
 =?utf-8?B?SG5OTldHZEVnSTJIYS8va0FQc2JSWU1YVjJxVVoxRGhVQnVsb2c4SXBZbzc0?=
 =?utf-8?B?enMzUndSb0RadnJqOFV5cWlaSWVOcWozbjBwR1A3ZEd5YzI2dmdpMnUxYzlr?=
 =?utf-8?B?RmxzZ3Eyb0Zza2JOYThFVW1YQVlpTUJueTVCMWpCTWhsVkxPRm1KcFVkRkIz?=
 =?utf-8?B?TU0ydWtObGJyZWlnc3lES1lpVC9lbGtZT05oamVWMTBzZUJaRDVFc05LcmYy?=
 =?utf-8?B?MzVkbnVkeVIzbzM2ZElMRmorcjlMUXVYRm5vUjQrS2JOVEh4MTdpZ2VWb05j?=
 =?utf-8?B?Q3FtbHY3a3AzR3YrSDZxblJNbTh2ZVJ2ckN2aFFCZ3lmVmpheFA0Z0V2dU5n?=
 =?utf-8?B?ekY2cllKcHR6Vlc4ek5xR08xZ2toNWEvL2JWMk9GSVROeW5Nem9EbUhKNE8w?=
 =?utf-8?B?aUxYRFYvQjhKS1FqWFRUY0RHMVRiUGQ2Q1QvSW9MNm5jU3p3YXk0NEhqdFdt?=
 =?utf-8?B?eW9qYnFVWE5UQkFSTis5aVI2elFudFdKaXFQa09KVzNlOVJ6THBrUFdNSkw1?=
 =?utf-8?B?RC9hTERRTFROVlJQTG95N2lDdHJxZVluWlp4eUNFUTRhOGRsMFhvZS80NHV3?=
 =?utf-8?B?d01tYUlwd1FrUE02R0Ria0h4QjNuRGlCWlY0Y3IvQzFJSjN4SUJQRXFXMnVy?=
 =?utf-8?B?UlR2TEJhMnNDa0VDUjVZTXJCTU1DanBOakFPV3BtaUtPYmtRaHN2NURPbi9N?=
 =?utf-8?B?d29CQ3NMUE1NUWFkb2w5N1VmemRHTmhITkcxRjhGc2NhRTVKYWgyZll2Sk5W?=
 =?utf-8?B?cHZ3a2prTmtmQjhUTFYvZDljQVFRbjJOT2srUklHNmdCYzdlYVVWY3V3Zmxk?=
 =?utf-8?B?NE5vTVNBZ3Fuc2NLRjVCSDh2ZVlXMGx6WHN5b2crUXJ5NHQrUHhvcHV1Zlcr?=
 =?utf-8?B?V2kxZWdlMGhZZCsraFZ4M2krWHpyZlgrSDZLR2FUMU9rbEROKzFCUnR0MU9n?=
 =?utf-8?B?S2JMSmZTcHEyWFBJVkxOOVF3cUMzZXdMMlpEdFRjS3NVbldzWTBEVVY3ZWRQ?=
 =?utf-8?B?dUtJRzNmMFpuUnlVeHJFWHhJa0kwSGtJZnJzd2tTblJ6YkI3RU5NVE13eTR3?=
 =?utf-8?B?M1ppNHZBVHFVd2NJNWZ3akkxcWtkaDNKVW8yZndvcXducW9SNUt6ZUpDWUFF?=
 =?utf-8?B?ejZnTElzdm9hV0dPVTd6aU9zQnlvTTlQMkJ1OXM2a21iUlNTZ1l1ditGOHFn?=
 =?utf-8?B?aGNTaGFHa3dhZEpNYVJmNkZRTXNLQW9sYm1kb01PSjZQUG4wSEtIOTA1OW93?=
 =?utf-8?B?RnBIQ1lZbmpLQ2tYUWVrK1lvbDJjSWphVjl3dm9kV0RaMzhML2FqbUs0QVlm?=
 =?utf-8?B?dzlUZ2UveHZuZUp5VXcrbCs0KzBMRXkvNnRpeW9IbzdRT3dYY3pYNVRlNHhL?=
 =?utf-8?B?NUhNWnRYVmhBY2NvUW1zT3d1eGdCYmsyUDJVb3B6WUxiakYwbHpvYjZsam8v?=
 =?utf-8?B?d0tNdGE4SFE1TUJiM2h4N3hUek9iYXJDOWt0c0R6Y3YwLzZIZTZnTlJ5SUha?=
 =?utf-8?B?Z09Pbk56K25yRzV3N3VLSEhxdXJqL2dUYVFoVHlROGtrenJUZ2pqTkh3VTlY?=
 =?utf-8?B?YThDNFZNNm0rdkpVejdacFRBUXNkdHNjK1krcXdjams5Ti9mbnB3UDVxWi9R?=
 =?utf-8?B?aVh0RmlSY3FnSkw1OUQrVnpXUmVjazE4ZURJN0ZMbGZJM3FWVmN5TEJYY2FH?=
 =?utf-8?B?dWhqN1laNHlac0p3MHY2TGhidmt5Rk5Nejh5dFBXRWt4SGVaRWlhVHh5ZEhI?=
 =?utf-8?B?YVpvQ25sQ3JiK1lpSkUxYndDL0pwYWVmSEpBd0poYVBmZkthOU1hejR1RVJn?=
 =?utf-8?B?SW8wQjBMUlhmQ3h6Z2tySnB4L1Z5Nk5uaFN0Umc0U0dTRUhnZ3pEQjNxR3NO?=
 =?utf-8?B?TWp1Qm9wditTYWoza1M5alh2cVpMSmF3VC9CaGh6dDZNcElGMzRkZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6F9EFm/SGYkeIn9sAbdlZgFfDwclKtaTsSJjVtf9q4p+vaNQTVNJUwMqMZUk2ubYlDjst37i7/NOY2fXm0caOsb2D7NxiGWZotC1qDKt9mOr4PgZ8uYkoIEGPA3h5IvqJ3u4m8ypV4D07TsXHa57UfqvqhqWj7NpLY7GDkuG2Yxa4eDgQn2x4YfpU8rrfE/HVjAk4MoORKtgtWBVp1gtUl+RitIIgiO7FoQwiEPruPYW9E2JqTNSMXBsrQfn2jhIO/qGCk4r8xXVAdhUobKX8oS3t6IHLVDTXr4uDmKygaurF2QkDekTxCL9/ktnT09eAUwX7efp4h9hIDQZAr3CEdDnpZ9JIOlJsIlmdorlj8uqNWPtlyf0cloI92f3aeNDw0dr0dZr7LySt1JHzGDOkhYNk47MgcT7Bbxuh3cPrLJRGDMNFR5ntW6H4wYJTBreZ9Yvmker3DcAasGinMhue7Q1NbfwCu1MGeN/fxmNr55vwC56u1a8tOrZZI1dzN56T2fvnetHH/EcXg1UrTUukBGYKUlnbJ78ykJ2ZT69BF2McUoTsB5cDO3bHSybVoXf+EL2HyBvYTb+IWTm9imzYWQlYkO1VTjdWBvIJY2Y9Aw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35f1b35-cfd9-4db6-760e-08de68e74e5f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:59:39.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCvR1m16GNgM+xbGdHHQgheqxd8vl4dY0rFEdefhtBjSpFqGKRhQTjylKg9df5XmYK0b9wTYx62sZheiWIkoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4192
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=718 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NCBTYWx0ZWRfXyx1LyQHMJEd3
 OBRVFUS07NIwHZDDAwaRg/YrgBHcFrjLMCPKyhkGQzDhSxsH8ITrHjpBcMJZhKL0+I9JXVPvls/
 F/4vAnhezmEhxAlHCOQ+BiJ2KlKmHnr7fU1p9cYcNZpQzeuWMr9HXGYBKEo+ibdJ9wZ2QglPumA
 Q+kwn9crQaTc5dZkkrBtHCZsx2esIsC5jtKdg2xrvcEvKHR4Nm63HCEsfAGopAWpbVpDpBYe7Cb
 qw1rcusAfuhNsQVNWo9OJ7MjRdktwCD3VHg4a/GviZdNkNccRTW6ETn1kQTHs9xGct+ZaCaE8mD
 oJ/jHVscH7RZyu5Nwii54GrOSyNQgJzjz6xkxZAn5TOYvbgjl5/NWWLAj/0VYdMYQP+e0Fg9AFv
 MqDnrEVz7WUc0Cte+IxIwdI+lnVSUROi+T7zmAhLJ6/93W+0UzgKEkDDB6/yqRnjEzrrSUL5zCp
 KUbbQLb9Pwx6AzbVeIgAdw5HH3bOsd29GdXFb0QQ=
X-Proofpoint-GUID: T0LzXeCJ2JQzTbXX7MtIixj669YoOeJV
X-Authority-Analysis: v=2.4 cv=AqbjHe9P c=1 sm=1 tr=0 ts=698b9c40 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=WOsYOCEZ9s9qqDn6mjgA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13697
X-Proofpoint-ORIG-GUID: T0LzXeCJ2JQzTbXX7MtIixj669YoOeJV

* Tamir Duberstein <tamird@kernel.org> [260210 19:54]:
> On Tue, Feb 10, 2026 at 10:16=E2=80=AFAM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> > * Andreas Hindborg <a.hindborg@kernel.org> [260209 14:39]:
> > > Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
> > > `xa_load` function takes the RCU lock internally, which we do not nee=
d,
> > > since the `Guard` already holds an exclusive lock on the `XArray`. Th=
e
> > > `xas_load` function operates on `xa_state` and assumes the required l=
ocks
> > > are already held.
> > >
> > > This change also removes the `#[expect(dead_code)]` annotation from
> > > `XArrayState` and its constructor, as they are now in use.
> >
> > I don't understand the locking here.
> >
> > You are saying that, since you hold the xarray write lock, you won't be
> > taking the rcu read lock, but then you change the api of load?  That
> > seems wrong to me.
>=20
> This patch doesn't change the API of load. Andreas is saying that the
> type system already requires the caller to hold the xarray spin lock
> when load is called, meaning acquiring the RCU lock isn't necessary.

What I mean is that the API can no longer be called when holding the RCU
read lock.  You seem to imply this is already the case though.

>=20
> >
> > Any readers of the api that calls load will now need to hold the rcu
> > read lock externally.  If you're doing this, then you should indicate
> > that is necessary in the function name, like the C side does.  Otherwis=
e
> > you are limiting the users to the advanced API, aren't you?
>=20
> The existing API already requires users to hold the xarray lock.
>=20
> >
> > Or are you saying that xarray can only be used if you hold the exclusiv=
e
> > lock, which is now a read and write lock?
>=20
> Yes - except for the word "now"; I'm not sure what you mean by it.

I'm trying to understand the locking on the rust side.

I think you answered it by telling me that all readers and writers use
the spinlock.

Is this a temporary limitation?

Thanks,
Liam
