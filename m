Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161A2773C1;
	Fri, 23 Jan 2026 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212611; cv=fail; b=p+LC9n9i8GRbXQsYHvYzIHs9Ufu5Cvsn590SukZLjQ2oUg6Ow3iZAHGxLkgIAi8wIDz/1q5+zlygibNfU539+8jTAL7QKcWJMvAsxc3hrwxY/ykl3nDizjELU+sgE24ZQJZ4LD7tjJYkZ7IMoho98VNVZ0l80K6jGliJjXkArjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212611; c=relaxed/simple;
	bh=QKIxyrADDcqjkW7DOUrV0Q6jUnqhzUmNgZjkqqHJ84c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XQ4DEyNA0VrK5/te2Z8j5pwd9fgA/ZCSn8cVZ9uI60hsVGWzfPFK/9D481GNU0i7FbrjozoQwvfD1ZqqEnEhPaCPmYgZGlx5aQSwCbJg3C62GWHyChcp6R4wnLysFsJCEfUZxP9NmdIZxR/FdtgygBhz8aJv+0zKZpT6eRV0rJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IRxpYjrX; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IRxpYjrX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LI7LrXFOWKmIUaQ69AnCmVPbdZB1gA2nAtOKY5LdoUOaarWOg9GK4bgjR3eGncXffFuU/Axs0UlHmFqYCK8KTcRfVz5nBE7FGB2fIH2pMnMgbSIl1TjG2S3mAf/9/BT3eIXf3XH3zsrHfzP7TbQk19xkZ9iKPkeYSe8WOOl0jevpv/ShTxdtagCjkjD0z9tuLq0rJSuQT+EGqigH5BOx7UOkt85rKVlOCStNsWIX0Z1IggBcfBn6Z4hggLeKggkDg52+6W+e5xmSjY8O3MYrHVSEWfnEFwy0zFu31il+Pcf5vIrTpIurjErNjWvHhYmXgBxqRalPdWQoOeWuMj0Z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s55bi5s+2I/ACCL/Huj3Y51S6C+bhjRjchX4HBONvvc=;
 b=DQNXBEB5x08TsqM4Xc2segF9tW6pBcZ/JGU3IF5hey22uzpOsbYI1D2ErAkoptKfNwb07tXuuRT9/NykYrvAS5Psj4utBGjORPOh5uWL7078pykvuWR1QcFgrIlZnYafrAvJ0SutxaFDt29uzWrER2vicLTxDY2GmRLQzaBQiY8XhF77cVpwFmrhwmZg/kAL2gNQy3nXOftQLwBw6CZPhCOgKR9l66dtuPntv3lgqT77So1Y4cCtMmJjpSaGZ/3LsB+K849XuzPi2E901B4wNSTpb63WZX7XUz4Okkw6GBS82UkMS93Hv7mTkxAYKwsE6TtIl3q1HUQoWP4gJM5qGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s55bi5s+2I/ACCL/Huj3Y51S6C+bhjRjchX4HBONvvc=;
 b=IRxpYjrXDXYZoBI35OWtneX+Bu/hmX6WspQsIsNRc2rgAefPjdgnJ8tj8hpmxs5krj/v7ib2kvWm71nWt0DQq3tzBJyQxR5ZXrsOGGoMqDN8Oub1ak1/vMi9bkK6GxgDaE9FHU/C/9oQ/0jjtv+LljADjt9s7YAazqUinsnWrsbG33eoxa36fKEoPxq+W1hMxUUn0fXWkeJJtkPQ5+HH5cTF/htZ+AaLX2oZGXNg+Gp4Zm3yVzbkphmVHMADeTlVhVhU4Wz4XCTUyNmil1FJBT4YoqKWbUyADW+/rQD5Rd2MU5NPB4JZxKuzndILzaKWJuyyuxeqfdjuUEa5dDum3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 23:56:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 23:56:45 +0000
Message-ID: <64d20d0f-9d1d-4a33-8cad-4a3370fe7175@nvidia.com>
Date: Fri, 23 Jan 2026 15:56:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: Gary Guo <gary@garyguo.net>, Timur Tabi <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alistair Popple <apopple@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-18-jhubbard@nvidia.com>
 <4e36e160bfa53240987f65ba36cae8e6fe4d6e6c.camel@nvidia.com>
 <ac0338f2-6b7d-4b34-90a4-7be041682d2b@nvidia.com>
 <DFUECI1MI0DK.35F3O013QHAE2@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUECI1MI0DK.35F3O013QHAE2@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 82434936-6f50-40d2-46f0-08de5adb1072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RCtKMjRIdG1GV3IvbEVtaDU1TU5uWENIeE9LR0FoOHJqWHRKelpmSUlhQ3VB?=
 =?utf-8?B?QkJOcHNmU25oL1l4bkFEV1lkZGlrcHRTckNHejZBWS83a0Y1NTJVU2JZa0sz?=
 =?utf-8?B?TGE1QUtxZXc3aWdPWmtmWmNLYzF3bHFTSGlNK3Q2ZU1BWldQbU9IcDZqbFJR?=
 =?utf-8?B?K2tkRzBndThSYlFMTVlJSHBjRU9ITlhmTWVCdEd5eFJGbmJLT1FqeC9sYWJO?=
 =?utf-8?B?bmFmWUZydjA2UC9pK1lUTElnSGVFS3RCeUtIOFEwMjNNWE5xcXZQOFZleStq?=
 =?utf-8?B?aWYzRXkzSWpCbWxNaDVlMFY1MUx1aTRWc21uQXNlSXFYSTVtRXJmbEV4RWpo?=
 =?utf-8?B?cnlXbEU2bU92di9NRzd3djhjcHNqblBPdERGbTZ5eGZpMENlUjYzaXIzb2x4?=
 =?utf-8?B?V09HUjlzRWNpOTVCQ1EvOENlY21XbUNXcmkvRHEvdEpDZ25IRkgvSEdPc2RU?=
 =?utf-8?B?U2l4cm4yK1kwcmRhYThYc29LYVM3SlJDODBWWHFvbUhxVU8rWk5YWWYvUlhJ?=
 =?utf-8?B?M0tQQjA1K0ZPdkhXdUxTUk0rUHdLRVVzdzZ2azl1amtPaVdLOWhiVXMyZFo5?=
 =?utf-8?B?Sk9BNS85MkF2QnJLeU56RVFKVlBUZkxJTjUvZjNUNjYza01oUnlQa2h3YTlX?=
 =?utf-8?B?WU1VQnNMRDhsSkczOWk0NSs1YzhXRDhzM01nOEZXd3VhcmZ4TW9oMktoYVF6?=
 =?utf-8?B?S0ZuQUpRUEI4NWNZeWEyZnJWVGNOMzU1b0MzWnQ5SDBLdkJvR0c4bDJOSHF5?=
 =?utf-8?B?M2hpNnNBWExkYndCMnQ3Q01FSU5mbDhWaVE5YWF0UHZycy8xYmpoM1A0eVBE?=
 =?utf-8?B?WWVhN2x1ZVhCeENGMDJtWVA0dDZncksyQks0MHNPaTBXQUdrdmQ0bElLenRt?=
 =?utf-8?B?M00zVjZMbWNXQjZVMmZUaU85bWs3WjlVL0doclZQU2l6SXRQNjNyNEtFWWJ1?=
 =?utf-8?B?aXVRRDNHdTZtUDl5UGwzQUIrRGJsZ2xrSEh1bEVrQTAzOGpzWmNnaHArbTZw?=
 =?utf-8?B?Mm5ieEROTUtSRkxjL2ZKN081cUlEbzJSQ2VWcXk1RkltRWZtRTF2amc5ZmFv?=
 =?utf-8?B?VzJwcXNPam5zQmxFLzc0MEpyZ0dGR2pDc3dLSUNEeFhCdy81RnR0THJpeXFR?=
 =?utf-8?B?YzI2TkFtSENNRngyTHFmVVMrZ1VNekZyRXhEMjlQRGhsYzE2QStwYnZEMGh6?=
 =?utf-8?B?enlzTGNBSjR1ZTFJUzJkNitIYXh2dkdvc3FNK1JMdjArWEZ6cTBQdWh5UTBH?=
 =?utf-8?B?SVRHd1VWeFJZL2VLU0o2bzY1QlRuRkFBU3k0WTkwU3QraUJRdmJxZUZ2cXNj?=
 =?utf-8?B?TGxzZmdEYmxXVm9YbEh4ZWE1TytWbGJEOHNxalhjV1FHTUlrMFRlL25sdUZF?=
 =?utf-8?B?amFQZHVtTGw4cVZhL1hCMjFueXVETWZBRkhrTkdWT05EU2RJbUpZYzBURito?=
 =?utf-8?B?V1A5dUdwTmJDeG16Uk9mbVpyalhXSDNhTVdGRUY0eC9TZXdYOS94dkYraFNV?=
 =?utf-8?B?aEZOcmwvdHkvRzNpQ1IzOUhYZmxIR2FiNUVySzZtdWUrOHdVOVZ6NTNadnFq?=
 =?utf-8?B?c1MvOUc2aXpNdkdHb25xKy9iRE9JWXRTeU9rakZDdWJWTEdrdHpWSGM3dG4x?=
 =?utf-8?B?bzUxWld4akMwclhXUGNVN1hibmtVbzM5dk5IaWhEd29uRFg4UWNiNGdtSlV3?=
 =?utf-8?B?VlBsQ1l4TWF6WG5PUjRORHpzMDdVZjIwVGk0QzNoWGF0a0MwdE03Zm1lTEJS?=
 =?utf-8?B?V0VPaDhJUmR0L2JKNFRxcGI3VmZrRzN6c21sSlI1MlpXSS85TU5zQjIxVHJk?=
 =?utf-8?B?QXBsOCttWms4dk91Wnh4UktSVG5ubnpXVmtmaVA5YUpjN1ZKejdUWXRjanlS?=
 =?utf-8?B?QjZEZzN4U2xKUit3VFhvckIrUkNWdUo4djZKWmdiMWcwT3h3T3E5SUhMRlFW?=
 =?utf-8?B?ek5UWkpHYkdSTFdJdThYVEhYSHdsRWpEdllWN2FXNWtyRkhhS2Q3eDR5UFBW?=
 =?utf-8?B?MFk0UmFHTXZBU2E2ZnN6S2VjSVBqNTlXNGdFK2E4WE1lWnlZZzlUWWpZeFpF?=
 =?utf-8?B?Mmx4bjlQcHVaUS9GT1NvVmFSNjB4OTF1L25QWHdqakVzWVBJZXVnTkZaLzcy?=
 =?utf-8?Q?7hUg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRYYjk0am9mN244N1N6YjhUNkMxOHBvbTFYaG9YOVEvdVJrQkk3UllBTG9K?=
 =?utf-8?B?eGxFN1o1SnZmZVh3cmtTWjVBcnd0cXl2YTJteEppb0FDOUorZXRrSHlyZHln?=
 =?utf-8?B?aWN2K3p4ZW1lSUNwc0YyNXdjUEdMRHhSNm9WalFFVGE0ZnZ0bkdoc3VWRzZp?=
 =?utf-8?B?RnNHRzlVZFZmdElnVTZ2ZndrSVFJYzIvUGVmdFdpVW04L3BUR3ErSnhNek9v?=
 =?utf-8?B?SWNTUjZJbGV1MlFQNDRmY2dDOEdqU2hKOHpWOEJlV3RLbitQR01HMlVEVm5T?=
 =?utf-8?B?ajZhNEtuWG9hbFA2WmRJT3lEQ0pYdkpvM3d5eVF6TXQ0ZHlJd2dBZ0pRWjRR?=
 =?utf-8?B?WVZhZTZEZlVMRzI0MUFuYWdxUGsvbGpYeWZBZitOK0crYVhOb3BwOWFTYk1k?=
 =?utf-8?B?bC9QRUdPaU1ReUdzSVl2TTlNSmVYbDkxNVRGOS9kQlRTeFZ1ZDRCN1AxYjlq?=
 =?utf-8?B?UGZja2lSWURRSnV5bFJsRVNYUTVoeGdFeDEzekwzRk9EcVpqdFdlUHRlYkxv?=
 =?utf-8?B?OGg1ZWpNaFZoTkV3OWM3OGtzZkhvMittUkZhMXZOZjkxZlZJblF5U0Z4dDZh?=
 =?utf-8?B?YXE1VTUrWHFlNUNMMWRNMENqN0N5NCt4QmdCbFF6bHdLOHFLeGFiMm1Gekox?=
 =?utf-8?B?TUt3bE8rS2pQYU1kOFVuWkpRR29WNWw2a2owYUd5WXpJazczOEhMMWxRWEZn?=
 =?utf-8?B?bjJzb242N0Z6bWVHZGF3YU1TdmFNeVVrbk52bEQ4UWsvaGtFQ3VQVGxneldN?=
 =?utf-8?B?THJuQXlJeUcvRG9TZWVhYnphd3VrKzNuVGtjZnlWSXBubVVBdGkxeVM2Tk5z?=
 =?utf-8?B?eW5rOStaVnNBc3JwYWVPYzVka0pPU1prQ21PNUxrYnRhVkpKYlpMb3ZNcGN6?=
 =?utf-8?B?SS91Q0JlNXpQK0E4bDZoK1lDTzhQMnAvUkdUL2NZUDNvNllQTmZJWGRkSXRK?=
 =?utf-8?B?QkJnczBFQ0tFUkFDNHJlZ0NuNjMyZ0lqQm9iQ1pBcjVkWTZGV3NoNUxFT2NZ?=
 =?utf-8?B?OG1sOGEvdU9LeTZYeWdmWTZCR25rNzZ5aGtFL3dNWWpEcHB0Q3V2SUIycHFS?=
 =?utf-8?B?b3NCejQxbVQxSG5MVTBXNjBEQzZSZHlkZEtFUUx2Z2dUbGNPcFhZL0t5R0ox?=
 =?utf-8?B?dlloT3FKbk5aQU9CdVlRZXFRZHN4OXZzNXcyTU5SaEo3SHpuY1pxQnRqV1Jl?=
 =?utf-8?B?MDEwMjhDUjZJc0hQUi9sOThyd081NDc0YmlmeGtCNzZDN3hnamhpZW1LeGx5?=
 =?utf-8?B?aC91dllmRDFqRjErYlhnbmc2d3ZyN0g0MFV4UFVZVm9wQ3I0OTNQRVFEU1gr?=
 =?utf-8?B?TG9vSGZkT290NEIzRjM1Uis5MElsam55UEtwcTBzdVFLbDMxTEFhbVlFYVVW?=
 =?utf-8?B?d1lqYmdFVFVZYjJEaEhYVVV0UVdtZnpkaGZNdSs0YkhYQlhBUWQ3RG16RWR5?=
 =?utf-8?B?bHpNcDFaQ2l1cmZKSlQwMGVEWlBrRDBlWUlZdnNwWTU3d3B6T0hJNnhwU1R1?=
 =?utf-8?B?RmRJKzNYbFVrL3NLd01HbHo0YkxwazkvVG1lVWkyeWNuUURzcFQ1bTgrYW1B?=
 =?utf-8?B?ZlBGYWVZejJMWU1yMFRSMXhtSFhkeXdRckl0L2pXRExRY2QyajkycFBoUS9P?=
 =?utf-8?B?ZTI1VGlKMTN0VmhhaGpidk15QXZldi9laDhvM1JJWTZHaFRFcExUZ0tIMzVm?=
 =?utf-8?B?YkpxYzEvVVJLaVFHQWc4S2gzNkF1azVuYUtWakR4NnErTzQwRWl3MUhVblEw?=
 =?utf-8?B?VDNIdkdCTTgveUc2ditwbTdwb0hFWnFaQTFUN1pNYkxJZmpsbnovM2FQeTl4?=
 =?utf-8?B?YUFmVzhiUlpPb0ZndlZkSWJQbzBwcUl1SWhRUUYzemNXTU9Ic1ByUE50RDhw?=
 =?utf-8?B?cFJYYVhMQ3JITytQWURuMEpHOVE2Y0gyZ0NmenRydm4wek16TXNLNTZjL1pY?=
 =?utf-8?B?M0xXWWRkNTVPNFlNMW9UejFKV2lRd0NUOXl4dURYTS9RS1ZFNG1XSFBzU3NK?=
 =?utf-8?B?VFcxL3FsZGthMHJLdDBYMzg5Ni92KzJuL29VamVaS3RTeXRyYkZ5eFRvRWt4?=
 =?utf-8?B?bW9lTkZjVk83QzByN2F6a3k5cjU2aEo2L0tCUkkvTlo5MUY2UUJoTEM3REZm?=
 =?utf-8?B?eC8yaGgxams3bVphM2VlUUZjbGRlQ1ZFQ09mOTFwYmdVczI1b3czWVVJZHpQ?=
 =?utf-8?B?Wm54L09PcHgxRTZOQkFtb2V1RWI0czJ6L1ZHSlhwRWdvQ28zZXR5VnlqTi9q?=
 =?utf-8?B?b20rVWYyd1pFUnJSM2NkZjB2QkJGekRDS1Q1cUprTElYMStYamFUUjVuZ3pT?=
 =?utf-8?B?MjBBcFBRaGxNOTU2QXo2K3lBZlV4UlorSlNCa3MwLzh1aWg2WVgvZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82434936-6f50-40d2-46f0-08de5adb1072
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 23:56:45.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJOwucCPIh3rO0rU60A51Vc6ogZiuNCpAuo7xU7L4y/3H+EC4h4hcHbl/SOjpezGU/0da46aIYGnIxo5m5j8qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

On 1/21/26 8:10 AM, Gary Guo wrote:
> On Thu Dec 4, 2025 at 7:34 AM GMT, John Hubbard wrote:
>> On 12/3/25 12:48 PM, Timur Tabi wrote:
>>> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>>>> +#[inline(always)]
>>>> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
>>>> +    build_assert!(ALIGN.is_power_of_two());
>>>> +    (value + (ALIGN - 1)) & !(ALIGN - 1)
>>>> +}
>>>
>>> So this is just like the issue I'm having with .next_multiple_of() in my patch #10.
>>>
>>> Shouldn't you have a check to make sure that value + (ALIGN - 1) doesn't overflow?  Since I need to
>>> align up to the nearest const power of two, I could use this function instead of align_up() and
>>> avoid testing for an error condition.
>>
>> Const items are special: they are evaluated at compile time, rather
>> than at runtime. And so this will fail to compile, for values that
>> would overflow.
>>
>> For example:
...

> Note that this is only true if the function is only ever called from compile
> time. If the const function is indeeed used during runtime, you'll lose these
> checks (or, depending on Kconfig, get turned into BUG).
> 
OK, well so far, it's only ever used at const/compile time, so it
is correct as it stands. However, if it ends up getting used at
runtime, it can be enhanced in that patch(set). So for now, I'll
just leave it alone.

thanks,
-- 
John Hubbard

