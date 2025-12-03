Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24532ED860
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764758355; cv=fail; b=DeVgxEMosfGTUrr5ADZ1SJ3DpIiUn0iIpBH4rhmFDGoVSw4ObV2RqJJ8GSX3+oM7ZAGAALmyDYP9wH7DMYj3pfu2C1p8j2aUvbW2tMuBwR1IRNAMQEQ+/zXIIiBuJwseXDwRMnYyt3CrV+N8Me19Ts+yrVwixWz7GFg1pbyiVeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764758355; c=relaxed/simple;
	bh=pDPJnQyBZ5NBlvMkiddqxr0Inbom6oXj9PjNYsl+EEI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=sSqD8WyvbQWKAnD9OTBrkSO55osbw0Ola6zBbgUQuDzU2Xthh8g2rjHxQneZpr0oEkIlibcepR3tHaseeJFaO0GAbwYxzy2yqzwffYrf+m0MoKN+lG66ytHG9Z6rqiuFBeM/h0WE0ko2+c7+TyK6EMlwrPsDzxcV3yR83R5EUwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pBn9s9NZ; arc=fail smtp.client-ip=52.101.48.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pBn9s9NZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWgB9UlXuC9BlydhbXeaCGUzh/kScHXo6ftluRGpwpj+Ec5CP7LdcFxr94arzqxguqnoIqYqyExlIIaxiteAQLgmJ/aw/dzYcGshuiFhwu3j4gGngUiD+JtBvdHwZ24P4O8CGt7U5ZFs0lnpqo9jQPSNpebmaffC+Ee71pZ52tR8AFqRNPjfSoCzDJGROfK1QnJkL23AOGpjTGU4YGYb93XbaH7nEtRAtOG1Eh10zfUNYNgGuEEj+IwzALbpdSpicivP1TVL7R9m6bzYV3hD26sVroOPkt3FA9hnaoZEWkB+u4zTSR6tbPk1Yr1d9krql4A7+pGBIEjOoM2MIEIYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHxSQ09O5WUjIXvX2xEDPL0AJfugS7RlL8EdvC4yKfQ=;
 b=AudukdyxDHlQvKIYX4s2pv3jFaotnDOCxT7Cnir9qDNFjfwOt+hMWJv6LOTQtEav2Wep/0xQmXVjMUEEShw9AZa2cdrB0s9E/tDWJ8sbs9FCwuq0x5dkVZ7ClwB1NeqYeV5ndAdgjF82cKQSHaBKG2SCzVh3h9KyM4uk0AjpnDY+8smcJKr/kPux5CTCPIc4QNCWegiKqJIwPfa1fan6fEwlKqEIQC2u7X0xsQFltgKTSnOmLEbRixwzdpiksikh7Ijh7ZfEsrXFK3vkSdg0clqj1T615ZGahMs45E+Ch3lP3gT7nzGSzTEt6ARnk3kO1obUOmlOh7VYJLRhMBxXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHxSQ09O5WUjIXvX2xEDPL0AJfugS7RlL8EdvC4yKfQ=;
 b=pBn9s9NZ5EOoGr94+PTtO79Wz9k2zGFfQQlFoHhX5cH2wkgpioNvXhx4h2JO4Sn/5ML0DwbPFdtfnv28y7js/L2k0kGnyOmxdhmMaUu320Gd82VXc8YBAC4AqpwbJqpQDHHgltf6dq6deYtCj0BPb6kPv4zXBCbhn3U6k85lWH1TkoRyIr6keMsi1+Lq+s5titjwRh0ax7cqoO3vSFUpRgh8biCMaCfcCGK+tItpUs6TU0CWnNdKk6yzH+8DAminEcQSm1IvD/8DcedlXSoFM6yM99ZipZBJ0VirE6jhxwQrbF0LLAq5iPYf0XVXHMadnWJn4TEGfU+yVRtPrFOj+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 10:39:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:39:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 19:39:06 +0900
Message-Id: <DEOIMG7Z0J8B.3OOY2A989T3G6@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, <aliceryhl@google.com>,
 <miguel.ojeda.sandonis@gmail.com>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, <daniel.almeida@collabora.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: Return Option from page_align and ensure no
 usize overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aS6y5blasMX0KcD7@fedora>
In-Reply-To: <aS6y5blasMX0KcD7@fedora>
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3048c5-9d37-42cc-8bc2-08de3258318b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nmd6S3FIL2J2dHZkOWFHNDVvcXZnNnZvT2ErMm00MVFNKzVGM0xOQ2VWTWZs?=
 =?utf-8?B?SGFtZVBuN0dFVVFFUlM2U3BqZDRYbW55TGcyYmc0MWlIVGppamtNQVFNZVY4?=
 =?utf-8?B?cnZXcFFYaFRpOC8zeUdtSktUU1VQeVN5TDg3aUh3ODg0MVMyb0dHcmt4Um1K?=
 =?utf-8?B?K3hBckJVK2tleHhNQVhsb1JJQkIzaHl0dzd2bVcyZEpCYVNjRjdNV1N4S1Z2?=
 =?utf-8?B?RVFCV0FGNEhNaklCcVNSRWxiWUlQRFcvcjgvdlJpVTZaSFk1TUhLY2ZlZjVo?=
 =?utf-8?B?SFYwdC9QamhHWHJhS2hMT0o1SFhDYlhNbUM0RFEreTEvUGRPQWc2RmlkbGNI?=
 =?utf-8?B?Wng1cURjVUkvMGlxZkVoMGJZZWc3M25EbDgxZmQ4REhwVzR4QnRkdU5OSUY5?=
 =?utf-8?B?L3lFUTNpQWNna0FIZlpiVnR1c0UvVkhBVzZiTUlmQlZobmI4YlZvL2lMWXR6?=
 =?utf-8?B?OVFpKzhaUjl0RVVNL3BFeVJjOVErTVNZaWRjcE5OWXorZG5LTjEzVklueTM4?=
 =?utf-8?B?STFSWDYzemRrMVNYSWZ3anRKaC9HSHRGdFB0NThvZlJTYk5aTEhuSVJhVHRJ?=
 =?utf-8?B?aEtxZkdhTUxHY3pQL281Y0xTcmlVcDZtMzJZZDdTVTlxRWhINVp4SnhJc1kx?=
 =?utf-8?B?NmEwQXJZNmJ1NUlPL2diRDR3YjdlSmRjVHk2dWVIL2NBWGNqcHJmSTZ4YnFs?=
 =?utf-8?B?cEFoYWpSWUJaUGg3SnA0M0tyZTkyTkJjbWptNmVLN2RObVV1MStlbU1OYzhZ?=
 =?utf-8?B?ckpkcVhPRXRnSDI0QnhrS2x5V0NyU0RtU1RNbStDcXRIV1A1NVEzdEgrTVY2?=
 =?utf-8?B?OFNDOXdjZTk0aGwyb2txdTZiUDEraVZxZzVaaW0wTGlramZqTUxaeVRMMzg1?=
 =?utf-8?B?M3czM3loWk5STEFpTUdSOWpNYkk5WkUwWDJpRmtxRngxaUROMkRuanFKeW0x?=
 =?utf-8?B?UHl6YWxsd0x4R1duV3RPdDdTam5pRHJyR3ZNWTVlQldqRVRpNnBZcWl0NUpO?=
 =?utf-8?B?SFNkb3FjTldkYStYK2NXV3RXWWVEZDl0ZUdUcWZuNWxRZkJyQlNDR1U0UGY2?=
 =?utf-8?B?eC9oSmxXQzU1K3ltKzhpVnQwZjZnVmtVRG1BbEI1MnVLV2g0WlNKT25FZm9m?=
 =?utf-8?B?OFR0Y2hBeVlRMGRQQTBER29ZTWdiTW5EUzdud0FCbTdGUDF1dDdJZlJQeFFw?=
 =?utf-8?B?M0xWMkdnUExKTjRBN0NoazZub2tBOUc3cHk0M1hBUGFoZXNDUDAxYjRBMVI3?=
 =?utf-8?B?TW9abUE5QVVkVHp6RVRjaWkxY2o3TmphZVhYY2ttRFRBdTcyZWgvWTg2R3lv?=
 =?utf-8?B?M3BmWlgyN3RNdG1SNGx3TjR4bUpzdGdxYmZRVFBpaTFlK05KWHR0MW9Ram91?=
 =?utf-8?B?ZUZyZHB2Y2hLcXRGcmZZbzRucjdUaExzaGhsUTh4YVZTeEtqd3NYZzRLZmtP?=
 =?utf-8?B?MGNZc2puRjNCV0ZzV0dmQUY1TWFGV1lZWG1GY1JLM0lpaUNmVFUxZ0ROTDFl?=
 =?utf-8?B?a2liSE9hcFA0eWNRcWlGUzcrWmV3aTloWG9MWU9aVlRSVkY2bW41QnVGNnQ4?=
 =?utf-8?B?UFRaVEhTSW9lMklNSzFoeUJkUm00VFhoeW12VDl5dUJtbzExMDhyeDAwRGMx?=
 =?utf-8?B?ZE5GV0lHRVhHMXhNakNBNXl5WGZqSHI3QkxJSjVvS09RQUJHSlpsZTByUVFH?=
 =?utf-8?B?aXBpSkY0M3BQQUx6eERqTzZUYjIvK0cwdW41dGprdFRETExzaEM5OVo2ZW1h?=
 =?utf-8?B?WkwyOVJPTFNYQk9XZDNtamhWYysxa3pnUEpETmd1NkNFZkpyNGR5N0M2S0hw?=
 =?utf-8?B?V21OTHJCNUx0N1pKWUpaV0FSNkdMbXpRQlFtSXZRb2wvOS9pQjdpU05ad3I5?=
 =?utf-8?B?akszYjdSOG9tSldGYzVGTENhWHFpaXNBaFJlaVoxTldMTzA1d09YL2lJTGZU?=
 =?utf-8?B?UUFjTlB4am4vaG1EWnJPdTRMQlp4YkQrZWNjOHgvK0ZvYTN3TXNuUG9MVldK?=
 =?utf-8?B?OWRMb2NlQ0lnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BHTEg5QXloa0tkWU1XV0lST2pnbnlUc1RqRzJBYS9NM2FvRzNuQm9sOFVN?=
 =?utf-8?B?akhMY1FGamQwbE9rNkw1SDRJRUZiYitSVXlYTmtrY2RWZ2JibGl1aEx6dFN5?=
 =?utf-8?B?b1hyUm8vN0pNbWphZG5WWWJYRHhqRTdoYlp3Vnd1TjMveFVwRXFoNjQrYWtO?=
 =?utf-8?B?QWZCM2VQTUNpNkdFZlhYbE05alp3bUVaSmdHd3VOcnBuUTdyaEdsV0hkY2hT?=
 =?utf-8?B?QnRnWm1WTkdtbFBLcnZBa09MVU5aQTFtaGNscDI5a3RXR09zTTdjbnZabUxR?=
 =?utf-8?B?clZVa1l0SkpwNUVKY29KVDNrcjQwcjJ1RFNoYVEyQjI3ZE5HRmhwVmQwSVlT?=
 =?utf-8?B?ekJGdlBEdDBncldNVXZ4WWtFTnMvSkdNZFNJMWxJNlFiemFHMVJyZkFPTEhC?=
 =?utf-8?B?YU1iWHlrZEtrdURBYVlhcUcwcVRlMzRpcWUvQTZkNVdCNkNMVURGckVySTd6?=
 =?utf-8?B?VEFrdEtuSk5ITi92aVFnSC9hRkF4NllnQlg4Q3RFSFJiSzlyOExwR3RWdTRu?=
 =?utf-8?B?NU5vcGVHWnNMUEZVNlRwMm5tTDArbkw0SWp5R1FLRyttR0FLVXgvbVNCczNS?=
 =?utf-8?B?VjBzSk9QZktSWUVxRGxXTmxVTEd1YnJzbjlvdThmOEpiN3hqNWlqeDc3Qytn?=
 =?utf-8?B?MlJpTWxENXV2RDJyMFQyR2g3TUNVcjZuYWEvTWVjSHJDbkc4ejRCa1dvT3VV?=
 =?utf-8?B?T25VdjhnR0Y1bzIvQ2ZlSE12bEwvbjlWR3JMNXFjQjNjeVg3R25STzdUcnpR?=
 =?utf-8?B?RGxUYndKcWVmN1dnN2ZDVDdja0lObmZMTXZneGhPb2IvVGRDMU9BL2ZqY0xD?=
 =?utf-8?B?VWFKVGVFL2pocnR3RDN4bXhzdEloWlZhUkJkYmFjT0NKa2FQMTdVRklwOUdx?=
 =?utf-8?B?VFZ3d1pwQ1NxWEI0aWhpbTZFUzluWVpvVlRRL3lVUzMxaFpENzNuYlBhejZZ?=
 =?utf-8?B?VUlESzJNdDZnSEwxampQRzFWWkpUVjZtTjNrelN4cXdDL3diSXhQVUszazRs?=
 =?utf-8?B?d2tlYldSdGZEM096aktOUUNwNzFkWFQ5bWZkM3RxeElpRytQcGFVZlRnU283?=
 =?utf-8?B?alFsQlNvcEloOXR4MS9qemNXRk9KK3F5ZlExRFkzenZYZG9pNXVoWDFGRTRT?=
 =?utf-8?B?TFNIQW1IT2Y1WFFLNWhYZWFsSWF2bVpldGhHZjM1dTVJZDV6d3NYRHVsbENJ?=
 =?utf-8?B?Q1NTT3dFZ2VGY2ZDdVBMUy9DQU0zcXJ6T0xSZUNCZDhRZ3Bad0JZWUNKVElY?=
 =?utf-8?B?UFp4eHJFSDhVaFZUKzBIS0szY0FkdjIxNTNHMkdwQ2pzdm5rV0FuYkJ4dUNj?=
 =?utf-8?B?bFVTK3FmVFZNRWdmZkFZQnkvSFJ6SUhQQjBWenY5ZlJ3L3czWlo3cWlQcDlF?=
 =?utf-8?B?eDFFclloL09Qb3VQQVdTSDdHM2xwaDYrVUNnKzlJbFFscDlDY1FmUTNMVHM5?=
 =?utf-8?B?UWJGdFB3dnVVZDB0NmUyRVI5WFgvZmNVOGlGcHZ2anlvNjVhL1hoYlU0VG9H?=
 =?utf-8?B?R1doZkRlRFBqcjlUeW9zRW5uRGFSU3JMVkdEeDltcmdST0hvZW53N0NCdUd2?=
 =?utf-8?B?Y21Na21wa3llUVdZa0M5YTFzQUNJU2J2QUpVVnUweklRVUVuaWFZVUdFd3Ro?=
 =?utf-8?B?YVZaMDRrQmErYU9iR2tXTjVCVWRwK0szQjJiL0c3djRJMFR1WlNYK0Y3TFJT?=
 =?utf-8?B?ZjB1dlMwbWtSRzVaeXE1Q3JhMENFWHhDdmwxL2IxQUdLazB0aHk5OENjM2Uz?=
 =?utf-8?B?WVoxMnBTNHVZTFlyWnZnblVBbnVYZ3VXYXVvSk9Na2UzaE5ZZFI2S05lU2RM?=
 =?utf-8?B?YmF6WVlPZkc4akJZSEhnUTNjYU5Vdzd0ZVQxY1VXQ3NaVmwzL2RhVDc2YWw2?=
 =?utf-8?B?ajNLVGdyUncwWkk2cWk3SGJFdWptZUF5QXNab1N5YnN1WXMxdisySEFIaGp3?=
 =?utf-8?B?cjMxaVNmUzF3ZFl2VXd3V2tQRHd5MldDWk15NVFXMXdENkFGWjFWMWx1NHVJ?=
 =?utf-8?B?aWwyQkRnRmxNV2tyQ2RyTTY3dlBqOEM0dVVNaHYwbWx0QzNkWGlBd1crSy9y?=
 =?utf-8?B?bStkK095Mzk0WWpqdXZxclBBcERKNzhvV2NuV3hqZEZlcmNYN0dXR1JHZUpS?=
 =?utf-8?B?eGJ3cGRJUkdaZFhlc0tzNC96OUptT1F4RlBTVEl2NGEwK1NiZTNqRHI0cjZM?=
 =?utf-8?Q?jhfZA5nDzDESTyo02Ivt2vCArkU9oPXD+tN+scgcUGtv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3048c5-9d37-42cc-8bc2-08de3258318b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:39:10.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzlOe57LGwnhB0UTTonwn6Ywi4KJ7mPDuzNOKqoFEYz1X+h5RutXPWhyW5PHgZmMZbDcqJbsOWT2ZkWdDVWgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377

On Tue Dec 2, 2025 at 6:35 PM JST, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

A few nits below.

> ---
> Changes in v2:
> - Reworded commit message to follow the imperative form.
> - Expanded the documentation to explain the `Some` and `None` return case=
s.
> - Added a period at the end of the documentation comment.
> - Link to v1 (and v2): https://lore.kernel.org/rust-for-linux/aSheTh-T1or=
oAUHR@fedora/T/#t
>
> Changes in v3:
> - Fix documentation layout for better rustdoc rendering
> - Add doc examples and doctest
> - Ensure function is always inlined for performance optimisation
> - Restructure function so that early return is the None case and the
>   default is the happy path.
>
> Changes in v4:
> - Fix rustdoc missing comment (//) prefix
> - Rebase on master
> - Link to v3: https://lore.kernel.org/rust-for-linux/aSoY31U3uDI2y7V1@fed=
ora/T/#u
>
> Changes in v5:
> - Use kernel `PAGE_SIZE` for all doctest examples
> - Backtick the backtickable words in example comment
> - Add new example for `usize::MAX` input value
> - Newline before # Examples
> - Link to v4: https://lore.kernel.org/rust-for-linux/aSzDj1htLp11eCWF@fed=
ora/T/#t
>
> Changes in v6:
> - Simplified Doc text
> - Link to v5: https://lore.kernel.org/rust-for-linux/aS1qz6WjjP8E49pY@goo=
gle.com/T/#t
>
>  rust/kernel/page.rs | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..ac554aaee2d4 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -25,14 +25,37 @@
>  /// A bitmask that gives the page containing a given address.
>  pub const PAGE_MASK: usize =3D !(PAGE_SIZE - 1);
>
> -/// Round up the given number to the next multiple of [`PAGE_SIZE`].
> +/// Rounds up to the next multiple of [`PAGE_SIZE`].
>  ///
> -/// It is incorrect to pass an address where the next multiple of [`PAGE=
_SIZE`] doesn't fit in a
> -/// [`usize`].
> -pub const fn page_align(addr: usize) -> usize {
> -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow s=
anitizers in the wrong
> -    // cases.
> -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> +/// Returns [`None`] on integer overflow.
> +///
> +/// # Examples
> +///
> +/// ```rust

I never see the language specified in other doctests. I guess it doesn't
hurt, but just mentioning it for consistency.

> +/// use kernel::page::{page_align, PAGE_SIZE};
> +/// // Case 1: Already aligned

Why number the examples? It doesn't add anything since we don't refer to
them later.

