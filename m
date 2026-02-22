Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB492F851;
	Sun, 22 Feb 2026 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787114; cv=fail; b=DF6PBOEMJEHUMYgSIXJCKbQarl6e4QOZHL94LeLOlIKC76VhAziBwZwZgaWnQxgD1ryXXSG0UK0t17JR8gGpFxQTtGSw/VQZKKovwh5RwNKZogcDObTFuS2/uwJTFiEDyOuK944LKTsQR6R0tw7k+81Sp0MvUzZBDh/LqM/qxUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787114; c=relaxed/simple;
	bh=CCILY2vrTEEhjTdwn1kjUQmrHJSJ63yb8TmVipJJCsQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L6xg+qnVdr8OEUq+V8qrVq9ssWjL9wa/g1ASlNyjfT8SFOqMdIGe6yWFzJHanKt4rPGNQ71iAkCeQQ83wsljmD7tsflE99wtXsbbQgYOZuiDgEZ1R/njypvIAcSgpJ9MVNcqngirGux8VpVwSoyOXODAZX83sjT3g7bsh8ptDuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=COOXNa66; arc=fail smtp.client-ip=52.101.43.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="COOXNa66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaSPIrmf1mTHedkuulLKyvJfOPRD4dfo6Ou4Fcv8ChV8vKyYoDSRCcGiYMME9kSSttolkSUJ9zxKpC+RVQYEfqyLe3ku2LaqTzsG6UGrsoQW0bMeFTlRA76l6vUni8UIZzpS9MM5IpZgkYkOZ6tJA9RM59rq/Q8Yk9Hs0suKJzo2lachfaRRP46DJFjPWaICALA3+xInWa1nOuIzdWvpXJu38xtJttoOivb73LYPt+/Zk67TZSe3lj/4BFidDTW+eEaxUJ3wETi6YpeeYj5n/1qMnDTik146R/9MwQ3nz+wropC/pR2TCPAADW8UThPVvJsiufDxBd30eSKNSh3SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XkiM3ii+HGrbIP26KhJwCh27HrzlHlAkeBzclX33kI=;
 b=OGcw/+4uPwMdTY53Lsa7Ebn5SwGpobA+fpqhyFKR4vOhRowYQU24m2JrA6KW1vACbQTxNTR85J/AEYafEEwdRF0Gv03jW4Ew1TkGr5lciZjQJzcymunee+NJJZMTna4sgwXBaKPdzM87PGjdmnBgkcF08z0JsKadqLdLQfKYCJWjtFJzZGt/59hUsIAmhQwSqtzkjUORCnlz1Bu0J8TnAdBEd12U//S0DOxfNfnDYI+oJXThCst6ZTMXoW3ywNbbQJJZLW21svkQ+y7iYNyHWnVrtQ0mJz0/Iuu0MSOvZBuzmsSEBmqhg5dVx+wq6TnGKeE9EX05+sOr9I1wKGrfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XkiM3ii+HGrbIP26KhJwCh27HrzlHlAkeBzclX33kI=;
 b=COOXNa665NNx5DQZVe6adhQYg9giU1HYESTETTU18P/Dk53qkZie4O1grDBx0hU9vvI+FJKb6P/tZAHXzNFIzGEw7lf/VPnlTrBE6IQPiq8Adr3mWTGno7QtFti0hWKvwRhczivZl/dXxPWxF36FkOpBddVfTEfsrZ30Oaisbr2LL0sxtoNbrK3uYJHWDMuDPKsQE+b2g4auFx15wrgpxABkq1UNKWmpoqxKFkGn6O89TT2HNo71Uz+gmHJ+OAU52n7vpCdU+qoMgjWxDQW8lSP0w8YC5xweliTZXLX+cBYShIq0t7iCktvkfLdYlgO5DIZgpdgk1KfdjH1tNhk8kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sun, 22 Feb
 2026 19:05:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 19:05:09 +0000
Message-ID: <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
Date: Sun, 22 Feb 2026 11:04:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: c83464bf-4d1a-4c32-1ff2-08de72454c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1ZKcDRyc2lqZkVQUDZ0UXFKTExYU1BZL0ExZStFSXZOTmJIOUNtM2ZWVzFh?=
 =?utf-8?B?UXptODVBM0lvNElNSFVMaHI5M0orWnRPYmhhNFAxR3k3UEdWVTYxL1Bja3Z6?=
 =?utf-8?B?c1UyYjdQQ3JzWXkxU0VmbVNTZDZHQVk0bVN5UFVQcVlCTkxyTk1rZ2gxTGhQ?=
 =?utf-8?B?ZFlsRFI1Q2x1Z2tpS3M2eS9nQVhYVjkrNmlqMzhhYmc5bkZRVUNnMUpHUUVY?=
 =?utf-8?B?WFQrckRKU2R0Q2Z6VXhjZVBXYjVWeWtMd3hKMGJ3Y084Tlg1NmRLSmZXTDBs?=
 =?utf-8?B?eUR2K2dwbUlub2NoY0FuRzg3ZkFYYVE2eC80U1UvSkRTaUNuanlwWS9wOVB2?=
 =?utf-8?B?RFBsSERZUXF6UmNQQThOZ253ZjJSazd5YnBLMVNBbW9EQktJNTluRGRxcEtB?=
 =?utf-8?B?ckFqVzFBRnVlYStsaVFERXJjRXdOVnl3aXNSK00yZVJ5Mkt6S0p3eUt1RnZJ?=
 =?utf-8?B?U3VVbFlKREZ5YjhqbWc4cXFZMHlOWDY4MVJQQm84ZW00L2l5ajE3WXlyMjlB?=
 =?utf-8?B?bUFvTkJnVk1tOXhMZ2tIMWw5SjFqbnhCbll2S1Ric3M0aSt6ajZaTGRZZnFq?=
 =?utf-8?B?RUNScktObHNTU1pLbHJtR0NyMzEyNGVnOUxURmd0SG50bTFhcTFhY0pleE50?=
 =?utf-8?B?enRoRERMdHBURURHSmVxMHJtRzZ0M09VNjBUd0ZjUCtvRHRoQnV2SmNzT3Zu?=
 =?utf-8?B?cGwwbkZjVjBld1VrLzQrekl5UEIxZXRKWmtSSHlVTmN0TVo1aHI2bEVKd012?=
 =?utf-8?B?TkUxczNLNE1YTUo1T1BzTi93dkZEanZtd1JTbHdtWXpiK0piY2dsTnlwbmJs?=
 =?utf-8?B?S3NLdHM3S0hXazV5aU8rYklRNTEvMDFFa3JsQzNSUTlwWjMzNHNOYThxVVJ2?=
 =?utf-8?B?TkFpRFM1dE1wb1RVbnRjM0tlN0h1NjQyRzVMYVhsb00vek8rTVJJSUpEa3Fk?=
 =?utf-8?B?L0JXNWtya3k0bzJtWENWU0VXeW9sdWhMaTl5YU50MzAyb0pMdGNtSUp4czQ4?=
 =?utf-8?B?TXlaNnpRU3NxQjhkZGhKbjNYTVhOZmRhaFUvVGp1N1JqZG5iLysycE9JSUZr?=
 =?utf-8?B?RkdlaEY2M3Z2bzRMMklQZGQzNVFxSVM5ODk4UWI4aXo1Z1dKTGtqQWMzTE1x?=
 =?utf-8?B?b2lSa3k2dWh2MTNkZDA5Vm0xRExmdE1FUjZ3Qm9iVzBZMG5EM1drUGp6M0hv?=
 =?utf-8?B?RjkwOEJLN21jdEVYUVBHT0N4TE5XaDJJWVRrZXFlZFhpSGZuNjZLSSsxVURU?=
 =?utf-8?B?RHQwVC9FaGNVempDUUxiTytMa2k1ZGxhaXJoRnUxSVVtQkgzY1BDQ2NaNG9V?=
 =?utf-8?B?UVdvT3ZPcm5wRTVPOUc2ZGZLWmhQNGljbzNMcmx4UXd6YTl0LzY5TGFaUG94?=
 =?utf-8?B?elNBbmpPZnVtbTRrRVZLVWR0RkIzdnNOaE9xcTI4Tmcxb0VwdUF0SFYyd0FE?=
 =?utf-8?B?VHgySFZwVFhFdG1BK0pVODFlSmZUcVJReTR1N3RMWEFWdmlEbzQvRVg1TXcr?=
 =?utf-8?B?QlUyU2hTbmJiOGtiOEU4QUdKYXdpdEhSQ2R0bTc3Q0VrMXhZaUNMVU5NTG5Y?=
 =?utf-8?B?ZWpQRDVHbEtCdlIzWXBWTitTZXJLd1I4QzRRVUNreFlJemEvTW1zQW1HSmJ1?=
 =?utf-8?B?TUN2Yk94SkpRQnNZNG8zY2Z5ODdIc2IybVFPQSt0TENScUVJNGtJUnVHbmtN?=
 =?utf-8?B?SVRtYTJqTTdmbVBZdE9OdzE0YWQrb0xOOXFZMnMzRGJUN0orbFRlKzJlOGlk?=
 =?utf-8?B?TEV6ZzJRUTBheUFBYjYvL3MxRWtCWXlDeWQ1TjJzTVhIcys1UW04L2N5WU5Z?=
 =?utf-8?B?RnYvTWR0N0Jhc0t0YnM1T2VDN3VERVhhazU2cFNzaW5xY1JMTHFINTY5VHgz?=
 =?utf-8?B?VGdFdkNLZ2hiUHpVVkJQQ2NTTEpnTVNYZ1pwZllJTGg4cGRLdGUyVjUvSFhk?=
 =?utf-8?B?Z3JpTkNhWllGd0syQlpMTURFT1hnRkNMOUpXVlE3WEZHVnFWejgvazhkVzZ1?=
 =?utf-8?B?bmxmU0tDaEViU0dYVjE4RytoM3YyeEFxV3p3bENLaVpoS0taZk5tM1V3andU?=
 =?utf-8?B?TlZMMXVyci9JcjNrdU43eW05RkZyYTNjMmpINEdEUC9DQmVwaU5pLzdYeHpO?=
 =?utf-8?Q?nRHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFSZG1FbkNuTCtQMktNR1hNY1BCL1dsS2VscHludVZINjkrdG5rSmZTMFNz?=
 =?utf-8?B?MG1qR1pCbm10Zkd4UU4vM2hUK3RqdEVWcmhXaDdmQUg5UHNEWkZhMHBEUEc2?=
 =?utf-8?B?RnBzYUh2WldNK0o5dUdTU3dKaDBETTJNVVliTDIvMUEyQjJDLzNtMjNJalpk?=
 =?utf-8?B?NjdPZDRZYTk5VXlVRFk0YmREaWFyMG5MdExxSi83bVVYWnpkUTdFNWsrNmlI?=
 =?utf-8?B?TDU0dkNndHNxdGlBYTgrekNiUmZnaUNBNjJJd1lOUWg2cExHQjNsa0Npc1lU?=
 =?utf-8?B?UGtENG93Umc5RUVFTjkyc21nRjNWaUNZd1lZb1BXK01HTFhMQ0pya2x3eEsy?=
 =?utf-8?B?bW5yb085ZFcxWmRQbUk4ZzVHMVNLZExPbkFGVVpXb0w1ZFcxSUpBQmd5citF?=
 =?utf-8?B?QzVDVVZnUUFqMk04TlF4OFdvU3lvMWxWemNqbkN4QWcyZGNYSmx2WTJhcWZX?=
 =?utf-8?B?ZlQ2UUNpMGw4RENVa1FuazltVzdIaDRxam41eUx2dDJWQURONjlWWjFRa3RF?=
 =?utf-8?B?RDhmRC9aNTlaREZpTVFQZzExWWtxZ05DY0c2bUVtdGZTY3VNUU9BNmFtd0NR?=
 =?utf-8?B?RlFLZ1hoNGdRZ09XanI0eVNiVmdHeWtDdXdEdUplbHFhaFptMEJtaWdsSmQy?=
 =?utf-8?B?OUdGTTE4Y0hzbUN3Y1BaK0l5UklCazNBcTJrWkcxR0M0VjYwMThoalFZMmtT?=
 =?utf-8?B?STJZSkNqbDJTenlBb255WFZsT3BJa1g0bzNSdWhyS2NTMGRYYlNvN0RzVzN5?=
 =?utf-8?B?UnlCSGQ1SVN2clJWVXZaRGkvSFpPR0pEMGxwaVdWNWFCZWRsbnU2R2lHTWxr?=
 =?utf-8?B?R1krVjhZTGREQUpNQ2ZFeHpaaklQSjI4WElSM3p5clRSVXBoWXpiRW5kS2g5?=
 =?utf-8?B?aW9qOTQyTUk0anVtbDdnUjNkZlVFMGRHdW80emw5SmIwS250cDlQSlE2TU52?=
 =?utf-8?B?am9jU1Q3NjlMUmFkNDVMVHF3alNWTkpEU2VobkxXaHhWN3BwT1JMb1duSGRv?=
 =?utf-8?B?dUxIMTYxdzFTNmRGYVZreXMvUVRrMjE3UkR1RkxBU1FrTG5KbjhGQjR0ZXY5?=
 =?utf-8?B?Yzg5L01vVG05N2tFbWxrclR6dnc2VGpoVW9GRzR4dmJQUEF5clA3VDBVVEVZ?=
 =?utf-8?B?VHozMmdKOVZIRjNuYStqTWlybnlHRDZrOVhXc1NiSTAxUXlIZmh5a3E4dnVh?=
 =?utf-8?B?Z3hiSDZOVEcrNnJwTWlaY2VQOW9mVXk0UGxqQUlKQnoyTGVmNzd0ckUxVFM5?=
 =?utf-8?B?Z3N1aGVEdndyNys2ckt2UXBRb1RyMnM3UFJlNUNCclZzbFFpTzRUbmxzOFZl?=
 =?utf-8?B?bFhxM3d6Rk5ZbkR5eGdjaCtVc2xrbGh3R0Z1S3JWMlFURVVHRHhDUThqV0VD?=
 =?utf-8?B?WDBkYklGcEI2Wkk3WTd3M1FQOEdGTXZrZlZKdmw5VEpOQkZQNHYxM1dTL2Vy?=
 =?utf-8?B?VGE2clV4OFZQTDNGL3c5Nzg2RWZLZG1aRDQxZ1BMa3J1TlVqL3FaUmVjRmJS?=
 =?utf-8?B?ZHpnL2lvazlSaXZFRHR0bHRXTVhZTHFkT0RzTVlObktTWHE4MjlROGcyYkVu?=
 =?utf-8?B?by9YZytJSlNOWU0xdE5USExwQ0VGWUFUSnQxNmVhakx3ZWEvdE80OEhzRHVC?=
 =?utf-8?B?cXgzQU5zdXBEN3JTc2xLNjROMklPRmFyYUZUZk1ONXM1VUZPcWJ0bjZUc1Bw?=
 =?utf-8?B?MkNWbTVsOHRUYkI3eWE5N3pyM0luV0FHc0J4czQ0MW9xdGdJb1VHNVk5SVFi?=
 =?utf-8?B?RVYrYXk1MTZOQ3NBOVlDNDFqRGMySWZTdWFWdldzSHFzNG5KakVBdEpKQkUz?=
 =?utf-8?B?bUlrZVdjWHNZdnVCUWNiYzlvSUYwdzZQUUxkWDZOcEVIbk13N3VxMXdGeWRV?=
 =?utf-8?B?OEN1b3piK28wVTIva0ZQSzdVRmNlOWJBcm1NYmZRMWdtaUZmdUZ3dnY3Zml5?=
 =?utf-8?B?SHZGaUltNWpwS2dpd043a2dFL2ZISjRmY2hoLzlRdWZ0Q1phb0JtYXFKYk52?=
 =?utf-8?B?U3BleDg1RmZtb2V3YU9PeGtzSDJTR2pmSnNrTmhKc1lPVlBmbDlSQk5DbzNE?=
 =?utf-8?B?L3pJN3pLU0JjOUVVZ2N4czluZC94cUhQU244VFNVbnFRb1BxanVYT21LK0JE?=
 =?utf-8?B?bGZoV2ltdjE0cTFKbDEyc09uYnFJbFQ0MWY5UHJ0UWlGWHczVkNjVWI0RWdx?=
 =?utf-8?B?d2ZSTHp1bmdoaDBvMmNEeTFuRC8xcVZnNW9LM2wraEFOK09WYlhwQWExNmJP?=
 =?utf-8?B?WkY0TmU4MlNtNUMxd2NrTDNDMXMvQllxMHdPMkdxcWZLeVRLN0lvbm9jamhM?=
 =?utf-8?B?UWE0cTQ5TWU1VDdTeWZKWmdPdWRMc1ZmL2RMZ3A4b1MxOVZvTERmUmhXWURS?=
 =?utf-8?Q?8AWSgkqD9bC/93p8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83464bf-4d1a-4c32-1ff2-08de72454c93
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 19:05:09.7730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1c+zaaFtRmOKQk097zDCR3j1Z1rqyfXKKO4/Pky5IDTiEY7fv87vPiqZ+SSPxpMWWyA67Dem9aTPVBtclnYGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

On 2/21/26 11:46 PM, Gary Guo wrote:
> On 2026-02-21 02:09, John Hubbard wrote:
>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>> equivalent of Alignable::align_up(). This uses inline_const to validate
>> the alignment at compile time with a clear error message.
>>
...

>> +#[inline(always)]
>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>> +    match value.checked_add(ALIGN - 1) {
>> +        Some(v) => v & !(ALIGN - 1),
>> +        None => panic!("const_align_up: overflow"),
> 
> This is wrong. Either this function is always used in const context, in which case
> you take `ALIGN` as normal function parameter and use `build_assert` and `build_error`,
> or this function can be called from runtime and you shouldn't have a panic call here.
>

I will have another go at this, and put it in nova-core as per Miguel's
comment as well. Thanks for catching this, Gary!


thanks,
-- 
John Hubbard
