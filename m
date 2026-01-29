Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16F2FFDF7;
	Thu, 29 Jan 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693545; cv=fail; b=A05I9kG1QYWWGbuc2fxF9YXMr/duSCXZcDCU5BHSXTs5M0A15AcgtppgEfY9bX+oSvJ1Sf6IHtvfH4uQQeki+PUch19y6pqKQs4G5HV31tCM4Hbc8tq86FzY4atvagVEYWFsbMdq+FdwXbcvfTVbXhKYf3313+JYoQBqWHHXyXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693545; c=relaxed/simple;
	bh=X4lDluXAUVw2Jbvj0d4PEL7Nz0HYbGEfpGwR91vlZEM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zp5RBu1FHs0EPeP21WqYY+u1fRCUInQxr21IKqR8ttEk3OMFJIMmAyYEJ3zxAAhUKNWhfSixeES1YW5bl84LAyjbXoa9qeEjTdGqQgVxwdq4UcjyKL60p7UceXjfMZrfUhs7mab3miFSxuPsuNrdaTza/YCW/zJBC/zprXp6ptc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d2XFCggs; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d2XFCggs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeDre/0GBq0ljJuQSsEPoi8OMzelTVv9CdfY/263BX8PtgnJydddhZpoqy4KERz8slBjZkpE1cr2STRdP7S25xsjKXLDV1xaWmLkx2GJQqWUCukMXaTRm6Ve4gAHWtJqwE/FIRGFFeavFLRb8d71MBdX3bjhLqsuemZav6syyS9IVAIDl2yskrP388gl2gZn7Dy9H/I+Re5vVoPfDw9uMnecIDVsH1C8Mm4LPOl+pbcGVRgIBu5+sIFRRIvH2LC/cUI6735XLGLa2UNQpthNnjCVq5iQVnc+mbbm1fwVm9U1fQdkm5AGtd2g3Kt7FnLJA3O1DuRyyq9fZcdkckiWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSfvAxLz+4SDIFzSHfVLJiFUaRGC75c5uP82GVaXaRI=;
 b=tF4Dv14QeTk6cfVVrVAx1HCjOJTQUtO3tlA6prdEAmHA9g+Exiq5Px9zuivS6hwP1w2Y6rnHkZj/N4OuQosqCgrrhqvWbtQodLAilgZ4lcMfOWEKqK4QMDnr8Si4YZZr1ep8//OwoTD4d2ydbogMezUBRzvgu7eXkGLP+bmnUHsIbve2JfGk3cMQGAz2gTzq7A6k6YlJbT6rpQj03UiKg2KVA3/tK3PVRItnDE7agpJgqzGs5zOsIf6fvasovdnRRtN5b+vgBz6LMOwwj4YHTnezOnGncbvq96Fa3ahqb/3tMM2pBajx3z3Lgtto6afsQuoQaxaIPX/s8iFK+PgRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSfvAxLz+4SDIFzSHfVLJiFUaRGC75c5uP82GVaXaRI=;
 b=d2XFCggsKDsB3NJkSBr9UZsn4mXjninRyc7YJzaK5OoUVXVVNmJJ6ckXBKFtZStzpzZtAEOSo1UWr/8oWGihwFiqoeRVa7wh6R5tHFlgrWl7EQBbcAOHGz/OzHB+SolkAA9c7aGIp7TyftHOykEvggk3IdOQFEu/8FkB7ws1y4LavP6JNLRdyI/3LoTEQjA7RQn2xmGmYgIjr0wycQhAzp+tPMdemdnTp2K08M3r8z9SCmlN71jMsaY37u+HuWke2wQ+MFGxlZTfMgQAc53FhUL3KUZz8I9DvxEHorjSgNkPCt/kAPPnDZ5FgO8jHoxwhhOEWEX/eCSQiU1oITeumw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 13:32:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:01 +0900
Subject: [PATCH v5 1/7] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-1-c4587c902514@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-0-c4587c902514@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 37416b9b-480e-41d3-5bc9-08de5f3ad168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjlOSEwvNTFTd1AyUGpyRDZ3cXpQZks0Y0paa2VCWEl6UVhRSE5acnlnekps?=
 =?utf-8?B?ODRKdHNCdS9rY0s0cDZiQ01BcG4wS0VWVDhubU4vaHplRGZhUndqZ3NPRHNJ?=
 =?utf-8?B?UWRlMjNwalRsc2VDcFFqSzMrQlpUdmxZMDhFWktMUTUyclZDcXZNOGh3NFgv?=
 =?utf-8?B?YlBRUTJVeWx5Q29kbTZ0a2lhZDNndkdzOFpWUXdXd1pKemRORFZYTmtaUTRE?=
 =?utf-8?B?aWs4S0lRUE1FWEI1OFg2cXRxK1A0bUhPQlY0cHZsWXIvTXR6SVl3V0pjYXNI?=
 =?utf-8?B?VS80WmEyK082U3BtRFlvWG5PdUFFNFpOOGFhdW9UVTE4WktzaGY1ZGo5NXIy?=
 =?utf-8?B?QlhaUDFJd1pDWmF5a25yVEI4cWlJallLWlF0WmhwYWxOaEVYNXd1QzVvbTU5?=
 =?utf-8?B?WTcwOG9ZT2xVQnFxaWVtQmlFcGFRTHo0djh6cFl5bDJDelVELzZYcEpmV1ky?=
 =?utf-8?B?K1lubE1sVmlMZXp6dTYyeFF0WlN3RWpHT3MyNnJ4VFlET3cwdUsybHJkZWd0?=
 =?utf-8?B?TkNVSTlkYjRoQ1k0UE5ZY1pVSCt0RWFXTUNOdUNZY2tGcEMraUNUOXltSjhn?=
 =?utf-8?B?T0lhWHVoWFdhVm5MZzBKWjRZY1ZDbTZtcW5mSU4weFBhaVMxYnJWSlVUZS9U?=
 =?utf-8?B?bjR4cW1GL1dUdDBvTjQzR3BsdFNIaGg2OGJ0bE42S0NYOVVuWnJJM0NoR25O?=
 =?utf-8?B?dkQ1WXVZN1d0VjhpMTFTMW01Q2xlSHNUTGZ1cnJBc1ZmZlNDclFNa3pLVE9Z?=
 =?utf-8?B?NFhCQi95aU9hakNuNk9DMXJkK29MZmhTa0haL21wZHg5VXBITndNc1BBWXp4?=
 =?utf-8?B?NVl6MmJudGFOQzA0L0xhU1kveGxRTTk5ZFBoZWlieEFOSHVCWnRLVUUzTkZT?=
 =?utf-8?B?Z2cvT2RzTndyVjZJUDN1SDN3M1NVZUd2UVJqOTZtdlJER2RhY05oWnlDcjd5?=
 =?utf-8?B?dDV4MDhCT04vN1BNQ2ozdVErNXdTNXdRN3ZsZTg3bHQwQmovSmRvR1Z0d29o?=
 =?utf-8?B?SUg2WWRoRXNoUVZJLzg1WElKc0pGL0I0ZG1hTTdnMXlUYnkzODMvM3M0dlJy?=
 =?utf-8?B?aU02RWdaWXVyUS8xeXBSa0dRR3NzalppY2V0Zm1aSk11dm1UWEpIVWZvV0VO?=
 =?utf-8?B?K2JUNGpPRXZZSms2ckxYeDRqYUk4dnlZYTlCTHhvbjB0YWtmNVdCMmlWYmpE?=
 =?utf-8?B?dDlwVEFxN0haeFRkdjlJWXhmZGpLeDRlcmlQb2tlQktVeDBkL1BHQ1pvV2NM?=
 =?utf-8?B?R3I3ZU02RlZQZUtmc3IxWGhkTzhYVS92YWFNTHp1S0tzU0p0dGlJRUNKSlZk?=
 =?utf-8?B?MWJ4VzZobCtudVhCdFVvWmkrMDhwaW45U01sNWxZMk9GSkVUNUV6MWs4K2tY?=
 =?utf-8?B?bUwrWUE2cysxM0NjQkJlNWxZNzhOTTNSb3doSGNYMDgycm5tcndaakh2aURz?=
 =?utf-8?B?Ly8zU3VpR0dJWEpDNG5STlJ0THZYTitKV2lGcm5aUDdPR2N0VXkyaWxpL0I0?=
 =?utf-8?B?ZWFPN0tnZnkxZEVXRkthNUp6Ylp1SXdmMWFFcEtqbTc1Z3ptODJoSmJOWHVm?=
 =?utf-8?B?OW80UmFBeGh6SGpZakJsOVlSc2lVVEVlSmlrOW5sMzEvbVJKWEY1OWNwYjlp?=
 =?utf-8?B?S1k5ZVQxOEZ2ZE9Qd1NDRnVVZjNTRTcxVXpBUGlrYU16aXhiVTgvQ29jVTl3?=
 =?utf-8?B?ZUVMbGxNT0tzTXFPOU9RcDBZdERUSHFqZlcwYS9RU05VYVFybHdkSC9jWDR0?=
 =?utf-8?B?QTFQZTFoaFppci9ONmtVNW1laVErNUc3QUlIYWxwRkJERis4dVd1VmVEZWRm?=
 =?utf-8?B?dnNBN3BUNXVVNXhyNVpUYVpFdU5NVU45VWNscUpmVzdZRkw4ME5BNDllc25N?=
 =?utf-8?B?UWtWRk4rMVRkYU5MUGw5STk3VnJ6cjJUN3EvcVNqTVJtY29qN0VNM0ZmWm41?=
 =?utf-8?B?Y1cvSWY1c3YwVk42Z0ExMCtaOTBibHZxcnJrOFlZT09CY3JOMjBmeHRQa3Rv?=
 =?utf-8?B?Ti9XYWpTdW5KaUk0cm9mUG4zZE8wSkdQSkVOTlFoMXlnOGErVlFGdFlZaHBj?=
 =?utf-8?B?STBvem9udTNUT3JsR3V1UUd1Z2lMdSsxYy9XUkIzODdXTy9taXE5VmhyU21N?=
 =?utf-8?B?dHhvdmh4dGZWbG5RbUY3S1lsVEcySno4RW5idmNrSlFEODJoVUdBTlZ5cjkx?=
 =?utf-8?B?dGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUdJcDBPUGNaWWwwTzg0MUFZQlQ5Q3B1eU05Z1hyamdwT1cydExNaThRQjdp?=
 =?utf-8?B?bWJvcFFRN0ZBK2J5TDdsVU1ZNVo5QUpYc000MTdFbVZkangzbEpBbFdVYWdU?=
 =?utf-8?B?TlhoZlFtQjJuY0xuNzJPVUt6VEpqTFhYcE1mVDhwcGZDL3MrL1hZeFZhWmhu?=
 =?utf-8?B?QlQrQTduMmdlWUh6RGg1cS9UMGdENWptYXhRNXRodlRyOXQ5aFhzOHJ2dmFI?=
 =?utf-8?B?MFhKZVBmd3hKNGRZUWtjTmJEN09heElMNm1UakVDZzE2b3BiSUYzS1lhOHNw?=
 =?utf-8?B?dFlLcUhnMS85MXNhUEk1RWF0R3Y4djNXbHNISlFNNTV4aXArR0JIbHl4bGRJ?=
 =?utf-8?B?Q3NOSGxGbzRkb3dzOVc1aThFN0dhN29XUUtPTjFuK05uODlRTWUyTFFxMnZl?=
 =?utf-8?B?Vkhaa3VKRzZlZG94aHVmaGYrd25waUFUZGhDNkx0dmw4dm52ZnJmQTI3T3Jo?=
 =?utf-8?B?T3NXdzI0SUpYcmdZYzFydldQOTI1NkxnOWFIeWFVZXVYNTdXSE1xU3VMTURS?=
 =?utf-8?B?dGVqRTlHcE5wcHRlUm41bm5EY1RrbUw4UU9OaDMrK1kyUk92bHNZWlcrdXZk?=
 =?utf-8?B?WkUyai9Gbk93aE9WYmxPb0FrUGJEVUJLbC83cGppT2tKVVpGa21Kd21FcUE2?=
 =?utf-8?B?SXY4SktHK2hPVE9yVG9VMmxUL3g5dWJSVlgxVlNFdGdkR2JZNVVMRXJQZFRr?=
 =?utf-8?B?TXVmMTVhbWMwdnNsUWJuMkRUTWJueFc5TkNSUTljZDJEcHJZaDFwYnJoWlFC?=
 =?utf-8?B?MWdNcXRQYTZaa1oyZTZCajFhRFp5cnRzZEVXZTB6bE9FeWQvbjJ1UC9NMDBW?=
 =?utf-8?B?aDFOQ0FwRFo4VFFNazNWYVExcnliNXhLQ2dHck43NmZFZU1abll4Szh4MGZa?=
 =?utf-8?B?R3pXUEhmRlZrOWdYSllZR2ZuTVR3VFBkYncyKzRWNG0xZUNtSHh0RmxRa2NN?=
 =?utf-8?B?MVAwdi9vQ0JHUVc1OFlVM3VmSTR3aWxTVEZ4bzhXdzREeFdTbjIyaU8yU2xH?=
 =?utf-8?B?Y2FJRkRDNEc4OTRramNoUHAxbWEwcURFaXh5dnR3dlVyOUkzSkhLbjNXRjlB?=
 =?utf-8?B?bk1POElYQnN0TmczUVJCZEdwM0EwcUlGcC8vdDBId0JoQmpONnEzWDYzMnh0?=
 =?utf-8?B?eWFaMm8wTTcvTmxjK2VmNHBNNzhnUFlRQlZ2Zmo1dkdHcnJmNW53TDh0Vyty?=
 =?utf-8?B?a3lHbVA2aXFxVHdsRC83M2dNb0M1Tkl3TGY2OWlSc25nb01rMXRDa2I4YTl4?=
 =?utf-8?B?UGtlWVVQTEV1YTlpYys2elJtNnRZSnUxUDJGd3RKMnJUdmZ1WlgxL1JEaWNS?=
 =?utf-8?B?M1RzZDRnT0crV3MydTIyZXJPYmNGWFd0L3pZZnRXUkJpQms1dlJSWlJJNUsw?=
 =?utf-8?B?Z2NQVzJKSFNoMXFUL0RBVmpscFBPMVYyOUp3dmJaSkF5WWV0VGptSWh5WUdl?=
 =?utf-8?B?V2toQ2R1RHFVZFZVNXllbThpaTlQV0V1ZjB2b3U4Sk9kUTlDWmpvYzBFQ2ZL?=
 =?utf-8?B?T3Z4QVkvcEl1YkNCUUkvWWZsaGZuaEFlUncyMWp4NFVwTUFIN095U0JUdUFK?=
 =?utf-8?B?TDN2MUZpU0h5Y0dkcS9wK2VUSjRWTDZuVkJqWkw0OHFkUG1wTVVmYnVjcnRx?=
 =?utf-8?B?djc2RXl2bmYyQXdyc0hCMDBlWGQvQ0xpZUhHclY5V3M1cUdVSnJDQitXMjUy?=
 =?utf-8?B?YjlTd1NtNk5jTWdaNUhNTWdDWHFKZyttdmlhTW1Nczh6b0wxT1k1SUVLaGsr?=
 =?utf-8?B?SXQwUm8xeWk2Snl4WUxiQmJUZ1d5dWIyM0xvWW94UnFpVGgxSVU1RE95MS9R?=
 =?utf-8?B?aHFOeDZDRWMwUVN3RERRTzNsS1RCQWZ2QUxZSGFlM2VqNnRsMUVxZG12TUhk?=
 =?utf-8?B?czBJSHczUTNRZ1JINUJWclFHNUk5MXJ3V2RyU2t6R2JnbkpNbURPRVNUTnNS?=
 =?utf-8?B?dDhvWVVlNTh5NnZkSm9EdWRWTS9Ycm9GYzRJVGorTnRuYWRMWDRqTUxSaGQw?=
 =?utf-8?B?WTlPQUdGMFUzYVl0Tmd6K1Fhd2JFb3NBME1ScWlZRWxBck9lV2x6dGF5TXFJ?=
 =?utf-8?B?SmxMRW91elpJWnh6UlR3L3BldlJkcDV5WkJZMmtPbWplL1VRdWlOVzRDRk1H?=
 =?utf-8?B?S2V4SGxSUTdUQnpTVTJzeDhPd2cwZXVoTTY0QWV3VElyd3ZDdFBrejhXa3Jj?=
 =?utf-8?B?bEhuam1aMm45Z1JyTXZzYngrS2N5YXpsQkZqdmRxeHFLRzdNT25PeDh2ZDZC?=
 =?utf-8?B?MTQxbElIRDNhaExsd3ozZXZoV2ZneW83OFMreEw1RmdhYjZFQVBMUlhqY1Bx?=
 =?utf-8?B?aEZONGluVjRjSjZUUXVmVkI5bE9TRXhzNm9HSWNWQ2tWQWI5c0Iyd1g2NEdY?=
 =?utf-8?Q?ek9HOICgI2PEVarQsebOVn5en4UdCssFTgaYE81VPWlpq?=
X-MS-Exchange-AntiSpam-MessageData-1: dKHlKK0EvNXkuQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37416b9b-480e-41d3-5bc9-08de5f3ad168
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:16.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4da8Celq3B8QR98rowO6Vcbe6WJcj3BT3yL5V4+n3KtqHArjBgbBm73LE8pwkwZIcj00XuAY1Jp7KYlqTPByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

This feature is stable since 1.89, and used in subsequent patches.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b..122ad64880cd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5037f4715d74..4637aa11e870 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -312,12 +312,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.52.0

