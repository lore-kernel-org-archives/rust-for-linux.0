Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D52ED159;
	Fri, 20 Feb 2026 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771630010; cv=fail; b=SL7Lgf4Relf6BzuJNF+ofy7GBoTKBhnLv1uq26wtsB5BtgQ6YCsa7nhO8O5Xy1MsldUiYzYLRs+dd90z0FwUhOSrJ4TPzs9ZkuU9E7iQ2ZEKryMMUgtAC4S7vMdP9fkUVvz/Zm/1ZW5opK0fX8/J3bCHLnVdk7RdhXmueoS37n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771630010; c=relaxed/simple;
	bh=Gq3QkgfslfYTA25OU4no2EJD2TdUf7su4h/MlAEYCIw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tCRr2NdSLwRhRoECMZNSQBnlMeI7GgpLl3XpSlA0eAdSky+5AE8u9sofh9mCkcdrfUxJNr63zb1ZRwz7fpVqm9ZBhSAZlhttEbCvJoJ2hq5DR6cuUIWn3af9G4M5MxouBwqbHPt0ZtogKbn4KldBh2vUpX1iaSHZBnkdG1z/1II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gtI7pN+I; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gtI7pN+I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSlpyUC1pYp1+H/pZQ5wEz2aN0rN10/VE4+GmjtddV2Tu+Xghgi2PvVUUwjXFzncVbt/4KCg/KaMG5fMW3p9OjdQ0jQCmFx2NU57Hv0ZZldEV0NGss6PlIVNvCL0v9x2U1KL8YfoZx8ZwQCve0ifiDETQTMOFfFH/YPYKwXzCgQHdPJqU4nKh/2C10XC1V+pzV2flZR/3iDh1/7F7TfGc27SV8uPUUpYX5wVF5ogulPbMwAyBhk9CQMdLKwy5GzG/W9I1vughCatIwDExCteshazJsJMfbN1tEZ8E6qcHnMe12QUd6mOjJ59fVLeAdm/yk3INpV69+faFPB/6vXWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0MKGVVzUIX8bjTSPwY6Q5pSERXzWcpA9uYH2H58Fhw=;
 b=m+sQtO3cOJdjcSJpLs4EZ+bJIdpD5Ekol2oHMXiEJujtTHi987qZJJFRmCBY6zgv3vxS9OMHHUNhZ6YZP42NLvYu14r5ifTSO3RT3sL7xb6snc0oX7OZ1ZEDDOFJOIdeyixKMX6dN/dRO2Ze7O8SfN7a6h6KKiL9f/kxu/NkuK+eKVTs6CZXyz64goUGw/MQ6q0ymZAF+vOOCQeR3GRnaHJDi1NAbcgOGfhGZuEnhenwIsD3YCrmzLAmN3gp2Kjw8jN8HumKVdUGdBPe9pq3/yhO7p2QDHODkO2m5cxHYKgFCVC3IOTJ2brjhJgD58qsPm3EFMu3SGZVgXhg+lufzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0MKGVVzUIX8bjTSPwY6Q5pSERXzWcpA9uYH2H58Fhw=;
 b=gtI7pN+IRSJjozALmUciKKJ3/Z0YUBzhtXGiUfx+bttwWglxTsrupkFHpW+6W0w8iwbRk1HRJyB36lSiONRa17rplCGwWpRGL9sV3ojwSV5LyuUSOVWBoq/gxOkPd7YsnQ5/nDKzBFiCOLE2PmLqyHa17eRiceTzyjfhvzIP06ad1894t7vF1BwJr9QErXBd6u4H7xbNs9QM4Zcaptvz93Pwtb80dmOkPsgWU+5CPISjBB0kuywR/FMpsmco5gd83TPCzUvP8m3kwZSuewVDGaRP4XfRe9lRyj5M9QyNVxRnJJCy2Z+QmIrtHHyn9KX9CIxsa7slcMzMHY/g8hqbEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPF1394451C7.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 23:26:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:26:43 +0000
Message-ID: <31766349-0032-43b9-b520-bd748649d0ac@nvidia.com>
Date: Fri, 20 Feb 2026 15:26:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/33] gpu: nova-core: Hopper/Blackwell: add FSP secure
 boot completion waiting
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-21-jhubbard@nvidia.com>
 <DGHELWT4WZXI.3JE0RQF59ZFZL@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHELWT4WZXI.3JE0RQF59ZFZL@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPF1394451C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2b7661-4eca-4df7-e534-08de70d78218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmVtbEFvTXE2V2NXd3RqQTFMcGZHc0p6bWozdk9ZK3VmK3JWQTRVYXIwYVBK?=
 =?utf-8?B?UXM4N3RyTnpKN3QvOWhXMWZabEt5THR0RGU4VVRKU2JzTFJyV1ltMUtUeG9C?=
 =?utf-8?B?Q2w2Q1hoWFJxNnpwT05EZ3pJV0FmLzZiMXFlOFF6Qkk0TVRvVUVlMzVVZ0kz?=
 =?utf-8?B?bm83eHppbkJDUWttRWdiejlGVmgrWC9kTjBJME1ldU1EMC9ycHJnSTl0Q0V5?=
 =?utf-8?B?N3p5VUwzeEZvZm8xb1lSS3Rtbi83bW9jNWZCL2pwNzJHOTlaU0tRQmo4cGlG?=
 =?utf-8?B?YTlPQWhTYkNNWUZqbjB6alFaSFlwbW5jSVk5dHVWSndaT0Y1OGVPNGRtODc1?=
 =?utf-8?B?TkpXWk1McU94dDMzejFMdWVES2FweDJCcWU5ZDBMSktoNjU0d0V1dzBrWDlY?=
 =?utf-8?B?T2xnU3VGTWhXMmZHOENCUXpnV01wL21LQktCbkZzKzhWTlRqVVovZE5QS3Vs?=
 =?utf-8?B?SzFRcmtBeHhFS2RHRGVkc2RwaURiaHlhQlYwV2F4aHRwNWdGNjVPN2dZZ0xr?=
 =?utf-8?B?NldPbHo0Ty9ydEQ5TS9RcVBXcGNBdFc2WTZwbHVpOU51WGg3TmlibVFHV2pT?=
 =?utf-8?B?SktHbDFnNWNpV1BHY0NsYjNad0RRODVnSFptUytWMW1oRWZ5V05qdk9yb2RQ?=
 =?utf-8?B?ZWtURWhKQVRyWHhXZy9kY3lBcUNieElKUXQ5MHVnZ3RnVUQ5LzluUVVadXJp?=
 =?utf-8?B?QStRUnoxK25NajlOenZ6ZlNvdllhSzlVb3luSEZublVzRkhOTDRmSW9WNnJk?=
 =?utf-8?B?blNkb0hRbWJoZVowb3RLNGhYcGZsSjliODhXMWxsQ3Q1ODFDZmdxT0FoWGp6?=
 =?utf-8?B?a2ErbGlOOFQ3YWp2enB5bWxTeDB1Q0JudzBkRExiVDRUdG9QcU12RmltUnJZ?=
 =?utf-8?B?dURPcmhiakp5RUx5SUtYMGFsb2hzWFI2VnRtQWNnTjVKdWgrc1I3OUdiNW9X?=
 =?utf-8?B?S3g3c2JRZE5YNEVZY1ZyakpFWUYyQ1NGVWF5Wjh0TjQ4Z2FqU3pzL0VGUW9v?=
 =?utf-8?B?TW90SjZUaFNxMk4vODhFM1BlZU1Bd3lveXppSG1US0FYdVpVd3psRFA4bkNZ?=
 =?utf-8?B?U1ByQTVkM2wrZjlsZjg1YUlLTzIxdHdIaXRSNFMzNHA4QjdBUis2MHFrUnJY?=
 =?utf-8?B?dGcrMFBDVFdFWHlkcGs4dGRkVTZuM3pWWml5elFKQjd1WUg1S2hZZWlHOEh1?=
 =?utf-8?B?ZUhTWTN0RDIycEwraHpFRUsrVnFvVVBPMkp1enBMSWNnWXI1bHpHdmlUNVJi?=
 =?utf-8?B?ZkJsM2VFT0RzYkNYdDBiUHJrUkN1QWV1MXhnN3hGcTVsZkpWSTZmVU1kOWMx?=
 =?utf-8?B?dW82WWY1SGhMRGR2cFA4aE9adVBhWHIyVmJuSzV6UkV2NjhzcklsWWU1dDYw?=
 =?utf-8?B?TGl4SlRIMFBrVkVrK1BKK3I1cVdpTzFDTGkvekxwSmZOSE5Nd280OHBpVFBH?=
 =?utf-8?B?S2pqZUZucHo4Z05QKytycUhxdVR0Y3F4M0lGSStxR3Q2S0NrMytpaVh4V0M2?=
 =?utf-8?B?QmZFNGUzSEZEU0hzQXZWVStJWHA5QnZ6Y0NuNXJ5VC92U2twcWQrV1ZyTFly?=
 =?utf-8?B?WU1BSDBrUDFncWhDUmlRT1lxVXhVTlJiRjZFTStDaGI5TFNmTGFwelBSTG1r?=
 =?utf-8?B?MEplTEZCc1lXRmU3d2o5Yi9PZE01ZlU4RlZQNWl3N293OHRnSXBkK29UenE2?=
 =?utf-8?B?bUd3ZVcwL0tZRUExR0dvSnM2bVc5SVZWUWp3ZU9xbDZxZWU1Mi8rU1JSZkYr?=
 =?utf-8?B?Tk9ZNnU3eEpoZS90SDFoaVRLbG1obXFhaENLVFBVVFBvcUkxd2E5QnQzSVFW?=
 =?utf-8?B?Njg1cE5nVlhuSWduV3NYejFFb0tjeCtuM0JueThhcC9qeHVoZHZBZFo2RGkv?=
 =?utf-8?B?OU12NUJ2NnEwTWREZmxBUjNVaDFXclJhamU0aURJN256ZjZzREtHTmFHQ3Vo?=
 =?utf-8?B?ODhSbzl2azNvN0QwZ2FsSGl0S01GcmN0TkwvR3Bnd2RDNFZjcU1LMFVoQkdV?=
 =?utf-8?B?ejNMc0ptYXJjQ1VwQnRxSi9LaDg1M05RQ3lqeEhDaUJPNjlQZ0paUHN2QlUy?=
 =?utf-8?B?OC9pUzU3b1ZMVU50WFF3ZCszNW5xZUdKUEZnMlNOejFhWEVxakgyejZzSUZn?=
 =?utf-8?Q?exR0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzAzdkVpTVBXeVViRUtPbkVoTDRSb0diNDRYc3dZT1gyTDBTM3Iva3ZzQWMx?=
 =?utf-8?B?Sm8rYnZyY3Q4Q2tiejJSOFo0NFdRakNWempCc1NKWkc2TExKaUM1cEJIVTBK?=
 =?utf-8?B?TGdXamlUTXJjT0JOTjRYV01UOFo4NkNJdGIvQ1RRZTJxcXpHL1hMT1pncFpT?=
 =?utf-8?B?RFg3S3drcncrRjl5WG5HNENkMVZDak8rQk44VUlzMVJMNUxtd1YyYzZrblBF?=
 =?utf-8?B?dnVNY3R1dnRtWGZrcXhNdFlaeFR0OTBPVGVsdkZYS2JnRC9nUlFaRy9zb3Bl?=
 =?utf-8?B?OUVPTVlBWitDelViVnkyUW0veHVjemJWTlVwUW9QM09XeDZBZ0FIajRBbU9t?=
 =?utf-8?B?QjRuaWFSSHkzRmpyRjFuRmxlejAyZlRsLzUwTFNuUDJQRlNTOFV3R21XaGV6?=
 =?utf-8?B?RkFzQllxVmM0Tkp2c0IxQ01NYXRnVGt6S2QxQXdVT0lwTC9BbC9qMGJPK28w?=
 =?utf-8?B?M2Q1SzJ3NTZvL0lIMmw3bDB1aHovdkRVdkN4SFpjMTh2bVdkZHd3UDJ5TGdm?=
 =?utf-8?B?NVNDT3pFaGF1Wk1JQVJYajU0akdzZzY1QmFiUW1HTEVwWm9JeU1tbG9hR1Aw?=
 =?utf-8?B?Ny9ZOVgycGpBOEs1UVZVSUFNYndOQUoyYXBMZzl4OHBKaGN5bUlGU3hkM2Fx?=
 =?utf-8?B?WFhDMElOSFVLVkJybUowYlVKdXprZWQzTXY3N2ppNE12bzhqN0VsVmoyNlU2?=
 =?utf-8?B?eFJsK2NJclBXcjY3ZENkdlJOZ0ZSR3o0b0NraVh4QlJpZE1nY0VVN2tTeUkx?=
 =?utf-8?B?SzFNdnpHWHk2aVU2b3crem15WXpnQzNnd2ljRjBHY2VFUjVpN1pSQTVIWTZH?=
 =?utf-8?B?TEphQlowUkh5MlpvRVo3NjJvcjZKak1hekh4d1lleWh4Q2loZjBML3VGQUY2?=
 =?utf-8?B?QkpZKzN4TmJlSkgwN3F4d1ZGeHB1dktaNUlyd20yUURTaS9rWVBzK0lwaTlV?=
 =?utf-8?B?cHNLdDd4ZEpWcWxiSjRRWmtVRWtYVk5YaEIwSEViWkVrVi9FaFMySDkySVkv?=
 =?utf-8?B?V1ArZGlubXlWS2p1S0Z1ejgvMnpwVk42MDBmdjRQeHBib0J6TmFlaEVhSUxH?=
 =?utf-8?B?U2NqcXVvVXdESitWWGQyQ213OVlTTmFmU1NCeFUzRGMvdmY0OVoyTU1lUVp5?=
 =?utf-8?B?K1BXc2NHellmZ2w5L2sxaGJkekxmK2JFTGZkR2MrZVR5Q1Y1TzZOeHZUV3g3?=
 =?utf-8?B?aWluQXExWkJBcjFkUUlIZmZvNXJLeTNISDRsKzNmYlQzQzAvMnJEZTZEdnoy?=
 =?utf-8?B?YTUrOHZxdUxzbDVBbHVnUzIxWXRaenZJMERPekVXT0ROL2d3bmVINEdVUHVp?=
 =?utf-8?B?UU44OWxaSUVOZzNmeHdiTm1hSEdsSXorcktuaURoL1N1cTJNOHNYOU9SWFQ5?=
 =?utf-8?B?QndWYmQ2V1pUQUwwR0s4V1BjZ2J5OGd6R3F2TUcwQ1kwUUcvVkdIQUtvaUV4?=
 =?utf-8?B?MGJpUllZdmNYMkZvS0xCWHB5NjRhd2FVM3hUYzd5aGxDTXd6T2s3N09DTGtR?=
 =?utf-8?B?d1BwTzRjN2I4MUpHOGY4ejFPK1gxREErcUxTMkVxVDkwTTUvYS9aUStha2lS?=
 =?utf-8?B?eUlPOElrQm1lSkhzQy9tSGdVb2t5YjlrQlR2ZWR6YklNQ2VyS1p4RThwQUYv?=
 =?utf-8?B?SnNuajN6am04WFBLTTFxaCtQeHR6ZEVtUDJDZnJDWU5La0Y4SENkSjFiQU04?=
 =?utf-8?B?dEFxVlB2MVdadzRJaGU2Ni9uU0dOQ29PT0dySkJ2WUJpUElxVDVnR09TZkNJ?=
 =?utf-8?B?N24yTUR1RmJZVnAwd295QVQ4bWNZbG9SSGpOTWdXYXBrKzZrL1JxUHp2Uzc3?=
 =?utf-8?B?WEFYWDNQVi9TT0FNbWEvQ2tTdEVMSnJ2YTFJVnppdGlJdG80cTNrOWhDTGRk?=
 =?utf-8?B?eGhEa1ZuTHZTNmg1U2tudXM1ZlJnbDdqaWdraStUL3RaOGcvWVhTRzhuWkpG?=
 =?utf-8?B?VzVOVFdPazZoQUxLK3Z2enU4V2FBaS95VTROdzBEK0pFK2dWckdlUGVLT256?=
 =?utf-8?B?VHcwdHNDRkc2U3Z0ams5UXpXaDhuVGNNWHhWTHlsTCtXcGxnaUpjNE95MDBl?=
 =?utf-8?B?WThMck1FWmVQS2lvbENQbHZRVndGVTFkM2J0dVJIWUdtbVFaNXVQQkpCc3lw?=
 =?utf-8?B?L2xnbnlCbk1wWVJjeGwzeUpnZXlJdFZoZGZQMGM5T05lRndtd01rQ2RBaTBh?=
 =?utf-8?B?TzJNcDdnb2dkb3dlbUxjUkxUbURtNFlCVC9iQ0dUNGxab01QV3I5WDNiaEFp?=
 =?utf-8?B?czB1cG45M2FkSUFvMTZUZnNjbCtFQVM1eXZwSXJpRTBKeWZFelJHYmw5NWRH?=
 =?utf-8?B?NDEyc1YrSnVCNUNRNVNqVFp3cXUwb3ZiRzE3REU2YVRodFdYaVQzZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2b7661-4eca-4df7-e534-08de70d78218
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:26:43.7869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB/v70apB4AwPxUt4OlQZhuCL3JsQJX+i1iVQNc/KxSAAdbyAkDYuYw2+iT1MPshF5w2NDP9pAEawxlrfMGKtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1394451C7

On 2/17/26 9:13 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> +/// MCTP (Management Component Transport Protocol) header values for FSP communication.
>> +pub(crate) mod mctp {
>> +    pub(super) const HEADER_SOM: u32 = 1; // Start of Message
>> +    pub(super) const HEADER_EOM: u32 = 1; // End of Message
>> +    pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
>> +    pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
> 
> This looks like it should be a MctpMessageType enum instead.

Done. Or it's moral equivalent, anyway: I've overhauled this whole
thing, put it in its own module and file and patch, and used types
throughout.

> 
>> +
>> +    pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
>> +    pub(super) const VENDOR_ID_NV: u32 = 0x10de;
>> +    pub(super) const NVDM_TYPE_COT: u32 = 0x14;
>> +    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 = 0x15;
> 
> This seems like it should be a different type (or even types) as they are
> specific header field values.

I think you'll like the new arrangement in v5.

> 
>> +}
>> +
>> +/// GSP FMC boot parameters structure.
>> +/// This is what FSP expects to receive for booting GSP-RM.
>> +/// GSP FMC initialization parameters.
>> +#[repr(C)]
>> +#[derive(Debug, Clone, Copy, Default)]
>> +struct GspFmcInitParams {
>> +    /// CC initialization "registry keys"
>> +    regkeys: u32,
>> +}
>> +
>> +// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
>> +unsafe impl AsBytes for GspFmcInitParams {}
>> +// SAFETY: All bit patterns are valid for the primitive fields.
>> +unsafe impl FromBytes for GspFmcInitParams {}
>> +
>> +/// GSP ACR (Authenticated Code RAM) boot parameters.
>> +#[repr(C)]
>> +#[derive(Debug, Clone, Copy, Default)]
>> +struct GspAcrBootGspRmParams {
>> +    /// Physical memory aperture through which gspRmDescPa is accessed
> 
> For the whole series, please end them with a period. Personally, I don't care
> too much, but it's a convention we have for Rust code.

Fixed.

> 
>> +/// FSP interface for Hopper/Blackwell GPUs.
>> +pub(crate) struct Fsp;
>> +
>> +impl Fsp {
>> +    /// Wait for FSP secure boot completion.
>> +    ///
>> +    /// Polls the thermal scratch register until FSP signals boot completion
>> +    /// or timeout occurs.
>> +    pub(crate) fn wait_secure_boot(
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &crate::driver::Bar0,
>> +        arch: crate::gpu::Architecture,
>> +    ) -> Result<()> {
> 
> Please just use 'Result'.

Fixed everywhere. (And more than once, since it came back a couple
of times during a rebase glitch just now, haha.)

> 
>> +        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
>> +
>> +        read_poll_timeout(
>> +            || crate::regs::read_fsp_boot_complete_status(bar, arch),
> 
> Let's just import regs.

Done.

> 
>> +            |&status| {
>> +                dev_dbg!(
>> +                    dev,
>> +                    "FSP I2CS scratch register status: {:#x} (expected: {:#x})\n",
>> +                    status,
>> +                    FSP_BOOT_COMPLETE_SUCCESS
>> +                );
> 
> I don't think we should have print statements in the condition closure. Even for
> debug prints we don't want to spam the console.

Done.

> 
>> +                status == FSP_BOOT_COMPLETE_SUCCESS
>> +            },
>> +            Delta::ZERO,
>> +            timeout,
>> +        )
>> +        .map_err(|_| {
>> +            let final_status =
>> +                crate::regs::read_fsp_boot_complete_status(bar, arch).unwrap_or(0xDEADBEEF);
> 
> I think read_fsp_boot_complete_status() should just return an Option.

Done.

> 
> Also, do we really care about the actual value if we time out? If so, this won't
> work reliably, i.e. final_status could have changed to
> FSP_BOOT_COMPLETE_SUCCESS.
> 
>> +            dev_err!(
>> +                dev,
>> +                "FSP secure boot completion timeout - final status: {:#x}\n",
>> +                final_status
>> +            );
>> +            ETIMEDOUT
> 
> Even if it is the wrong architecture we return ETIMEDOUT? Actually, since FSP is
> for Hopper/Blackwell only/plus, we way even want to print a warning and use
> debug_assert().

Right, I added a debug_assert(), and removed the re-read in the error case.

> 
>> +        })
>> +        .map(|_| ())
>> +    }
>> +}

thanks,
-- 
John Hubbard

