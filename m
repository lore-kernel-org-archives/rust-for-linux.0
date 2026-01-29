Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F82FCBE3;
	Thu, 29 Jan 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693547; cv=fail; b=fnWi5cCCVK+pjmcoqOto81VUvkwHBQa7LFDm1hhWRdM1uGzUSUDgjwlTwJ2kMJadDhmPkYY6ZEwzcAJU1XxgkxOEf0oz6cKW0fuQBJbgki5YSFoyEmq2lQVNyaQK9h1+e1XVZ3lOtyZzxR54S582C/Ox+UQ8oSEUzjT+a2v2lZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693547; c=relaxed/simple;
	bh=y6AN6ct7So9oCeJkHnIG9n2lMY3OGBeI3kIormdY00c=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fL9LBcnocaVhHkm5PeLvwiAUQ3qrrMT/TQnBDaUyD7LLKLmcxJenuX9tGH9nGMJxfdUaN4dfCY41gODHmptD/KyJjSBfCGyaYfK/EG/VE9TtnAwYdYxNiD1l4OmZTCGjhvefqc39Nd+0yxZ0pvXTCWeOthKOfAodls63dgn+0bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BR+1V1ph; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BR+1V1ph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wndnl9GQs5/YR6hB8NR2N1x3abALupaHdbCeLgXERvV77S4AY5PEBsiRwiv+lWRbPbnonovzSyrxLhQewDV+ukYlvDbKwdSroXZyCqM6QkspmD0CeOSEpwTBFpgLfQXlfwSnolno146ZYEBcJo6jmhdxUW/3VcG2HT3iljRki4UH1dGNLcbw2BBevrA2b2cNzRVkmePasruoIYEQ2s74H7YTRYcpaPGMEYiPYnGKTjQ1Tivg/HzAiHl1HrkDV+EK7ddvcKcqj4i8XPqOWnb1y2Q1MiKNejbZS1QMVhHjetHYtPIMfcMbMhnfF1cpVRKHa5Lq1t6KBmQteZiqFLNztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgVQE6uHeZFCZ4GI+s7altXlsxS0fQYf8inxy5jq+yE=;
 b=ndzmXRicVNP5ggQN8WLkojQzurDc/VUI/SNAiso4Vcx2OkTnpkI/riAc3vNtjtqZL2SxBpe0z9ovbIP42fB9imEu6KVwIPI5Sp++EI7SyaePmqy+nMBcwxB3+GVmgZ+4vVxjz2JGeJ5Jdv4pKmN4EvoiC7BE+L5ERse7UTetj7eH4oGI8nSnFTh3eqokDrZFgULaXk+Fdus/ncru3aHtiJm6/0pwsjxygTOpZf9I1PQ/Ih43HtYRZ4XQKael2vb5dfrXPFCimmqalxR5dwQYhMijUH6lx016OR/jvaIkO63A54A1et9dnJGvHsVDlMDCU/aN12iMLgyhYelh7O+UdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgVQE6uHeZFCZ4GI+s7altXlsxS0fQYf8inxy5jq+yE=;
 b=BR+1V1phLb2bhqYWiSbGFxjqeOcv35e+tH7tYepeBs1bpjPxii7JqAVxOYa/EFC9XWLLtRgX9SPNJzB/niiPoCPUhArdcdRMbbtPDX9/rYdvWVxAgEPjhu5CxSMP0UtbEH8Dz4Oh93iNjyqt3yEeXSgmLltKARVb9Gln3Ha4jN+WhRatnQVUblv4OrJ6xcVdQ/7Tj3//WQJ2DNWL7PSFp0d9+Uthxc/Dv9+otyh/LVTjjQV4whU+G3f8rkTIIbtW9KSpHgclz2hXbeQM605y+dwkXWW2huCrFpvZzmDJYtEf/6+XhYqTi8FxlUImjc0wCawrCbiWK/6W5bp7GFTXqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 13:32:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 0/7] rust: add `register!` macro
Date: Thu, 29 Jan 2026 22:32:00 +0900
Message-Id: <20260129-register-v5-0-c4587c902514@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMwQrCMAzG8VeRnq0sybqunnwP8ZCtUXtwk06KI
 nt3OxGsePxCfv+nmiQGmdR29VRRUpjCOORh1ivVn3k4iQ4+b4UVNhWA1VFOYbpJ1H3PHYNHsEA
 qv1+jHMP9ndof8j7ntzE+3uUEy/UTweobSaArbZEYbE2dMXY3pOADb/rxopZKwlJCIXGRzruu9
 Uao4T9JpWwKSVkiYcvGeUuAf7IuZVvIOksWISbyrqndj5zn+QWcF5jaTwEAAA==
X-Change-ID: 20260117-register-ccaba1d21713
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
 Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd947b6-b4a9-4d9a-dc68-08de5f3acf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmxGditSbDc4c1hPYm5zR09wZHhsUyswOUNVYUIxb2ZVVkNPNGQ5TU5yR1pP?=
 =?utf-8?B?TnJTc0FUYW84SjY4M1o3eFZWQnA4bmk5VDNsdlhVOERQNDVpaGlVaWVzYWhC?=
 =?utf-8?B?ZmdrZXhnWXNxM2Yxdi9UeW9iUnpabXFnUEhoVDNMcGx3bms1R2xPYzNyaFVk?=
 =?utf-8?B?WHlvWEl6RG51Zml2cnNUQUFjZWkyeEZmQzc3S0NXN2JtNzFndis4QkJ2aEpM?=
 =?utf-8?B?KzNUanBNWUFJRmI3WTl5U1hqdXBKZm8rSzdYcUV3ZFdTbUJ6Sk9CbWRqck1W?=
 =?utf-8?B?bkFtUDFWV2N5bkxWWUt2NlBObFdhZkloSkdpa1doZUpLMS90OGYyYmdDUVdX?=
 =?utf-8?B?eHMxYTFNNHljc1QyRWQ3TG04V3hmank0R2tNdzVSVS81Y3d4amMvbFhUdk1T?=
 =?utf-8?B?U2h4cERHM1JzcGNITE9qbEFVMGNna09sOExmYWE4VWF5L1k3WC83eXA0RjMy?=
 =?utf-8?B?NmNDdGNJVWdYUGx2bFlJOC9Hd2hmb0hNYmhGUDdjemtOMmhaTE4wYVN0d0hN?=
 =?utf-8?B?SnB4SWlVK29xbzRNWUlCZkdrVnlZdWZ4Q1hvenRUVnp6RXJFa09Da3JjTEpl?=
 =?utf-8?B?ajlCSVlXSDhJV1BVRktDRkJBMGJVRytGUWI2ZG8xcGhtdlM5Uk9jUlFYYnV4?=
 =?utf-8?B?ZU51M0t6cm5DMjZRQndBZytGNHRsU0RER0x0ZjBTcG95T0VMbHVPQ2ZMQk9S?=
 =?utf-8?B?MHV0STF6dkFjbUxjaVNtb2tOVkppVU81UmNCeWFlVi9UVllIUHRiOGRjbGoz?=
 =?utf-8?B?UG5KVDhkZ3grQ0Z0V1pLSU1COTI0R21ndWcrL2hOV3c2ZVJLbHBZd1RqaU5n?=
 =?utf-8?B?SmhJZkY1K2RxdE02cHY0aGdPWDBXMTRNaU8xR3Y2OWZGRVhNL1VBU053eXNz?=
 =?utf-8?B?ZmpVRmQ2NnBYWCtkMEtDT2lOUmtVdThnQndSUlAwYkh3aXhaL1dPbk1zZWpW?=
 =?utf-8?B?QnlIb21sSUhWME9PRTRabXJtMkU5K2sxamtaclE0cjllK2FJZE81TW5oUDNE?=
 =?utf-8?B?Tzhha2VjdEw3THBQaGJUWnAzVG52QzR6K05qWG8wMEJhYTVXcVBUK2N4ZFV2?=
 =?utf-8?B?ZHBWTVNZTmJ1TDRVRFNldHNTS3FteXQyZHowTnBHMERlTzZoV0oweTJVbXlw?=
 =?utf-8?B?bm5yT28vQnFTWFhRV2hzdldJUDJtbXdsRWtqbHdNR2UvS04vWUwyelQ5bzhX?=
 =?utf-8?B?YncwR2g4MVBla2g4dVlvUVJEQkYwdTVUUVluSzRHZ0xCRHF3WWtzaW1yUHF2?=
 =?utf-8?B?emY5cTB6VDRlTnJGR2R5TlltNnN5UzBJWnQrd0NQRUpCQmJvWS80emt6OW8y?=
 =?utf-8?B?eTNFaHRoeEFSb0FSaElvTzJEbTl6cGNad2draC8xckNFY0VtMmowcS9mYmp6?=
 =?utf-8?B?Z2dpTjVkc1FXeVZqbFRFWCtrYUJuMlgrNktac0dReWt5MHE0Z0RLRjRkdzJF?=
 =?utf-8?B?bHR4bDgyNVZxNjQ0djd6TUVoOFliTnY2YVBMWUNwK2Q4QW52QlNrMU1zUFMv?=
 =?utf-8?B?WXo4Qk5pemM3aFpSVGFLQ1Q1SlA2TUZVd04vcUNvY0xxaDhkUm5xVjZUVU16?=
 =?utf-8?B?ZzZGM3ZINGRHcmNrbldpZ2Q2aGx3WXBBOGdMd3AwU3ZIZFl5bHNsWk1aU1Fm?=
 =?utf-8?B?Rmtnd1gwbkhZOVU1YTAvUU1NeWhyeHdKTmZGYUdxR0R0cXdsZSt4bU0yMUJj?=
 =?utf-8?B?Kzlzdlo3TkRZQnFMWWM1c3Y0Q0p5V0NZSU5ocDhTWjVFSXlOQk4zTHZZVlgx?=
 =?utf-8?B?NFNhUjNqeFpkUXVoZm0xL3VZQmV6TmZHZDZlcmtpM2grZXFiNllTVWFLNVRN?=
 =?utf-8?B?UkJZSXlvZWxQeS9UdnFyY3Z1U0JvMjFNS3JudUhOdXcwTlplQzB4SnpMME9D?=
 =?utf-8?B?N3k1QjROS0M3TnFyOWYwa0YvV3FldjFyY2llRTUzeG9wNlpCTUpFMXlBUlF0?=
 =?utf-8?B?VndlUXdoOTdZdURBeVhUbGt3WFp2N3dzdUlNWFZSMkt1RjVxWXNndm8rOEVJ?=
 =?utf-8?B?U1Y1WWhtd0dYUC81bDBVWmF5djRJczRYbnNuYjRYWGxxZ0Q1VDlMRkplRVZK?=
 =?utf-8?B?YTJzVTFCTHArckNkL3h3ZGRleVZuTjFYTEUzZ3NibDNOMDgxZmpEMThJRGFS?=
 =?utf-8?B?UTBXYmdvZTcwQVkyY1FsVkhVZnBhYi9Kc3gzNWsxcUlJcTlOUTF1SG1FVlRW?=
 =?utf-8?Q?kYxqubF24r0rtx/YkfrSnpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WURneksxcERuZU1DQ25IZnV4cTVzOU82SU9lUm5mMlJJOGdRaVlWZFBmdUpj?=
 =?utf-8?B?WVo4eFNubXl0cmY4WXVxcnRBWE5kM3pnbFZWMXJDSlRjMW5IZzNucEdYSUU2?=
 =?utf-8?B?SlVqR2F4RTdSWHJodjlVVUhUR0lZQ1Z1c3hDdzlzZlNIOHFaMUVzaGluLzdw?=
 =?utf-8?B?amRuaW1HckxUclBxamZqbVM5ZUk3cElQRi9rVStlalF6b2d6S2hUYWc2WFEr?=
 =?utf-8?B?MTFVSUFOMURoVEZYR3RjaXc5NjRZTk5CQm5JTnhHampDTEx0TG5xRHBCZ2hk?=
 =?utf-8?B?R0dPWmo0eENzSEJpUDYxdnNqN0ZSb2tPbkpWWE1iSE1kTmRiakVvQnlOdVBE?=
 =?utf-8?B?SFZsYlVRZlVUK1N2K01KM05ldTNVbkZMUituV2huaytpTUNKM1VFd2ZJSU5x?=
 =?utf-8?B?WWY4OEprVVRvR2ovQ01sTzRPME1oOGxRaTFGUy9PaXNOODZlSmRwK2JPcU5t?=
 =?utf-8?B?ck4reXdWZTQ3RmR0cWMwNWlVWk42SHhBaUFzZEU2Si85TThERTQxbzNjOEJ0?=
 =?utf-8?B?cFczYVJxeGtoSWk3WmJHUGNtQUxlQlMzRVdnSjVlTHRSdUFJTnc5OWpZSmdJ?=
 =?utf-8?B?MmxFTk5xRm05Q0NMTk1iVkhwcnhJbnI0dmdhak5YTzlHTkpydWhacS93T1lR?=
 =?utf-8?B?QXZya3B0M3g0UzB3V1RIbUw5UmRWeWhnRkQ1K2ZJaHgxY1drSGptMUZVd1dE?=
 =?utf-8?B?TWNkaG9GZmZuQUhzbmE2eHBIOFVRSVpHRk94RlExOUpIWGVLQUw2dlJIam5r?=
 =?utf-8?B?U29Ed3R2OHdicmZKNDBRZmt6N01NemxhbG4wVER0eUF4L0ZNY1Q1Z0REUE1h?=
 =?utf-8?B?WXRpMjlzbDdydXlvZzFobXgybkFLVElPVGIvdExqckk5NjNkTmtKNXpVREFY?=
 =?utf-8?B?OUpnSTdMN1RqUlhjL05XeFI0UWlweTdoVWVpZzFKSTJvc2FXUnEwQWxLQW1a?=
 =?utf-8?B?RHZBM0ZJczhKK01BQXozblBVWUthRU1XRW1JMHpOb2RoS3QxZXJzT2xMWWhT?=
 =?utf-8?B?aThGb2REZmFaY2llSXZ0K2tIS291MlNXbmVJQ2ZxUnkzMC9OZG94VFRyOVRY?=
 =?utf-8?B?eWJ2cmZIbWljZExRMENNVmVsbGhZL2lRUlpOaWZtK3BUR3hLMTM0MTh0dTNW?=
 =?utf-8?B?TzR4NkU3YW5TNGhxd3hZbWtEanJPSTY4UnNNWVp1Y0I3eCs0eTdSMUZXWGts?=
 =?utf-8?B?d0lacjFZc21NZlJFd0hwYkF6MzF5THREZFFIRldSaWNSWkJPUGJSbnBCS01S?=
 =?utf-8?B?QzNPZXRvUXBpdHpWckdDVmR0UkhjOWZEdWZma3pIRkFjUlQ2WitJUjhhOGFl?=
 =?utf-8?B?REpsOUN3b21EUEJLU1FmYnBvNHppNEQzYjdLbklscEVOdG9tWnJZaE5DY2V1?=
 =?utf-8?B?L3pLWmd0bUdUR2dVNjlPWkg4UUxwN2ZBeWJTNU1CdkhKNGN5Y1ZxRXgrVTla?=
 =?utf-8?B?aU5PQzdMWS9sUk4wUVdZU0xLcmtibHlHRVJ4b3kwT3FVNkRPcEdTWTRIRHpa?=
 =?utf-8?B?Z1JWN3dXMGp0Y2hLZEZOTmIzYysydFlveVFmUHB3dytnOWlvTTBSaXc0NHZl?=
 =?utf-8?B?QUhuVmRCZmhMdUZxRWdBMGt4YVRHSmhHREF4Z0kwRStSdHViMXpWUE1vQkFT?=
 =?utf-8?B?b08vaEV0ZGRVVkpJODQ3SEFETXdOUDUyc0RPNnFEemJDNVg3MFJ4eGllRmlt?=
 =?utf-8?B?MUFzRHp2SmJ2cERxV3IwSTVndUVMa0pISkg4WlgzcGdtcS9xNitQVDVGNFZF?=
 =?utf-8?B?K3dvUU54WGhya3kvb3hsVHdmOTJPLzd0Q1BobzlMaUVQVEh0dHRYTVNWNzNS?=
 =?utf-8?B?OTFFWHFSTm9oTm1mamNqWk9qdGZQV28yallHaFBkbzIxOGhZNWZYQjlCdENq?=
 =?utf-8?B?U2hSL0hOdGNFdHZwOUNyeitGZGI1MVN5a2RReUE0WUpjUklqVldkL1lKNU1F?=
 =?utf-8?B?SmRaT0toMTNpZWpnK3dOMnRjamVOcVZ2NHRmeDFaNnNtb1p3cStCRXBPV2VL?=
 =?utf-8?B?a3pGaXBabUxWNWEyZU5DN1QxTS8vQ1VuR3hjMU5oZUtJdTdFU2dJaWtFcE1s?=
 =?utf-8?B?VklBUUxHVnNBNTROYXVPM1ZXL0pHbk9RbHVpUlRXQjRNbmRKblJWNi81cW9Z?=
 =?utf-8?B?TW01cHUrTmhjZ3JmS281cm9wTFZ1Q0o4Rzc5ZlNPWnhpc2pHTFRPK0pwOVFx?=
 =?utf-8?B?U3VaTFBhTzU0TWdWNlFEdE11cjIxMEhucnNvV3lsWEFrczdUK0FONGtlVnAz?=
 =?utf-8?B?MTg1RmtxcTV5bHRmaGw4R21XeVk3MGJ1SU5wY3ZXRmRlTFZKVlZjN2M0NlVr?=
 =?utf-8?B?MktUQVljY3N0YUMwNlc5aE4rNmFoRENsOS8yWmpZejVKeWx6Y3YrRE02aGdF?=
 =?utf-8?Q?d6WNKhHCusMRv/P8EXL3fPsOzqU3fHXPLx8bbCcT+wSHo?=
X-MS-Exchange-AntiSpam-MessageData-1: t5uQ5nkt5IM0DQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd947b6-b4a9-4d9a-dc68-08de5f3acf3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:12.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5OlsZv3RV+4T7QFHADhnLu4tTHVH1oid7ELqiunlQt0ryUYv5HvN2hoqX0piOILb/5wbjxVWZgsoTnPtwbTMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

Add an improved version of nova-core's `register!` macro to the `kernel`
crate for all drivers to use.

This is not a direct move from `nova-core`, but rather a new
introduction to facilitate code review and introduce features that are
missing in the nova-core versions. Differences notably include:

- Use of `Bounded` to prevent any data truncation when manipulating
  bitfields,
- Much better syntax (thanks to Gary for all the suggestions!)
- Extended documentation,
- Doccomments now build and run,
- Supports visibility and different storage sizes.

The `bitfield!` macro of nova-core has for the moment been wrapped into
`register!`, as a set of private rules, to allow `register!` to be
merged first while `bitfield!` undergoes review during the next cycle.
Thus, some of the code from v1 (including `bitfield!`'s doccomments and
Kunit tests) are kept for later.

Another notable difference is that I have removed the `Default`
implementation for registers and instead implement `Zeroable` to provide
a start value. I have deemed this preferable because implementing
`Default` for a register requires that each of its field types also
implements it, which is quite constraining and doesn't always makes
sense (for instance, what is the default architecture for a family of
chips?). Fields for which zero is not a valid value must implement the
fallible getter anyway, so we are not at risk of undefined behavior, and
`Default` can always be implemented on a per-case basis.

In order to avoid the ugly `Bounded::<type, _>::new()` syntax when
setting constant field values, this revision adds an alternative const
field setter named `with_const_`. Setters to not follow the most
idiomatic Rust naming conventions, so their names are open to
discussion.

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. Third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s, fourth patch a const accessor to the
interval value of a `Bounded`, that is needed in order to make register
setter methods const.

Patch 5 adds the `register!` macro. Since it falls under
`rust/kernel/io` it is covered by the corresponding MAINTAINERS entry so
I refrained from adding one just for this file, especially since the
bitfield-related parts will eventually move and what remains is very
tightly related to I/O.

Patch 6 updates the Rust PCI sample driver to use the `register!`, as
per its TODO item.

The last patch illustrates more largely how this macro is used by
converting nova-core to use it, and removing the local implementation.
This patch is to be merged one cycle after the other patches.

Previous work to extract the macros was done in the partially-merged
[1]. The current series can be considered a reboot with more features
and the `bitfield!` macro being postponed.

This patchset is based on `driver-core-next`.

Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.

[1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v5:
- Rename all setters to `with_*` and `with_const_*`.
- Use `, stride = ` to specify the stride of register arrays.
- Remove `Deref` requirement on the `RegisterIo` trait and make it
  `#[doc(hidden)`.
- Simplify the top dispatch rule a bit.
- Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com

Changes in v4:
- Add `with_` const field setter methods (removing the need to call
  `Bounded::new` for constant field values).
- Add `into_inner` const method for `Bounded`.
- Add `from_raw` and const `zeroed` method to create initial register
  values.
- More documentation improvements.
- Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com

Changes in v3:
- Sort the Rust features list alphabetically.
- Rebase on top of latest `driver-core-next` including the new Io trait.
- Allow several registers to be defined from the same macro invocation.
- Remove references to `bitfield!` macro.
- Fix doccomment of `shr` and `shl`.
- Use `+` syntax for relative register offsets.
- Move register arrays size and stride to after the backing type declaration.
- Use regular doccomments to document registers and fields (thanks Gary!).
- Remove `Default` implementation and implement the more predictable
  `Zeroable` instead.
- Improve doccomments a bit.
- Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com

Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (7):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `as_bool` method to `Bounded<_, 1>`
      rust: num: add `into_inner` method to `Bounded`
      rust: io: add `register!` macro
      sample: rust: pci: use `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs           |  205 ++---
 drivers/gpu/nova-core/falcon/gsp.rs       |   14 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   25 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   19 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |    4 +-
 drivers/gpu/nova-core/gpu.rs              |   31 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |    4 +-
 drivers/gpu/nova-core/regs.rs             |  494 ++++++-----
 drivers/gpu/nova-core/regs/macros.rs      |  739 -----------------
 rust/kernel/io.rs                         |    1 +
 rust/kernel/io/register.rs                | 1286 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   79 ++
 samples/rust/rust_driver_pci.rs           |   23 +-
 scripts/Makefile.build                    |    3 +-
 16 files changed, 1809 insertions(+), 1134 deletions(-)
---
base-commit: 7c60d964fbb100103730db9560f5594c1c4fc844
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

