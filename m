Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D582F360A;
	Thu, 29 Jan 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693551; cv=fail; b=NIw/OTLCA+wjB29K0Qw39B1r8rU2DfNh5WF3ezcI0BsUSHcuDgeSBT6D1sASWZl9StjxY35iHF2Q3CBM06x+rgQbBJdUZj1UB4AvyE/Xdd6CQstz7FNLrfZ+qFpY/SZZ9fO6s9jM914Si4H5o0nomUwg+FQ0JbN9mNAIx4d9ZPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693551; c=relaxed/simple;
	bh=ZhioN8KBZT/wvf75jeqP8lquVwLRvcEAC56oZUbOobc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tlTcj3Ewp6UqVF0PyOO2cC8TjQuNJvjygQWp48VZuWy1KXrsiMwhhBW2K4fE4eP8c/7hXiofRPqrKUd4r0KRrw0oByDxaIIR1rpSyPN3Wxd5EOQLf1MoxhC3UiAeNc2kf33g3FMvEBtRN8++e0gs1mRBSk9Zr4bxhAV3DXyofpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AKZwbN/a; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AKZwbN/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTxHg6cJoAAHq//i8moT+ZVL3kdAuOXUu8egqQIasoOGoLAlvfJ7ZiEhuMcuEg1g3b8uOyLKVPqb96ucY24hgzHd3miwTL3H21k/jGFJ1eW/OGRScVIlG4drX4JjV31v3QDt4ClRwhS3WrZXP4yIK3jrt+rmvz7X9RY3Gs8QxOAsI4HRu6RhniizILmJAS+8TVSKECSbUbUbKb6p0spgPnNLsbodzQEDTFtG82ceUdi24XD05fi+9NVsQnknI0PYB3IuE3u/UsucrWW0NiENb+sO6+sc6BR8GyBrcfw40ykAAkVoT/kWrwfXsioOmx5V+hOFseoit4gmn8xCuBXh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wpwz2N1ah5rqXmin1HxtL8btAVChqiLbdKUlvOyXBsA=;
 b=sE1LcXyabD5GL4owjkxS7J2IhQdnCftoN66ydejejQ+y7FHtZM/7b47ce5uqRCwp9PKtb2xDNyhngn63IAFor8vjiZwkV5Po2MSsX5KbAeYOPk+mqz6Tw8+eWUgHpWWQfuuS9WHZfnUSRhQ0lhwcFpp5NXXX/xizFs6OC+fiqlQvjcpNaxNbBHfoB4xvOMZoTUicH2MSGlVp9gk0YCmwRcew14tqny9c5SKZrtIXKgNoivZpd9A61Ix9/I9sjhE5g8CeDNEMLI88uI8UdHkivyBh0+c9PpH77mD0A8+PS5HpNiSC6Jp8axIfYRxnyyRSdJPKN4II6GdJ9v8bPP94eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wpwz2N1ah5rqXmin1HxtL8btAVChqiLbdKUlvOyXBsA=;
 b=AKZwbN/aLr2uEg7BEnkDTLqnJcoYxsQIMOycGZpElLr1EB+BTJ/Pd4JWUgePdEEFspe9AsNCjoCiHtHoxlgctlygmifJ1nEoBi6l1lVS8ySrU2A0NWsoAxp5XdJUZ7yQ+jTG2LyTCogM03OGCxd0w/GWn2uzJJ5XdiRfFntwZNXpU+fHvaCmESJ6qFvQHN5x3g+/JXNksJbosZ4hp6eygI15czxvuM3Y6lHGyVxmf6oWkBMN581NKhcsAy7tQtp2pbs0i1/GfHPLaSu8FM8k3f2TwW5gVElwnFA+FOThhSFZ54U4GakJ5s0jcAYnD/c6HdnYGBRVypkJmT/7OBgDJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 13:32:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:02 +0900
Subject: [PATCH v5 2/7] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-2-c4587c902514@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 497ad24f-8eb1-4bbe-049e-08de5f3ad3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlMwSVhNemd3WkJJZXNnM2xCSUNmS1MvenAxQ0Q2bVlxZEdJMWxoai8zbjVq?=
 =?utf-8?B?bFdjOXJRdjg5MWxCejk2TzhUeWVQWWxmMXlDMVhOcWVXK2Jac0dwdFRWVmVn?=
 =?utf-8?B?aml2THExbDZqaXRtS3NaYTZmUHJqR1VtMVFmakcxR3Y3MEQ1MXdycjVzL2E0?=
 =?utf-8?B?MWpFZTM0MlJpQWpkRGEzcmJJNVphRWJoZjZ6d01PSW5pUmFmcm03citqcnJ0?=
 =?utf-8?B?eVRsazhMejIxQmlzM1l6OTRaQzJPMHNxWm5ldm1vTStiYm5ETjk3a1BFcDdG?=
 =?utf-8?B?c1VOZ3JraGREc0M3cGg4QmIzQkdzN21UYURVWFdXWGJFejdiNDdJUUQzeTJL?=
 =?utf-8?B?c0JmY0UyQStuK1o4cTRWYndpcm45ZTA0cTJ2czRXcWUzcFN5T0wvbU96Uzh2?=
 =?utf-8?B?RVU4QVNNMENDRktDNGlrTXJaNGVTRE1VNXJFM0hNbk16a29LQkEyMFJaYUZr?=
 =?utf-8?B?bkFUelpNZklzN1RrekNkTVBPeUQyS0dLT2orWFMwMjdKOXNCRGwvZ3FWYjVN?=
 =?utf-8?B?dVhzSzFmalZLNTdqbVFmaURiQXZLQVQwdFdKWmUrM01LNS84NjZjNmtBQVBC?=
 =?utf-8?B?RVpQS1VmM3YwakIvcmFKVmhFQVdMSzZUekhZOWdMWGxOQ2hZUUtxZnB2YXAw?=
 =?utf-8?B?UjB6d1cwWnhXWTJCM3NkWGszbU5zaUJvbVlMeDJZU3M0Um9qRXVDRUV0ZUJz?=
 =?utf-8?B?dUZWY25vcURsWUlHMzVSTmZrNUlPVWFXVlRFT3UvQXdRcFJxL2s2eVpWQW4x?=
 =?utf-8?B?VzlvNG1YWS9SZU5MQkNOWC9TTEpQT3d5aVZkNnJhMXd1aTkxRi9JZ3JWQTZR?=
 =?utf-8?B?ZW80NnFhaGhlay9tMHdjbVVjdnF4TWI1UGNJL1RXUWhGWEVDOUs2V2crL3ds?=
 =?utf-8?B?SVJ4bmJ0M2VtTDFiR0k1Qmk0azB3M0x4c2t3TVRObnpFTmxpODNTUUYxVmRY?=
 =?utf-8?B?cGZES0xONXB4dUk4WW1kMjE5NXp4WU9ZZEpFWlVZUzZyaHdjeTFZWjJubE9a?=
 =?utf-8?B?UmhEdWJFR3JaVHhoa2JWdzNQOUJTUENNdktUWEVMS1pGTzQwVXVSbGs0LzVi?=
 =?utf-8?B?OVFZTE5DeUEzRnVEZHFmZ0ZYa29MYnFycnQrQ2k0TlU1T0RjcVd0ZkFDUTg5?=
 =?utf-8?B?YTgrOXRWNVhCcVBQV2dTS3BkK3pWTnFGdFp5RGdaeURjRUNNc28zRlFZS29o?=
 =?utf-8?B?YjFuNUNiSkR6dWw2MU55SGNheHR6b1BsT1N5bkpWY2xONDRhV080SmorVHJl?=
 =?utf-8?B?b0NWWU16V2E0M2hBT2JaQnRodXJNSFFYaWw5dDQ5bU5DRmVIWi9Va0NtSnAw?=
 =?utf-8?B?b1B6VG05MjFINmU3YzdvYkV4MHpBZDRkbitsSURPeWxSQjhtOC9zNm5DUDd2?=
 =?utf-8?B?T3ZwM0kwUC9OTkZ3ZTJWU2k0WEMxaGs2ZWJWOXgzeGZOVUprZHJXVGxoUlVC?=
 =?utf-8?B?dk8rY1ZtNi80NDJaVWhEcVdzMW5aeURZU0RiamZ5OHM1WEdTNFFmZEFldCtp?=
 =?utf-8?B?cStPeXpMSDYwV1NiWmcxU1JGR1l3d05GNTQrQTdieVdzdEZ0bE1nSGtrbU5C?=
 =?utf-8?B?aHl0YU1DdUQvcXBQT0dIeFlsb0oyNGw2R3E3RjljSDZ5blNENjBBdkpaRWox?=
 =?utf-8?B?Njg5UTRtWmZuZkx3M1BWVWFWOW5JWUowNG1tSXVLeU00Mnp3WkEzSnR1RVl6?=
 =?utf-8?B?ek5ScVpvTkR2bE9RS1BMSEo4dGVZM2NyZlVkYVlYNnZ2STNkRTh6bkh6VEgy?=
 =?utf-8?B?RmhtY215VE1BTnQrSWlQVVBFcU9ib1M1OFljKzVZdXJyZWxocWpQM29qVk1M?=
 =?utf-8?B?YXIrSlk3MHJJaGNWSThDM2x2dFg1VWpUbEVDVldndEVIbFZ5NHh5dStzOUtH?=
 =?utf-8?B?Ykx5T2RYc1JDaVo2MXVtMVFsYjNEbjdvQlBMTzNVcnhWc3RrYmFORmpPOHlK?=
 =?utf-8?B?eFEvUi9aSW94blFkakZ3cE56M3IyVkw4ck9jN0Y0dyttZ2dNTVg2VU9YWUJL?=
 =?utf-8?B?enc0S201SWxnc3JOeHVHL1V6NzNNQkV6Mms5VVIwYlVKNnFDeFI1N05yUThJ?=
 =?utf-8?B?MzN0Ni9GK1VBY2hpcjhEWmV2cGNySE1NRUlXUmVMTUU1QlZRRFdEU0xvWFhM?=
 =?utf-8?B?dEZoSGxrR2xqQjFPUEE3eWYrWDRHT3Npejh0UDJKSDE1VDlPSWI3NEEwQmpZ?=
 =?utf-8?B?QVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFVWaFBGanV0MEpQNFp5M3NpcUhlZjNsSXlmZm4rQjNDQ0NJZUg2R05oWHJX?=
 =?utf-8?B?TTJZdEhERUJ4OGxOTlJtY2hXVEdhWXJIN0lUeU1rZmJSdWFMVE1ZU2E5czBS?=
 =?utf-8?B?aDZERCtCQno5K05yRzF5bU1sSUtQYU54d2ptdXhQYWNlWmYxSnVIU3hKc0JD?=
 =?utf-8?B?RFBRZEhDa2NGRUFSL3BoTXdHTzRBZ2kyN2x3Mm5rS0NmWXdETVBNYWJxYnlu?=
 =?utf-8?B?bitjWEI0cG4rejA1REErWG1mVG1FMGprVXVYeDVtdit0VllXQ2dPcFN4QlM0?=
 =?utf-8?B?ajQvL09NZjFpbFNRbDcrRzRoSVAvM2VxSlhVUmNyVFBqVmFqUnB1YUxNNnFu?=
 =?utf-8?B?T2w0NmxEV0lUeXl5VmJLWTZ6R3hKUFpzeDllVHV2V3BlZFhENHVMeHVUUDRL?=
 =?utf-8?B?Y3NoQ21sbDhua1Q0clM4d01vaTNYQ0Z1TzZCdVNESnJhSjVNNkE2UXhvNWdZ?=
 =?utf-8?B?dW9MWjl5NDRDek5XQkg0dVVDQUNCMWRHT2QwYmVEdDNZcDZUOUphK1lLaG16?=
 =?utf-8?B?RVduY2NMWUpyVWtPM0FjNHZiUnpUdU5QSEVGaXYxeGR5enVFU0pTRnB5ZFll?=
 =?utf-8?B?dnN0VW1CNGw5WGtiSG1hZEdyWXdtZ2Y1RHlSeTNqK3pyR0xodVJWVEpyM3di?=
 =?utf-8?B?T1V2YXRNcEFIaHdtRWQvZlZiaUYyYnlOaStCd25nbW51K21aS09CK25ZSXRt?=
 =?utf-8?B?OFdvdnp3VVJ1WlBVdG9zNldTOGZzRjc4VGE5dEQ5bXo0VDFoRWdqTjQ0bEwx?=
 =?utf-8?B?cXdjZEF4N1BuNi8weFR4SkJ0djlBdlVhWW9DT0t4bVVSNnlNME1VMDBrRUpV?=
 =?utf-8?B?M0dxdTR0RkUyRFpQVmdFbmJZd2dpak1WcEptSXhEWlRZTEJ3SXpmNi9QQjFS?=
 =?utf-8?B?ZkFFc3luRGs3MTNFSWcwQmh6RExLanhYZ3VRK1FheGs4b3FubStheEUxellB?=
 =?utf-8?B?QkZsNlZPZndlOE9OT0thMEFONnFzNzRmREpkakVtT0tjaEs1Nnpnc01BZXkw?=
 =?utf-8?B?NkhqaXkyUmtrWXlyeHYzV0RONFFSNC9uTGxDRTVJenlNTTdXRWdWRmV5R2Yw?=
 =?utf-8?B?QUFKYk9yMkwyNmJPOUNaSWs0U0l4VXJlaDhYNWd4eHQySFRET25KV01VRkRj?=
 =?utf-8?B?d1dHQlZFaVdyODVrdnRkNnk3UnEvVmMyWkh5WHk3STE0dmNQRWtFdVl5dTN0?=
 =?utf-8?B?T1RNcjBqK1R1THB4SUprRWREMiswR0tIZlM5TVk0aUF6dUF1aHpibEd0a2NR?=
 =?utf-8?B?TllkK3hMbCsrZEw4R3hQdlYzL0dVYUZheU9VNFZYZDRCbmNGRURJd1VIMUlk?=
 =?utf-8?B?eStkZlg3ZUU4eTJ3YlRzcEx1Y1pVWk1nZjJiNU9nWkcyRkkvRGcyOEFxUkM4?=
 =?utf-8?B?a2Jwb29JRlI0aC8xWEUrK3pLMjZWZ1lSL3NORHR6aGFtTlcvS3NUNjhqLzhR?=
 =?utf-8?B?WS8rTHFVNkwweWNJNURteGdUVXBzdWhnQWorK3h5VGJZWnJDYnZmVFJGUmJz?=
 =?utf-8?B?Mml0cDA1MEFmVUpnV3h2emlId0Q4R0RWMXBwTjJEN01ySUxyRVJPUk0zdXF1?=
 =?utf-8?B?ck1pZ3k1ajZLMU9SZmRXaTRNaytPMDNBcjh2YlNpQjY4MHVaSVNVT1hySnJL?=
 =?utf-8?B?SFNqemRXS2FYMnAvQlJMSmF6MkZvWHdXbTFpYVhOZEEyK1k4NXEzVzhzL0E2?=
 =?utf-8?B?SVJ1NTJZRmFRU2xzSjkraUJraG93K0g5WHNlYVY3VHdzRk5TZUo2RXcrNTZG?=
 =?utf-8?B?d0djRHkzT3ViZ3BTdUV1OGFjWm11cW1aYTZLNEFybThnc2lmNHFpSUcvSHFm?=
 =?utf-8?B?Yzc5MkNBVm02VHAxNXNOVVJVUFhpZTMzTExESkFNZ1BRQTJQU0hmQkdnaXAz?=
 =?utf-8?B?Z01ZV21Ga2tBZjY1ZFNGWE51SkZPM2lrazhtS1ZraFk1VFRaeDNRMDR5Tk5w?=
 =?utf-8?B?eTdxbE1uUEx0Q0EwbmgwaWpVRTdJOFNCVmlQWGY2UzY3ZDBuVTFQdTJ1d1Yz?=
 =?utf-8?B?UE9XSlFxYUljSFNsYy9lbmZ1ODlLM1dObzdqYVdVeCsrRUc5aHkvdFh5VlZs?=
 =?utf-8?B?NCtneVpVN3k3bmo3cGllYU5wYVUwNlVQNUt2UUtQdmRUVWdJRG54cngzK2ho?=
 =?utf-8?B?dEszcnFYcnl2R1doVU5EYUcyQUlCYnpYNytka29YaHVIa0dkcUsxOXBSb3lq?=
 =?utf-8?B?eDFUUjNwTkM0SXlBYW1RMTdmTHVQVStNL0JsVGFJeEhhTzJBNDdxTmE3K012?=
 =?utf-8?B?cE9FK0FsdzdrWXJpR3dxdUE4bnR2d2VNN1EyK3l1Ym5BODAxY1diV2RrWlhZ?=
 =?utf-8?B?WDBlTUt6emEwa3Z4K1hIWnl6SXUxWis2Yzhwdi9TYm16cXU0UW5IMHdBeXdz?=
 =?utf-8?Q?vgIC8GWpfn7UxnoLOk55VrhfyYZSr+VZlbxDpbbiA3o8l?=
X-MS-Exchange-AntiSpam-MessageData-1: TjZjWmPj8p+YRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497ad24f-8eb1-4bbe-049e-08de5f3ad3dd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:20.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN5zb9pzZCHq7F3a6VFJgb5m534sglvvx6/S7jGnxzvDoQLmvxvXThUQxd5e3sypJoxlhun/+mnE64yiEWT7Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..4b929762d5c2 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -470,6 +470,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         Bounded::__new(value)
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N - SHIFT) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.52.0

