Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B74175A87;
	Tue, 31 Mar 2026 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996371; cv=fail; b=gKfTqqsYRK34PfZ0WMTudUHMM9qtQstjYhAmCaXjtX0ugfuYVzNV/1F48hlc5GNgbQpDdG8i7RkfQyexvi+jzq7Emt7dhBQN5r+5OjVWQOA7iqGUXh3vVh842gzK65EQf2PJOwoiUgRnDcMqM2CvNH7aa8kZbMU/1Gc9nDP/cVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996371; c=relaxed/simple;
	bh=TbDbRdwf7vtlaAHzsMk78Ojvj5tuMyv0vEvQKY5zHSk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KHIcBTy6pEfizk3X9pcY9sN5VJu8fnTlW4PGgNtWDNzxybsVd6AL1CPgvJOt3Q0OiNbb38tDWJRJxrAKzNjXIhPHxaebETPB7FoRk7uDiCQi3SFm2JRYFG3SCl43CeAOsdiykcjZIeauUTLKoSvnncUaEIRlr23wAwwCg4/0wKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oOiMOOzT; arc=fail smtp.client-ip=52.101.62.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oOiMOOzT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGIMbG3WtZDWCE8neacBq1QyIDYql69dMUOllUAq9q/+Y2LPGiKFbXxXtVVKH/cCePSZcI+yzDm9EMtdQK+ozu12ubYjmfJUCEcUzYFlh1RHHzxkGmIiLcCeXVSRbt9Jh2mYwLUAgLD3+ibJ6pfmqgm2JnyXqA8JsPF1LCL7PnJTNXDxprHEEQVVzI5rRhWUcJAWjcsYRIDe60KUHPdL97dV7tQmfOW2Q8XCPSNz5bnbnv5WfFAZsFf5Kb78juds5TGZvsuNA+oOeycjo2Nz5aQ4pZq31QuEL1I2BQHynM3ZTMwbDPQbz9syk3GMNm7EJjwSPEKOVc3fkCqMwb17eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbDbRdwf7vtlaAHzsMk78Ojvj5tuMyv0vEvQKY5zHSk=;
 b=Rn9sRZk0KwQfnn0sHVUCGsuKDe4RghTG1f0/Ap071+e2rzf8aZZUaZ1uVV3czeneq595U+zvhc1Lh5zQ/LP5+T0DlvL611dqCFZwjc7/xVjAAjgE7xcowMmQ0RveA6Wf0Bw09UeT83eYStzD/GTothIldbaxzzEzkCZ4dkXgi4QF6R2ynesoUu6zqwyY9lHGEazFtHzOQNbQPw92iauG2V+IQEXochrwcLz+rES3RF+u+bSpTJopYEooKiRZAlXb28mYFR1j1IlBpxecVoVVVya8pwaGYgvtkSE35c4RrYuC7Ytb3O8IvYnzakYdumWOioaPQTPcKdrhoyHe0Xs6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbDbRdwf7vtlaAHzsMk78Ojvj5tuMyv0vEvQKY5zHSk=;
 b=oOiMOOzTH04ESg3SXDO6ZxUp666UVna5fmvgZR2KaG//0d9K+t9JAXOb8IToTWtH8mBhHEULuP2a8MLKw31fhdUvZ30HEdG0d2koL5bX/IDJyFIOobts1xT3gBik4xRGoYggNDhBrZ+xoqBZmClH1DNEyZ8Rh8K6K2pnk8pF1CWX4Ffhu3ibULXXp9FycvhPt3yOhn4kYfs+1/+zICifqLmDx+GGj9AUuMTqCRxUWUBb5SyJIYUfv4jZ4gdAnjXrBLap8R6euvALrtP0HLLK2Sol/IPdSrGFUbfN1wtzwMV4FFWopJgqC8I0130WDoS+gd8z0FsZ+NnjwECD291ZKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 22:32:45 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 22:32:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 07:32:42 +0900
Message-Id: <DHHBP3XDGWM1.A7H26YF6HX6R@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: bitfield: fix broken Default
 implementation
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-fix-bitfield-v1-1-ebe1a72b4fae@nvidia.com>
 <adae6d13-e70b-4377-a9fd-4bfc985e3d89@kernel.org>
 <a97a97fc-ef55-4eac-ac9b-dcd8c7903c66@nvidia.com>
In-Reply-To: <a97a97fc-ef55-4eac-ac9b-dcd8c7903c66@nvidia.com>
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509add5-c72b-4fe6-8859-08de8f756e20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4DRGrv55nV5+mX2/qpDeOHtsIVTlGLmayaJgqt4EblgMPGhen8hPc8sZJjHkQy1Wp2cRJkRb7okK6vIHPBjqrzOdafw7MB44UZeYopYA38I4A9lGYPcS3rrmSj1JMg0GFUzJZosDXwxbsFjKdC31Xm480223TL1PLW/S0IwBFYDQwlACZbPjJVvVd9+CZ3BO9mGSnK+/+F6v/X66LTDIcuO+ASRflBMpxgOxr0tK4ysS4kHXf0wuvNBbrZRdGdvCmkU51eDNNPLUV10gem2PLRqxtLK70INMypyQs+OILX64V/FxLv1qD5nSernq8oV5kZanZ+fN6RpR1/4TT5B3JTW8+WKgDNrz7OeJBkJ+LGs4gH/L1ScfbO0cl9enGFt4OCFXagsz0UGPf3gxF7KbjJc8O4UW8yf1eMhqRiJ0aAYXSTxULvh9t4J+28NzoXV3VPw0Anyy/c6rNA7bSb/nOkTt0dcMmiWI+mRsADK1Sdkx5N7pxz6g6XQEbOLSqdxzHuk5cNdzOqc7pscKQZhZYUkgqJcDo/+sDg2h5oVFoj3CBko7sV9xgenTXOijJmncZHQK94iRsrseZh9LwF7jtYg4zd7WvJF+NnbFWyuuNWtI3g4AX4i/pg6yGc16eSnffKCcP5USc90VPxROyVNkpxRdY/ti24DBgoqPZ1Qtw8bLvbF8ICZn2L7Q33D6Afo5BFa+eeetniycXKJLSaKyDJcGw5L3VhtjV0edivzcrPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkpaZmNCTXZOYUo3aEFUL1g3dndISVZBSkRHdVFmWUJLZzMvdkVjcmJVN2ZQ?=
 =?utf-8?B?Um1Da3Z6bGk3alJYSlBYdStHY3BraytFSkhQNWROWTlFYlJRM1l2cUpUYVM3?=
 =?utf-8?B?NWM2NG1uVFEvZHNac0ZxQnRaeW1nYWpUSG1mVEgvY0FmaENtUFF2SG54NTNZ?=
 =?utf-8?B?VHl6aWFQaUdoVTBDYVBlandOTjdqUVA2bGFGcVhJTHgvWExCTUdCa0h2enF6?=
 =?utf-8?B?NTBJWUlldjBkZ09td2NQNEo2WVRmQTU1ZnZGZHoxMlpRbGxJSitWK09SaDN6?=
 =?utf-8?B?OTZOZ1VUZ0N0VlFzMHNXczdmVmRqeCtKNU84aStwQTRlbFZxaDlIckE1Qm9y?=
 =?utf-8?B?Vmg0aHZBa2xWUFpwT3BGczhlZUxodDNVby9WbEtmVEMyWUNEcXdCcDg5ZEg0?=
 =?utf-8?B?bDhPbW5CcDA4UFNPK0lBcExZaFRVRUkzWURSY2Y4ak1VbW1TRlJRNEFQTnhi?=
 =?utf-8?B?d0EwMEZzRWtOc1VpcTFGMzZ5MUtTbDB3d24vZ3JwWGhJSzZ2Y25pK214U2Jm?=
 =?utf-8?B?SUlycUI2aURNbWcwOTdNdjd6QVhKZkRNb29pMHo4Q0hqTXB1UEF3akwwWThz?=
 =?utf-8?B?OWZQbDdacnlvN0IrUHViUkNvaytxdUF3QytWUU1BekVvczdSTG1lSDBSTlhG?=
 =?utf-8?B?dzZ2TFVjVmx3S3JLWW93UGJSWVBLdVhRRmcyNTR3djJ0SFd1Zko2dzUvMHVG?=
 =?utf-8?B?bzU0Mlgwd2dlTno1Ykhpd3dNNGk0UUQzOWt3SFZ0NytxaFY4QkxHOG54WHlk?=
 =?utf-8?B?M09pODQ4bkx1RUJOM01EdWdvaWpXWVF3L2w2c3lQS3hpVmFzRk5aU1ZKQkZG?=
 =?utf-8?B?SkdXajIzR2tLbUE2ZUNndE5JcWZhejQ0Tlh1RUEvRjhxMmo4ZlBhT0xabUtR?=
 =?utf-8?B?cEZkc1RUeDBIU3N4RWdQUVFyaEd5SW1IODdXZXhFV0ZLRW9WamptQ3A0QlhL?=
 =?utf-8?B?Qmg3cGxkWmlMVTZ6NUQrZmVXblllWGNPeHBMVUg4WlQxSEh4L09NbU9xVk1z?=
 =?utf-8?B?OE5jWWV5RkxrWm9tSTdnZ2dIaTlKd3FNaUF5QTR5SUJsUHd5Y1Fxcko0a0lS?=
 =?utf-8?B?K1Y3Zk5SeDZQQ0ljT0RpQ2pVZThzMlI5bDBJTkY5OStXOWxrTUxCeTZCWUdH?=
 =?utf-8?B?ZFpRZDl2RHRpQWVIUkF2T0VZQWhKcGtEQXdZREgwUVhRRHFkK1AxSUtrWFZa?=
 =?utf-8?B?NmpCZGkzbUFyVUNxS0FwOEN3azUzV3I4MTNVNytaQUxmeTN6ejJCVkh6emU1?=
 =?utf-8?B?RUE1a2t4U1NGQUZpeVhKRFlva2xmalM5QTRQYUJQTENkaWFVajNJdlN3bitM?=
 =?utf-8?B?enlwQ3dvcTNoU3FYdmY3SkgwTzYwMnZMZkJpWEc4cHdodFVhMm1sWGdyVnZV?=
 =?utf-8?B?YUFvbWZZT2FLdTlJUkUzcUVtNXFUQUM1a1pBYUdXU0s2YTVicE1tZ0NWVEZR?=
 =?utf-8?B?Q3pYVSs3bXVIdnYvOXFCc1gxTFBPS3VWbUtwNlNNZ3FzbzduWk9VdHFJNngr?=
 =?utf-8?B?NHpqc2tNTDBZall6TFF4emxMay9WQlF0UUdmS0g3cXZKNU5DQzNHV083aTM3?=
 =?utf-8?B?UVBEQm5OakZjWVFRMk1CRzZ0dmozVm9TNzRtT3JLTXNQdFNMa3JrbTkxWStU?=
 =?utf-8?B?RVlEQXRmS3ROWVJEMktUaGMrTnVTS3FUZW1DblljY2xOY0I5TzZUallBZGFo?=
 =?utf-8?B?N2pIWlRRR0ZRVDhEeU16ZktVRFRERUpFU0k2ZnlONnNKRWJRc1BNQjUxL1RU?=
 =?utf-8?B?MWxDZ1BVVTk4VGY3YnRocnBKdHE3TUl0V2JPWTlCUXU2Z0VkbUpwMnAwRTY1?=
 =?utf-8?B?UittM3R0V1o1NlhPQ1NDK0JwQ0NsbXdvRnFjQ2FRQWZhaWNic21EaExybVY2?=
 =?utf-8?B?UDVzTGszQzdGc0JSbDNiWmI0K3c4aFRIYzVOY25xbW9JaGxTTU1ualFmemRX?=
 =?utf-8?B?U0pPaWtYaEpkV3NvY1pDQ3lyMm9BZ3ArOTRXRHBmVTVrZ25aYUZlYU5SbUxw?=
 =?utf-8?B?UWV0QjIvb1V1NGduZ05vdngvbmF1OXBrdGx0WWNVdkk4bUM5SHZNck1sVHVQ?=
 =?utf-8?B?d3FDYldoUVB2UTFiSWRhNXR4S0RwZnhIWWhCMFozQXZSM1Rwc1V1MDVBRmFR?=
 =?utf-8?B?RlhLSWlLcU9jNkVXRGg1Zm5CL1c4S2k4dGw4aDAwd2w0Sjh1c21FVVFaYlNQ?=
 =?utf-8?B?eXVzZnBzUmRNZGZmSm9sWkVDYTY0cFc2bnZNN1lwZnllS1dvVWFJS3hZRzVX?=
 =?utf-8?B?b1JzRklpR05TTFk1MzJSMS9YaHg0ZldzcXdNa1ExdlBjTC9id1FBL0M2dEVB?=
 =?utf-8?B?K1YzNmhLY2MyemJrNmlMczVZVU9sWmVvazBsMFc1K3ZtcEttaERZQytRTTJG?=
 =?utf-8?Q?D5EQhU/uN28ryJzTYIJfxOODEXFaU7veODxE/ncAAivCY?=
X-MS-Exchange-AntiSpam-MessageData-1: bGVWz0qIsRgadg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509add5-c72b-4fe6-8859-08de8f756e20
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:32:45.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O4cZDsV3NzEmtN2W9zak8MyvRd38Uy2Fi/TOaLWeThruXC1fK/bl2O//WUd1qZS4gewae8wwd6M9HI3L3BT+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060

On Wed Apr 1, 2026 at 5:53 AM JST, John Hubbard wrote:
> On 3/31/26 6:36 AM, Danilo Krummrich wrote:
>> On 3/31/26 9:56 AM, Eliot Courtney wrote:
>>> The current implementation does not actually set the default values for
>>> the fields in the bitfield. Set it and add a test.
>>>
>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>=20
>> Thanks for the fix!
>>=20
>> Please add a Fixes: tag and separate the fix from the newly introduced K=
unit test.
>>=20
>> Maybe it is not worth adding the Kunit test in here as generic bitfields=
 are
>> being worked on, but I don't mind.
>>=20
>
> If there is a chance that we won't need the Kunit test eventually,
> then please either delete it here, or add a TODO to delete it
> when generic bitfields cover this.
>
> (Kunit, like any other test suite, is easy to add to, but also easy
> to avoid pruning--and so over time it risks being full of tests
> that are redundant or no longer needed.)
>
> thanks,

I think this entire file will be deleted so it'll be gone regardless.
I think we can skip it, just wrote it to test my change locally anyway.
