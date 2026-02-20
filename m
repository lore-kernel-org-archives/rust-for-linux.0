Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E01A5B9E;
	Fri, 20 Feb 2026 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771630569; cv=fail; b=ZJNLDRI99/DiwZA/31jX093Ga0uirsCyA0hDIFHJESr+tCr/Z3fGVk4+sdY8MEGFy5Ot9aHEc5RZEPpAGS4lJHKLvsvq0RUW+3MjyOCKYQnfP0pIT4HzNfngXr1cfpLvoSoL8gWnIohGp3t27f+9fJqVyjO4AAzqqwZk92u2Dd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771630569; c=relaxed/simple;
	bh=BLBfR/GCT9v9WrLNl+h+tCb6yRwKPYYo8VT1rzlZcFc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AFqb1RyxBY0vJfn9iHhAuP0QnSFseK+0Oa6Cq5mEbm7XKzMHg6qtgwZpnwKc7js5NAfstS5h+caF7w/iyCUqUzLQ76HVTZBKpeErU2iHP7Esc9WAd5/x012wIB9uw10nNyCxNAN74CFSgXN2ugpL/GnJa6USJv3zQSiOZRPX4zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZPyxS27G; arc=fail smtp.client-ip=52.101.85.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZPyxS27G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7lYh5UpZqdQdYJtGfxASyAClRJUUQxbwREYsawXOoC7kgIybI7eXUkfNAz57Z8WcPGBb4leXre5bpuYyDTaZrorfsoCuCc2NK3jQzFoW/KhtLxhQjnr0R/kquvr/G3jS1yQuaq05bc3GPljFIEUIBAV/P1GtN0mUxbl/qKFjzyL+MEZ8N0SCSxxQ3yBEWKzpAnHoJjP6MN95dgnuYhmyFShyR8XGAYzi+CdIPel3z2VuGxjoW3DSLwoNEsIWW8qU6PWloCJ87vKF2Z1CyPUSIz3Wv13ETmUBKNCiA2u8e3HOIPeJwNt74wg+K7afqkcg6GcOQLbYtIvi2I7APwebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfoJEWnNCPntRmIYj5CPK2zTzFbCV5XecQd1OYnpJeY=;
 b=CASkD7BcvtpEHpVUYE7ys5Wrh40bm4QRrxT+ojAzk2x6DK1FpTRBVdKsb4NdahUKlYlUiW1BJrKYh6BEdVL3w4Lu4aPh0rGvcjMv/H/yW9KwiCYaoPRml3TLrLpfMWZhnQ7I9K47gNbuAo1SKIZFcAE/XzhsE9Yv/ChQFcqAOt2BQfOTpnbmu+7dKYSXP0X12R4iWpUJLpcXH73mYYnZpl801/2VfHApxwgg/J7Yrupx/Nm74qeJru+5hPXD2jtJfYBUE2dg2xJ++ruVq48M4SoK00IyNJReSpkl6WcRHfO6PV2IbKxukHXNCMkA3BYFBcCk8nymr8Kqau1zgU5I2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfoJEWnNCPntRmIYj5CPK2zTzFbCV5XecQd1OYnpJeY=;
 b=ZPyxS27G9WZpl9yUB0dy8eNdXGIpmp+wtA6tbRJXU7Rm6R8zHTrTKGf4ce0XNYh7S41kQyQISDkXKGmVusbR5bimkWpS4n9mGVw+HihQpbK5fkOVO/Wqf6L7Vf76yEeQI6rtTfBcufPLz5tJno/UmywQhPSOQRQMBnoDkonJ8HJG0rKdYO4DdaQ0IKT4sbh3pyfp8O6CHVErZ+2p2NxjB7igd1kcKDqlFA56UNZ2yti63ab7etvISo5jp5pbzHnvPPLvPIzXmK2CmpvwoB1HZYls8FPKSb+AgBipIe8kE3rrNnvFw/Lg9Q6202EKDiqU4kMv6nCu5BVjXuqpyxAvVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 23:36:03 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:36:03 +0000
Message-ID: <f4e204ea-a59f-485c-9e36-abcfca5caf6a@nvidia.com>
Date: Fri, 20 Feb 2026 15:35:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/33] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot
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
 <20260210024601.593248-25-jhubbard@nvidia.com>
 <DGHFXVMKDCYX.2WNLOCBRBFCEM@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHFXVMKDCYX.2WNLOCBRBFCEM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 133a5652-7d56-48b0-d189-08de70d8cf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0VYbldPZnZKbFZkUjRteG02T3k2WG5YekhTM2M0M2hiSzN3T0hZT2U5YzVx?=
 =?utf-8?B?WDN0aVhUaVRYdGNiNnFOT1k5TTM3bXhHcHJJKzhVZzY2RXhjWDY2M3RTRHNQ?=
 =?utf-8?B?YmRIaVRHdW41bkJESlltREhlL3hTQWszRFlldnErOG9MVEpoVDdrNFZZMGVZ?=
 =?utf-8?B?aks0ODJ5UUdoVW1HS2FFNXExd0FKTmptRG5hTGZtM1JvQ3BrTEhZWHRUb2xy?=
 =?utf-8?B?cEt3akplVlNRdzlJYlhoUktUcGF6KzVQa0VHNFlXZm4ybmZKK3BBSGVYYkJS?=
 =?utf-8?B?MFlnTkFsYzYxM2pUbW1jN1NBeDNTL3BkSG9LYWxTQUVyUHVDSzNJbkpzcll6?=
 =?utf-8?B?ck9saHlnMzN1OG5YbS9uY2lPZ2JhNDBSUmgySlluMXlTYmlmSTBTR1NjMWRJ?=
 =?utf-8?B?QnhoakhVSnlobFVPbU5WK2d0VUcreWx0YUtEdjhybkZWSGJ6LzBXTzFQWmkx?=
 =?utf-8?B?TFkxQTZsaFpiZkVndnRzQmVpcElzUUY3cU5TK0FiQjZOMGZYTEl1UGRESnIz?=
 =?utf-8?B?OVFRclNEYjJiZk5FazMyQVk1eGtud2hmR1BHd1RrVkVHQUUwUDlmTTRvMXcv?=
 =?utf-8?B?S1c3eWg2R3FkRUxLRGtKYTNyK09ZcGFxZC9HV0cvWkE1ejVLK0pKL3dhbnV4?=
 =?utf-8?B?WXNWTVk0ZG5sRDJ0TlErSGp6SDVsN1huWk8yY1RHMzhGdnNzYlh0VkFBbnYv?=
 =?utf-8?B?WVRFMDl4LzRkTzVBemVFUHp5T0FINnc2THAxNTlSN0trblVjUGlVNytVWW81?=
 =?utf-8?B?czg4d3BaVm45bWNKTjdBZXhBYjd4VXE5TjZQZmdQTlRwWURVVHdwZVhtV25a?=
 =?utf-8?B?UTIvaklRQkdOR1E4K2szeUFNYUdBMWQ3c2Jlb2FGSWtLMlVkVnJBcFZnY3JT?=
 =?utf-8?B?TFcxQU1pUEJGazdXcUdOcTMwWThZVjArQTNiVHJtUnIxcmE1UVcwQUx1Tm5T?=
 =?utf-8?B?VDY0ZWE4ZWVwaXIybndqOFJodUdRNWMyRkdzVzRsTUJPU3FTSGZVTmZFVmpL?=
 =?utf-8?B?eHgvdUlQUEI1VWU2Zkw1R2haMktIMWhQQTN3eEJud0xpcmJRY0VJZDRyaHFL?=
 =?utf-8?B?OHh4Q1lUVTIwdE1FRFVrMW4zL2IwdkhKMlBKdWNWZ3Ryc29BbEs5a1hyRkJM?=
 =?utf-8?B?RC9EQzRacHl1SzFGUzJ2eVhsKzdQd2IzQ2RYSHE3VGhsR3RnWEZ0V01zcTZu?=
 =?utf-8?B?THhsWkpmbUxkQWZtaDNqSHAyMTA0Z2JudkdWWXV3VWVBMmUwazdRVVEwb2xZ?=
 =?utf-8?B?c3NKM0FEOGpoajZTYUpyVW5ONm5jSWF6VG5yL0lSRGNEYThuMjE0U21SUHJY?=
 =?utf-8?B?QnZNbkxSN3NJTVFvTlZ5Q2x2bkZIazVJY3dJai8xeTM2djY0SXFORnJLWGQz?=
 =?utf-8?B?K0F0OXZZMXVSSWMvQWZOTnRaOHpRcWtTN1RqUWxMdnk1V2lYaEkwRHJ1VlZG?=
 =?utf-8?B?VWhHbCtBTkZjRVk2dWp1UEhNSlAwWFBaWk5XaVNLRFZDMXREWnNQcHZQNkE0?=
 =?utf-8?B?VzRMb1Y0U0pUTjVvMVdYWFBpRDZ5c0k3bkNQdndBaXptUDllUUh0VzJQemMr?=
 =?utf-8?B?NlBzT1EwOTBGaTdQV2dFbnpFUVRHNWYrdjc4WGNqcStZcHY2VTU5Zkc0eVdq?=
 =?utf-8?B?OG1Ec2hKcVJUbi9WT1NLdzBNQ0VYMHRrWTJHcm1MLzZtWmkwTFZjM3haM1NO?=
 =?utf-8?B?MDRMYnpYWmJCcnJyWkZVSkxqMG5Sdk8zUlFrUE0xUjU5a29mTENjWTZlM0gv?=
 =?utf-8?B?M0YrbEk1K3FlOGdEREJqUCtxOWUvd2R0ZjFEN3BNeUJRbXZMaHM5Q3pBVVFa?=
 =?utf-8?B?dTgyaVltM25sRDNxVFdYYlp4d3FXSHBucW96UU1HUGU2NkI1RERrYTdkVklj?=
 =?utf-8?B?Y2VucnJYdHZOczlKYjhjWUJkNGwwSVdrOXlKcFZKWGdZcUFoUnpEbG5oVU0x?=
 =?utf-8?B?aklzYnEwUG9Cd1paZHBDZjlyMTBKNWpDbkNFTGR5aGJxK0g5WUxoMDdHVHJG?=
 =?utf-8?B?aDROOXpCcjkvOG8va3pzU203WWdFM0tLbWxGY1JPZVZDT3NjVUFING5Hd2Z1?=
 =?utf-8?B?eFc3Yjh6bmQvem4wVmlxR1VRTDZ5L1VHL1RPN0NTNHdUSVZnL3NPcURFRklM?=
 =?utf-8?Q?nT6M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekU4OVZEWE5WV1BtcnpMdlhzZUg1aDR3RFJyTVk1SDk2OVNUUmZtWmIxdTdv?=
 =?utf-8?B?WDB2N3N6WHVuNkpyckZkOHVPNnNOMFg5amNrdzlPRUJnVlJRTCtycXRDLzBk?=
 =?utf-8?B?aHpvR0k0QVpVWTdONXBrR0l6OU1hNVhqZFkxYWJnajd6ZlR2ckFDSURGZ3Zr?=
 =?utf-8?B?SjYrbWxaeFZnejI4ZllBQXQzdExTdk5LczJMSWlQZ2YrWG43ejhPZGFTa21h?=
 =?utf-8?B?UWxjNnYrTnF1bDRza0ZHd1ZLSUhrQ1NsRll4Y3lqY1BVYnM2cXBTS0dSMWdI?=
 =?utf-8?B?bjdVSXBHbDdZU0hKUm5HWDU3SFU4ZmZRYnF3eTJFUWxTS3RlMnkxOGRHeXNo?=
 =?utf-8?B?aTFlMnhqSFdocTZVdXZ4bUpTWFJnbi9qUnJUQXpqOGhHWjlmd2pwTzl4clR1?=
 =?utf-8?B?TnZTckZNQzA3MUt0ak16dGNrUjEvQ1BqYlZ2MWgxTzc4d0g3VWpMK2JaMlRN?=
 =?utf-8?B?eE5ZdVZxL3U4alI3TFVyYkEzdk16Ry9oRTErRVVXa05DLzBSTktNN0dBV3hO?=
 =?utf-8?B?RGQyZ2RzVk4xNk9aejIwQkVHVkhOaXRJcTF1c2JNWVJ2cDVWYUkreTVJdHpj?=
 =?utf-8?B?VFpvVEUrT3NPMlJKZWwxZTZLQndGajJtdFhVTTBMNFlFU1ZkYmwvM1NSOTZW?=
 =?utf-8?B?eEZKUkhrdzc4OFBEdE1qc2xoUzdXc0FLK2tGQ2hNY2NYVGNjV2dVYkh0QWhD?=
 =?utf-8?B?ci8wRkJGdm1VeWFxVlhhREVhZ20wMStCcmZoZnovbHRGMmM0QUh4OFlZN3VU?=
 =?utf-8?B?YThwM3Rnc3pZYTE4QjFLUlRjNXMxNzVZMENSa0cweE8zTVdwbUNsUFRYNTZK?=
 =?utf-8?B?M2pWNjViNC9zdHhxUkV5MlJnTlJObWliMHhraDIxZEhjOXNyZDduanV4Z0da?=
 =?utf-8?B?MkVJSkpaWDlzbFZYYzN4WDIzMFZnU2lDMTJET2hBMUZheGE1cHFPU0lJQ0ZK?=
 =?utf-8?B?QUE5ZUs5Wjl6MXFyNXd4WlVnVmhYYWM3L1RIR2g4U1hqS0I3V2R4SjMvbnV0?=
 =?utf-8?B?cDQzc2tHYm9SVk0yOWtGRUhZcSsxWWk0Rjc1Z01vQldHckV3MzdqcDBYRGYx?=
 =?utf-8?B?aEhnVnNsUTVOY1pocFN2TEV5eXYvVTdPTnBLZk9TWmZOV1FGaTFLYkVmZFZH?=
 =?utf-8?B?bTRwOE9GUGdRamExOExiRTRMREx0dHJvTTZpUDVwb09EcTlSbENHcjM0WkRS?=
 =?utf-8?B?VDFNbDNpMlJJMm9KTVZhdFlQcEs1N0o1a1Q3cmpneEhQMXMzZGZCYmczM0pv?=
 =?utf-8?B?dHJBcDU2Z0lMSlFDeWk1SmoxVW5TbDkrWmRWTERpRUZXZzRiV01wbWVOUlpv?=
 =?utf-8?B?cHhHNHJJVjFRZnBkaEU5dC9vbG9DczRwNlZEeDRkMlcybDJxZ29tbFAwYis3?=
 =?utf-8?B?MlhDd3pwcDJYYnFvQ3RaL0xPQ0ZtUzRUa2JYaXZOK2RqaTJab0VCOUdacmZx?=
 =?utf-8?B?dnVjYW1JekNGaTJHTWZhK1h1QW9mdWhTcEhBbGt4Wjd3VXl6dk5WZ0VEcXJI?=
 =?utf-8?B?UXJodHNnV1NsVlhVMTRBc1QyR3dCUFo2YWNNUWthaDlaMVhqWm13a2l6cFBr?=
 =?utf-8?B?VTRITTZYemhBTGdoZzdOUEFhUnJRQmNuTEJRK2lsSmFJc2xXb1JtS3BHa2g2?=
 =?utf-8?B?emJyN2JLTTdtbkUvYmpsdGxVcm9qOXB4eHpCYVB5K3djU29MRjMyUTdIREhO?=
 =?utf-8?B?c0ZGMXIvVDRPTG84MVRlcDVzMEl6eStra0V3YldHdUtVK3pIQ0RDZ2FEd0kv?=
 =?utf-8?B?VGtDUWIyWXFqdi9KSUhTV2R6UWcxbG56VWNmZk9kQnBZMVRtU2l1bms4L25k?=
 =?utf-8?B?N3k0ekpqT2h6R3BwYURxcFlqZWhXMGlYRmVBcWFIQit4RjliMlpBVGE4STJV?=
 =?utf-8?B?dGlRYk1reXlIM1hpQW9hWXFWU1hNMVF5anU4N0h3c3V1eW1jbnVRUW51ZHd5?=
 =?utf-8?B?WVJZeGN4K0xQcEJ2b2Z5WXRmVGVnMnhmeElFdHRwa0ZKV0xUM1Q5V3V5RkFu?=
 =?utf-8?B?Rkg2M2xLVnBYRVRXNG9vMzJ4c1JnVVVhS3NOY2dhcUlHYS85aUlXdnV2aEFy?=
 =?utf-8?B?OW54Y0lpTzl6dXZFdUJjWFRGYnBNY0huKzYzcnFyRTJmZGVFWkttNHZJckhF?=
 =?utf-8?B?M2dsK04zeEFwbnJoRGdCZG9pUFYvVXhlS0Zob2JXU2V4QUh1Vm5zaVQ0ZVRN?=
 =?utf-8?B?VzBqOGR5d1IzOCt4bXhydVc2YnBIS2h2MFVxb0N2a2JpTGhCenBEZG1ZdU05?=
 =?utf-8?B?ZnNOL2VGWFEvSVJOZS85OFJvQm5Nc3RhSlQ2Wm1TMlFVQXBXRU9yVTRKR21T?=
 =?utf-8?B?aUNxaFFseSt2M21wcytXcGV4V1FKMDNQSUplaWpITWxFcmxNSG9FZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133a5652-7d56-48b0-d189-08de70d8cf75
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:36:03.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QhkqzBfR6caZUHgP10V4vWYICO/5SAsKDKReQpQ6vtR1yjViL5PCsm82CTFGJdZ6PV98JDzy2RI15l2LRSvTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118

On 2/17/26 10:16 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> +    /// Creates FMC boot parameters structure for FSP.
>> +    ///
>> +    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
>> +    pub(crate) fn create_fmc_boot_params(
>> +        dev: &device::Device<device::Bound>,
>> +        wpr_meta_addr: u64,
>> +        wpr_meta_size: u32,
>> +        libos_addr: u64,
>> +    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
>> +        use kernel::dma::CoherentAllocation;
>> +
>> +        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
>> +        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
>> +
>> +        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
>> +            dev,
>> +            1,
>> +            GFP_KERNEL | __GFP_ZERO,
>> +        )?;
> 
> I've mentioned this in another context already (where it doesn't work
> unfortunately), but I think we should add a constructor that takes a closure
> with a &mut [T] argument, so we don't have to use dma_write!() for
> initialization. If you want I can prepare a patch.

Yes please. I'm up to 37 patches in this series now and am starting
to worry about it getting even larger.

> 
>> +
>> +        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
>> +        kernel::dma_write!(
>> +            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
>> +        )?;
>> +        kernel::dma_write!(
>> +            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
>> +        )?;
>> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
>> +
>> +        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
>> +        // it obtains WPR info from other sources.
>> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
>> +
>> +        // Configure RM parameters (libos location) using dma_write! macro
>> +        kernel::dma_write!(
>> +            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
>> +        )?;
>> +        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
>> +
>> +        Ok(fmc_boot_params)
>> +    }
>> +
>> +    /// Boot GSP FMC with pre-extracted signatures.
>> +    ///
>> +    /// This version takes pre-extracted signatures and FMC image data.
>> +    /// Used when signatures are extracted separately from the full ELF file.
>> +    #[allow(clippy::too_many_arguments)]
> 
> Maybe we should just add a FmcBootArgs type with a corresponding constructor.
> This should also get us rid of the helper function create_fmc_boot_params().

Done.

> 
>> +    pub(crate) fn boot_gsp_fmc_with_signatures(
>>          dev: &device::Device<device::Bound>,
>>          bar: &crate::driver::Bar0,
>> +        chipset: crate::gpu::Chipset,
>> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
>> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
>> +        total_reserved_size: u64,
>> +        resume: bool,
>>          fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
>> -        nvdm_type: u32,
>> -        packet: &[u8],
>> +        signatures: &FmcSignatures,
>>      ) -> Result<()> {
>> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
>> +
>> +        // Build FSP Chain of Trust message
>> +        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
>> +        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
>> +
>> +        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
>> +        let frts_offset = if !resume {
>> +            let mut frts_reserved_size =
>> +                if let Some(heap_size) = crate::fb::hal::fb_hal(chipset).non_wpr_heap_size() {
>> +                    u64::from(heap_size)
>> +                } else {
>> +                    total_reserved_size
>> +                };
>> +
>> +            // Add PMU reserved size
>> +            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
>> +
>> +            frts_reserved_size
>> +                .align_up(Alignment::new::<SZ_2M>())
>> +                .unwrap_or(frts_reserved_size)
>> +        } else {
>> +            0
>> +        };
>> +        let frts_size = if !resume { SZ_1M as u32 } else { 0 };
>> +
>> +        // Build the FSP message
> 
> This comment seems superfluous.

Removed.

> 
>> +        let msg = KBox::new(
>> +            FspMessage {
>> +                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT)
>> +                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
>> +                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
>> +                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
>> +
>> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
>> +                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
>> +                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
>> +
>> +                cot: NvdmPayloadCot {
>> +                    version: chipset.fsp_cot_version(),
>> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
>> +                    gsp_fmc_sysmem_offset: fmc_addr,
>> +                    frts_sysmem_offset: 0,
>> +                    frts_sysmem_size: 0,
>> +                    frts_vidmem_offset: frts_offset,
>> +                    frts_vidmem_size: frts_size,
>> +                    hash384: signatures.hash384,
>> +                    public_key: signatures.public_key,
>> +                    signature: signatures.signature,
>> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
>> +                },
>> +            },
>> +            GFP_KERNEL,
>> +        )?;
>> +
>> +        // Send COT message to FSP and wait for response
>> +        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
>> +
>> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
>> +        Ok(())
>> +    }
> 
> <snip>
> 
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index f04e2a795e90..88b1546e3cb4 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
>>              | Self::GB207 => Architecture::Blackwell,
>>          }
>>      }
>> +
>> +    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
>> +    ///
>> +    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
>> +    pub(crate) const fn fsp_cot_version(&self) -> u16 {
>> +        match self.arch() {
>> +            Architecture::Hopper => 1,
>> +            Architecture::Blackwell => 2,
>> +            // Other architectures don't use FSP COT
>> +            _ => 0,
> 
> I think we should use a new type to represent this version and use Option, i.e.
> return Option<FspCotVersion>.

Done.
 

thanks,
-- 
John Hubbard

