Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5126ACC
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993353; cv=fail; b=Bj1eH+jvc7gt77PGAfcp0xGzIsKC/52fTFu5VfhlN/BN9Qj21p11/nVioLm3Wm+I8I2vharlisxpV5fqKWHpoy/rxN8HjD/RWjFc/ppHHXi/qaJgwVW7QKFAE7HABIhtXug1DUw/qcWaMfoDI0Cu6Tv68lO+vGkkSW8lFUBNCwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993353; c=relaxed/simple;
	bh=TcD3+fKZjM3CvXGyiuGlnpSuMGdtfkzohMuacogJCn4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kGljEE4X8x77ohxlOzo4vo/+SSBLj7P4U6/gqU7s4/POlaAVVsJI4eh5oGACoOSTMzjcnreiCPX1IGMMGuHGXENtIklUv94Xtx9LxXld88iWW42j17A0/y9xb872WLHaTWHSACUsNx1KCXx7SUg99KLAfsWKzknF+dKYkcceBTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OovSEzgO; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OovSEzgO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1BumyzK+c/Q0SNyiZzZeQSbADF9uWJssZ9H1lNBgGObEjo20uJeNoVNkb543K5Kf8wfVUI2zU6S1fdRpA0Q6JwUGqSHCmyldlYZhEiDUh1gTrwNK0W7fwrJrkf++pRmrfJOxdaOTTjAXeXMMYoocQQba8s6NRixwC/YViB9thBu+d0zUGddPtSk4/2M9r1z+MqCXO2q/1huuo3BAIvdfPZ8UDDTFjx4vzVDWv0SfIFLwDPKk0+R3lZzTiFQcC4nz2LSH8uhNogiLAcQ+murHFHdHIFlOCkNofctzmsj24UxCpDNundx+9mwHP4l4RMQbqG2RVS5AivjX16xx1hRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcD3+fKZjM3CvXGyiuGlnpSuMGdtfkzohMuacogJCn4=;
 b=HWDonsMvFj2CcQXNNzVzwZbEMa6p1Z9wGSg2qDv9T8m83NycL9eZ2FMMqdCzX7g9LiErtaxBJT/dL9qYyNJkd7ovBKu9IDH//UhweUShBQasBBOsDM5q8BSmcZTfgWp1T/O8kn+qhiImPkwUzl63u1ZIyZrGPyVUYngXgxfIOehWnW44jrr6uSSm0/7L1qPGXuaImJi3wpj6hTP208EG3U7PiLdGgNJG+g9SaxDd9vICvz/D0DdKpycdRprHI3zuTl+5CRG8QC0rejTiEl/388C+0KtzmKK111IN7WLV8i+mY9NHySzfzY7hjlYWBU4kmmGEfi+A8kPzN9MkmQQoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcD3+fKZjM3CvXGyiuGlnpSuMGdtfkzohMuacogJCn4=;
 b=OovSEzgOKld5h8VZiHbMcBLWKrr7Ddp9mlq79itoqmvxFilFZo+xmiXPxpxHEWkhPeh1puQM8JbrbIrBOpSWjJYa7RTQadETthcflMHZeohyQhQfSh5Hjt/hpaen6QtPd1yCbNXMZJ82VKMa+pGxvegU6FtBZMDkimUJ00alVlukT40AZcYZKRNiRWYyvtCXHwBJD6gpT26XQZnXlo4nqcQwwmTJoObNS0ZikbXQ0tfsP3w7fY2HrYiRcpIVajFXB4/e98u3jg1Hyi19aCrXq69DSX4/9VsIUpL5OEVB43wNHbcixvxsZ+p2bz2OXJQpBY+rokon2vhk0cF9f1ac0A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 23:29:08 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 23:29:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index: AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoCAAEL3gIAAFKqA
Date: Tue, 3 Jun 2025 23:29:08 +0000
Message-ID: <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
	 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
	 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
In-Reply-To:
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA0PR12MB4351:EE_
x-ms-office365-filtering-correlation-id: 2241b671-b91e-4329-f64e-08dda2f6705b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlJJMis1eXlJSGNrQVd1SG5QZWlVVVJ1L0lqcnI1TXJGeGl0VEkyQUlhdjZr?=
 =?utf-8?B?ejZoUVdTeWl0azJ5VFZrUk4ycWFMOWRZWVFBcUcrUStiRVBDYlFvSVRTV2pl?=
 =?utf-8?B?RURSNW5FcUdBaSsrMW5lay9KcHVjM1VKMVVIa1BESVdjNTJ1V0RsZnRyRzdy?=
 =?utf-8?B?b0ZveTdGUVZjUFFCNEZWRkV0SFp5cTcxMFN0aHE5eDJHZ0o3SG1JQ3BVUUE4?=
 =?utf-8?B?QkJCMmhPRFhzOXFKaWF3V1NIRnFTdXIxYnZDMzRLTE14WXN2NC9XUStqUFZk?=
 =?utf-8?B?K2JRYUhjRDY0ZjZ2WXRZZ2VVeDU4ZUlIWTF6eStXM1FmTzRySWErd0RDLzRS?=
 =?utf-8?B?V1BPaE44Tk40WDQ1Ly9pOFI4TXBBbzF0UTNLaHgyRXd5aGlqd29jYklNdm0w?=
 =?utf-8?B?NnFRNlRITTA2OWhtc1dGcmkyL0UwZFl2ZlF2M2EyUUQ5dVVSczArbStPVUFU?=
 =?utf-8?B?ZTNteElSOE9vZTYrbWhidkprNTNhWVh1TXVHTnk0OEdMMG4rQlVHR29xYTdN?=
 =?utf-8?B?cjc2K0FKbHdNd0Z6Sk5ERFUxeFR5ZUhLc01DYmt4K0RmYUNRVUNWQng0NXBI?=
 =?utf-8?B?dSthOGhuNWNWN0o0T2hSbUltY2JQOHdmcXAxWkJHVTE2SFhFdElJRFByN0Nw?=
 =?utf-8?B?b2M0T1RaTHZrclpwck1YL3REM3k5c1R4dVgyU2tvWmNuT2pyZzlyZ3J5NWcr?=
 =?utf-8?B?QmNoWDZyekJncnBZeUF2SHVncWxHTENGR0VCQUhrVzVXckRnOFg4aFBVUHJU?=
 =?utf-8?B?cTU1U0lac3ZOV1IySlZ0UDVEYkxIWTFPajR2MWJEQllUMXRWaDRXOStLQkNt?=
 =?utf-8?B?eXFjQ2ZlRTZHY3h5Q2ZhczE0aU80OUozd0JVQ0JESU5xUDJ4UHgzQXVoME5y?=
 =?utf-8?B?SEtkTCtLZWZaUUhsNGl2bUhiTEpQdFRLOCsrTGJYMmtDRlpSdWVUcCtvWG0y?=
 =?utf-8?B?ZlpUaWJEN1pCNHFWU2dtRS9tVjQ4WUMwc1VQVzlML2hodXlSM3c3dDl1OXdQ?=
 =?utf-8?B?WUZDNFBoSlA2NHRjRnlxVjdnUHBIeWhpVW5BRGVTMUJMRy9zMkhMbHIwK0ov?=
 =?utf-8?B?ZkY0em1EMHZ2L1JmbHhGOEpNaUJuaHBsNDJKcnRZMTJGbVEvNElqUm1SUDd4?=
 =?utf-8?B?bWZlRXdvQ1FRWGhKdkRSY3pRTkFHWmxSbUthWEdMNU4yUWMycnNtZTBUSUwv?=
 =?utf-8?B?elE4TGdCZE5SdmZ6dTF4K2VXTlBMQThLb0dMN21HMnQ4TGdlMUNKWWtHMkZT?=
 =?utf-8?B?ejFMMUU3SjRGQ1BSTlFpQWdIVUI4S25JY25manN3ckpFSDEwc2h5MU5xNnF3?=
 =?utf-8?B?Y2ZOODlaWjdRQ0ZuS0V0b0VtVTB4RVNuNGhKeEkrZnhZNkY4WmhCOEFuWkVY?=
 =?utf-8?B?RFN1ZllNYkdtRXhtWmdNOFYwL2pKTXlaM283bVhwSVFOUWZ3bXpEWDYwTzZL?=
 =?utf-8?B?TXZhYlV6V09KYldtcmowUWpHeGpUN2dDNmVOS0Q2eFR0WWUwSWdwT0hKUDNF?=
 =?utf-8?B?c29SYzRLTjY1SFBkRk9yMHU0RGxkKzdrOEk2RUl0UDZHSTUyemxMMktYc01F?=
 =?utf-8?B?a0l2WFBNMGlVaHEzMDJ5eW9odnBtdmdoaUEvZURLUUtJTGFJMjNpaW91cTk0?=
 =?utf-8?B?QnVDTFl2RG9YOEZLbXE5VzY2MTFobjhGV2JRK3lWR0xoVkxXbnZueG8rMzdZ?=
 =?utf-8?B?RzBPZUhpSFhHQnJpUkx2UGFwMmRJNnc1VFFkczI0MDByMERIUElXb2o5TkpQ?=
 =?utf-8?B?a1lvSG0vMnhlOGJjKytWbVNlTzNFcngwQnBuV0tZYWsvajFMTmo1MWdBUnBp?=
 =?utf-8?B?UG5SUTdETEZHSFJacC9oNCsyUEQ1T08yZDFZUkt0enlYOGVpRHRkUVlCSjRU?=
 =?utf-8?B?NlA0cDJoa1V3TXJtOXZTVFpYTXhHTURsd0tSaUFmR1JnRzI1WG1ZRTBRUTBr?=
 =?utf-8?B?WVQwNmx1NEMzTGtoVWZhLzVpVXFmOHUxdUg2VTdqYjRiWjB2NklvQTRnS2NN?=
 =?utf-8?Q?c4qcNABZGdOy2LsLA1zLyiZ53q6r4c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0RiaDNmLzBpUzNzdzZ3Zkp2Z3J6L0lFSm5TaUgvckZ4YTJXdGlvUUFCWTla?=
 =?utf-8?B?L0xVZzhvbFpGVnFNakhKYXJCUnRqSlBSdU95UEVybjlCN2pyQkRXdGFhTkFh?=
 =?utf-8?B?aVcwL29GSG80N0NPZDY4YWFFQTFKaWZXTWJGMlFoSTBLdXRDb1daUE9ESVlx?=
 =?utf-8?B?cld1empYdXhsV1c0QmxwalM4cVB2Zmh3NlYwSVhPVy9lNmR2bFBjMHlwR2xS?=
 =?utf-8?B?VVlxcm5KN3c0amhPZnBCeS9PeWpyeXhhbWFSL2grOFZqVnBqdmZNblloNHcz?=
 =?utf-8?B?enNjRE10VGl1bzEvbGVOWnRBNzEvY2NNUVpjNkI2MGJuTG5JcThob1RaNStW?=
 =?utf-8?B?ZTh2YS9QdWROTWxsQy9wa1FvWm81L2RqQXFtYk9QSGZYeXNWSGQzbzJNM1hR?=
 =?utf-8?B?VzdUSkYzQndjbnFrQW9NdDZYMjE3WUNUVmU3YTVUczVjL0dIRUluR1Ftb1Mw?=
 =?utf-8?B?VGtGQVdCL2VwRWQxSlNDRWZoMkJVY0lzRzZJbDl6b2o1Ny8zK1hEdXVDQTFw?=
 =?utf-8?B?N3lRNkxjWWVmU3llWEFtWVRsUDlGcTlReXg1eGhidEVUSlpXT2VkUmlWZ3oy?=
 =?utf-8?B?bFdsc3pHOTYzR0l3c05tc0hUS1lySFVVdnllYTRxV05oZjR2UHJnT0tSWWd3?=
 =?utf-8?B?RlkzSjNrMTYxN0dyT2ZCTW5QbkJNNGpoUlVJandDd0ZocStVaHRCYngxcXRE?=
 =?utf-8?B?cGRJandiS1BxaWxDallXVDdBTkRWZ3N2cUxrYjNVWTQ1Szh0cUxpRGdNNDg0?=
 =?utf-8?B?cndtWGZNUkhuWnhSSFBnZnNLY09TNjRNb1lLbjFpQkFLbTkyd01PQzFFK21T?=
 =?utf-8?B?dFRvdFgwQW9xN1lKakRYbzFxU054NmlGQWJWQlpzNXdsVkNyYzh0SFluNTBD?=
 =?utf-8?B?VXAveW9mMnNaUW9BVmlOZEk4dFNGUUN0aWExOERmcjVsYzdtcHYwRFdjcEht?=
 =?utf-8?B?RkhBSTlhcGdIeFIvcFpnVW5nYVVnZ1FDcStuaStCemhKSzdsS1Qxb09hNzlX?=
 =?utf-8?B?YzhoYm5UclVYNXFudm4vYy9jcUZkc0hzcFBMajh4eDNNdm55OTZrSHFmRWxF?=
 =?utf-8?B?MTR0aXlLcXYvRHh6a0ZjY2l3NU9YUDNPT2FIOVg2YWlGUWlCaGd4K3BtNlpU?=
 =?utf-8?B?M2xXcEpPYlJWUUt3MmtpZEVmUWRmUU5mN2huTjZCUTNUVXhSemU5a2M5QWkw?=
 =?utf-8?B?SnVJVE1uYjg2U2M0bElPUzhqNVdiWGIycS9CNXBySnlvTlNJSWY2Q3pFMUNw?=
 =?utf-8?B?S0NIMFovZWtPZC9XRHlzK2w1QVdWVnlFdWc2ZllTSGVmZEh6Y0pVckRhNEpS?=
 =?utf-8?B?M0lwLytXTjJ1YUFxdzdNR2RRKzIxNFVaendsRG9adUdCOWd4Rmh3R241Mkpm?=
 =?utf-8?B?Qzk4NjFPR1FMRzhjM0ZHRGFJclB5TEhWZ0l1eStMajVSSThPQlRKZTdCNFk2?=
 =?utf-8?B?K1QvcVd0QTJZc2pRK3VCbzNYL2R1TTZTbEtIN1pqRERESU1qbUNYVElodFkw?=
 =?utf-8?B?WWxPWGkwSGw4elFGWFdZZ3o2bnRVVDUxY21HNDlpdG15aGVWRTh1L0hMdzVS?=
 =?utf-8?B?OEk0ZnZ2ZmZ4M3h6M3oyQ1NxOW1NZ0RkNG9zcU1LTkJlWTRUZjdHNDlXODU4?=
 =?utf-8?B?QStJKzBJODlLTFVUdEpHZlh1L2xiaStTdFo0T2pUQmduU3VMRFYzWjJkQ2ht?=
 =?utf-8?B?NTZkUTcycENOcEx5aTJrOStxUnNJTHp1Uk1iVnJ5clBSMWVkaENRM1lMeU56?=
 =?utf-8?B?dGZRU0lCajhiMUpXeDBQNGZrUXhBbkphQ3FDSmZLdnJoMjZlMG96NlUzS0Zn?=
 =?utf-8?B?aVd2d0hZd3BWejh3QkVZYit6ZGoxTVdZdFRCQ00wYjZ4RmlweURVdUUvMHFq?=
 =?utf-8?B?TEZVUnBOYzRqYVdzUVpVZjJ5bE8yVDJ0Rk1MNUU4Uno0ekk3R21ERXRnV3BD?=
 =?utf-8?B?VUJ3UTNmMHlXVlBWWlFPYzFUbTlsMUNLalVsVDdBUjBiK1NIYWJUNlpHK3Rx?=
 =?utf-8?B?RWNZUTc0clYwemJ2ZG15QWpzdGYwRUxGaXNrQlIzRWdrK1BVeExkSFR5N25w?=
 =?utf-8?B?b3pDbFh5Y09DYnBjZFZ0dlMvVERsOVo0SzNBUXoxeHlBVTFESGhTUTVMTEJN?=
 =?utf-8?Q?I9lCk1v4mmQOYYK95zmxtaZwL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BB6D31E1241F14D9A93BFB0232A0B6C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2241b671-b91e-4329-f64e-08dda2f6705b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 23:29:08.6576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKF3v8RZFaIYyUlzphO+VosPHSg6weqrfySFofUsR9ZrRhl7+8CnEigHoZUqBdxRwfoHW333l3wz9MkhmNInUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDAwOjE1ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFR1ZSwgSnVuIDMsIDIwMjUgYXQgODoxNeKAr1BNIFRpbXVyIFRhYmkgPHR0YWJpQG52aWRp
YS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IElmIHRoZSBmdWxsIHBhdGggaXMgbm90IHRvbyBsb25n
IGZvciB5b3UsIHRoYXQncyBva2F5LsKgIEl0IGlzIHRvbyBsb25nIGZvciBtZSwgd2hpY2ggaXMg
d2h5IEkNCj4gPiB3cm90ZQ0KPiA+IHRoaXMgbWFjcm8uwqAgU28gaWYgZGJnISgpIHdlcmUgdG8g
dXNlIHNmaWxlISgpLCBpdCB3b3VsZCBsb29rIGxpa2UgdGhpczoNCj4gDQo+IFdoeSBpcyB0b28g
bG9uZyBmb3IgeW91PyBQbGVhc2UgZXhwbGFpbiB0aGUgdXNlIGNhc2UuwqANCg0KSSBkb24ndCBr
bm93IGhvdyBlbHNlIHRvIGV4cGxhaW4gaXQuICBJIHBlcnNvbmFsbHkgdGhpbmsgdGhhdCANCg0K
CWRyaXZlcnMvZ3B1L25vdmEtY29yZS9ncHUucnM6NjUgY2hpcHNldF9pZD0zIGJsYWJsYT0xNg0K
DQppcyB0b28gbG9uZywgYW5kIEkgd291bGQgcHJlZmVyDQoNCglncHU6NjUgY2hpcHNldF9pZD0z
IGJsYWJsYT0xNg0KDQpJIGRpZG4ndCB3YW50IHRvIGNoYW5nZSB0aGUgZXhpc3RpbmcgYmVoYXZp
b3Igb2YgYW55IG90aGVyIG1hY3JvIG9yIGZ1bmN0aW9uLiAgVGhpcyBpcyBteSBmaXJzdA0Kc2ln
bmlmaWNhbnQgcnVzdC1mb3ItbGludXggY29udHJpYnV0aW9uLCBhbmQgSSBkaWRuJ3Qgd2FudCB0
byBiZSBwcmVzdW1wdHVvdXMuDQoNCj4gRm9yIGluc3RhbmNlLCBpZg0KPiB5b3UgY29uc2lkZXIg
YGRiZyFgIG91dHB1dCBpcyB0b28gYmlnIGluIHNvbWUgY2FzZXMgKHNheSwgd2hlbiBuZXN0ZWQN
Cj4gaW4gYGRyaXZlcnMvLi4uLy4uLi8uLi5gKSwgdGhlbiBwZXJoYXBzIHdlIHdhbnQgdG8gbW9k
aWZ5IHRoYXQgb25lLg0KDQpXZSBjb3VsZCBkbyB0aGF0LCBidXQgaXQncyBub3QgbXkgZGVjaXNp
b24gdG8gbWFrZS4gIFNvbWUgcGVvcGxlIG1pZ2h0IGhhdmUgbXVsdGlwbGUgZmlsZXMgd2l0aCB0
aGUNCnNhbWUgYmFzZSBuYW1lLCBhbmQgd291bGQgZ2V0IGFubm95ZWQgaWYgc3VkZGVubHkgdGhl
aXIgZGVidWcgcHJpbnRzIGJlY2FtZSBhbWJpZ3VvdXMuDQoNCj4gQW5kIGlmIHRoZSB1c2UgY2Fz
ZSBpcyBzb21ldGhpbmcgdGVtcG9yYXJ5IHNpbWlsYXIgdG8gYGRiZyFgLCB0aGVuIHdlDQo+IHNo
b3VsZCBwcm9iYWJseSBwcm92aWRlIGEgZmFjaWxpdHkgdG8gaGVscCB3aXRoIHRoYXQsIHJhdGhl
ciB0aGFuDQo+IGFza2luZyBldmVyeW9uZSB0byB3cml0ZSBhbGwgdGhlIHRpbWUgYHByX2luZm8h
KCJ7fTp7fVxuIiwgc2ZpbGUhKCksDQo+IGxpbmUhKCkpO2AuDQoNCkkgY291bGQgYWRkIGEgc2Ri
ZyEoKSBpZiB5b3UgdGhpbmsgaXQgd291bGQgYmUgdXNlZnVsLg0KDQo+ID4gVGhhdCdzIHRoZSBi
ZWF1dHkgb2YgdGhpcyBtYWNybyAtLSBpdCBkb2Vzbid0IGdlbmVyYXRlIGFueSBjb2RlLsKgIE5v
dCByZWFsbHksIGF0IGxlYXN0LsKgIFRoZQ0KPiA+IGNvbXBpbGVyIGRldGVybWluZXMgYXQgY29t
cGlsZSB0aW1lIHRoZSBzbGljZSBpbnNpZGUgZmlsZSEoKSB0aGF0IHRoaXMgbWFjcm8gZ2VuZXJh
dGVzLCBzbyBhbGwNCj4gPiB0aGF0DQo+ID4gaGFwcGVucyBpcyB0aGUgY29tcGlsZXIgZW1pdHMg
aGFyZC1jb2RlZCBvZmZzZXRzIGludG8gdGhlIHN0cmluZyBsaXRlcmFsLg0KPiANCj4gSXQgZG9l
cyBnZW5lcmF0ZSBjb2RlIC0tIEkgYW0gbm90IHRhbGtpbmcgYWJvdXQgdGhlIGNvZGVnZW4vYXNz
ZW1ibHksDQo+IGJ1dCBhYm91dCB3aGF0IHRoZSBtYWNybyBnZW5lcmF0ZXMsIHdoaWNoIGlzIGNv
ZGUuDQoNCk9oLCBJIGRpZG4ndCB0aGluayB0aGF0IHdvdWxkIGJlIGEgcHJvYmxlbS4gIEkgd2ls
bCBtb3ZlIHRoZSBmdW5jdGlvbnMgb3V0c2lkZSB0aGUgbWFjcm8uDQo=
