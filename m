Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890310E4;
	Fri, 17 Jan 2025 00:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737074745; cv=fail; b=AWgmL+TObH12Jq4+cHI7fZkqphZ11gfYn1XPu4QHGqhLW2dWKHnWrlRJfz7N2T/L57YJgR0nHrn1bvOXSjxdo7WFalnvmKbUIxVmWyiWn56lzO9CM/LsNW/2FXzhEQpe2WXPbCROjuUX1MY+puTnmbdN4XgGKAlRPxMQjMCqaL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737074745; c=relaxed/simple;
	bh=I8sbw8AHGPT01gUgM2Vw5vZG0Hr37lsYw2RPgIdX4xI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODfHgBdsb2ml7ODiYZBuBdMM33fTVAwbzUGk/ikz2NuOOl+ZAGurhgcA1YfuHUURFokb4AbKnVDIciNXiYotl1cDFnoc4od2Fc+TYRLBHQiJdF0/2IotHQvdD1JRzgOsncLqaDsrR7yK0+AytW7uWGSfdVxPXFvcsmcZGQtog44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZFdsZnBp; arc=fail smtp.client-ip=40.107.101.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZFdsZnBp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL+yTSo2ZJOMjdhxOPxj6La6hkoP31kAHuyaE/umR1GJNPadxFDPE8KiB1//nAdulpcmNdozZ8cJc0qmwynav8hnvGScfphPR88JwcSZw1xM5eX4ots0o2qIULyDE8Err+1pvxdnVdUCbF2eiM3wvH2kXhSZSNvdJ/Q4osqjTa0k0zAaRnUSWtfJq+engOWVhx2m7vJifD/b5pSSM8rCc7BOvhoej7h7/W7RcFWzey/1EWNTJ4kyVrkKYQmVnqd4DrfGNe2aY91N2SMk54V8QAh7+gXNU4I/eaWIfG168IUpNxaJKQ1CCdpDCl83ymOCvl/hHnjdv5sq5QXxZz78jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpO/5yfrF3LrIbQrcRlOULmoDX8l1PDSiA8Usp56BKM=;
 b=k+PSkhzPoy4vzKGCK13bGerTQ3LKCAEbToFc6PDzXHV9KUeom/Z2Gy0skSb3LtutHaqWaZfbwpWTDsiUsjHG4ipCtRaK1amwlSekXXrSfJcJWy7dFMMCGjc59VO+1xmI4jOrGrl4BKuksvTTRjvn+lbIBSX5Xs9hclh5LjG9GLl0SvpiwbzStHBRUi7yQCZuzutf9CGLw6eUA1aINPt09Rh8KXgmLQdqtIaktiUwYz/er740c7DawOSxJ8zvcMzYGhSnT7Z+9y8R2tmJicsMnlKD7CnY8M3mjQ3gv4V51LaanUCAIaWvp/wxKSp7O3w5Vc0kMhebA+msvLn6nsb8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpO/5yfrF3LrIbQrcRlOULmoDX8l1PDSiA8Usp56BKM=;
 b=ZFdsZnBpUK6KYkiR1J+eGME7GqfkIaIEloosGXCXb/d1BR5OFHcNGWbl3wKC/eW78UkxLjTT7q2TU7mnOi7FYU60QijIWvJlS3U8wuUiTjI15/eLFue2wKSDI7mSBeFUouzem0EGnI8mkQYY94nPJb3sweXF2j9GuImYD5zllcMzCgmEtKK5cXqRDqUPJKvAp4DsGAzkcWFk8H+YfioI8/Eif2YHL0IlGbMNusGNARrLCZ51+3jw+Nd6dCTtrF40h1iAoFRuUyzOrc8HXz1y/n5dwLSOrv8Tf3jakOSQJbVcoUGPY5JbLiWOmlAdQofJBvCizYgdravz9TJycN3wCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 00:45:41 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%3]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 00:45:41 +0000
Message-ID: <a5f26615-b27d-4e7a-a371-0bf8cba03d2c@nvidia.com>
Date: Fri, 17 Jan 2025 11:45:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <20241211-vma-v11-1-466640428fc3@google.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20241211-vma-v11-1-466640428fc3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: b86175bd-3eef-44f0-6811-08dd36904477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2YzZDBiSmJLKzFZa3BwR2Q3aEIxaTRqeDI0clB0akJzZWZYd1AzcThOWTFS?=
 =?utf-8?B?MzRONTI5elZWNHZOdkxYQnJ3KzVITWs3bTBoTzdqRGFaUHhpOTdHYmhmTnFx?=
 =?utf-8?B?dHpVUTYwOXZYeTVSc1BGTk03ZTE0NU9oSEk1cncyTklLVGNLOVJLYjNmWmFX?=
 =?utf-8?B?aXhrYnlDVDF2ekgvTmJsdXl6L2Y3WHpya3d6OEpqTWdQb0R6RGk3WVg3ZTdR?=
 =?utf-8?B?MjlGa1QxVDZWU0c4MUFybnlrbWFiL3NKRGc2Q1E0UDlnT3NGbUdHbTNQdG52?=
 =?utf-8?B?WGY2REFkR2dxMVkxUjN6ZXpFSjQxd1lOdkJsWUxTQjRHa1lQUzFVK2RmSlE0?=
 =?utf-8?B?bzlKaDdib2FMckppOWNTTWRkYUh3VFRoK3JHREwwRmxHQWJSaHVNbWlIaWw1?=
 =?utf-8?B?R2tSM2JOcWdVUzFZMERWQ1JGREh5azVRRXJXRVp2R1V0b011TFFZSGhvMEVv?=
 =?utf-8?B?dWZrdWRaS21OY2d3SEhKUVRQbWlreVBZSENKa1ZWekZmT05yVUxjM0xna2JO?=
 =?utf-8?B?ajFSYVdHVDM5d2dVazVRcXRxUm9ZcFlvbmRFMDJDMVhPZEtjQWlhSHdyTUdr?=
 =?utf-8?B?MFE0MEhRUXN6WXV5Rzl1QWpvSENTRDVYSG95UXVJbFdkd1Z3eklnVnFGdDQv?=
 =?utf-8?B?NjZCeEZublhqK0JiSDBSaDF6QllFNjNvVUNVUTNYK2hLbEFEcFdtTDl3dEhK?=
 =?utf-8?B?QzhPTVB5T1BkVm4xaTlmMlZYVWp6dGtoT2lkYW0ySHBSYnplV1p6ajFSbXBN?=
 =?utf-8?B?Mi90QWRPa0o3Y3B4Qm1SQ1E3SFpkbzR1eG9jNzBYNSt0dWFPVjhaaW1yT1Ax?=
 =?utf-8?B?bTBuQ25ueG5Wc21mZEVSY0gzeFdZTURSeElIdjNoYW1IWGVkakFqdENXQnNI?=
 =?utf-8?B?RmRnR01lOHU4aDhPeTUzSEs3U1NNaVpuWjdJa1ZMZXhWbFo4dlVLSzYzZ3dD?=
 =?utf-8?B?WXFVT3lvajdMYS9Db29rOVQzaGZ6eS9FY2lQeWU2L2V0dTB5SmI0L1JpcGx1?=
 =?utf-8?B?d3NtMnhYdjFQWFMwWEpZSEowK0J6blhsQ28wZnluWGtIZ2dzYTRpckM0RkR0?=
 =?utf-8?B?ZUZ2NGhFU2tBN2xiYXVlc2VPSTdCSnZYbXZCNXRrZGYvR3NXMTZtUjA4dEND?=
 =?utf-8?B?RDNicDc5MUpJbU9RNnVBL05SQUdUbVU1em8xekI4SFBnQk1lSmR5ZmNnZjlk?=
 =?utf-8?B?Y1hFWVVwWGQzWEsvcHdIVUFqZzVoUE1XMGFvc3pjU2Z5Nlc4aTA5Tlc1TW9r?=
 =?utf-8?B?cDdVQWM1QmlSOHZtRVlkaWpCS0JMV1FXc1REWEgxMWdIenAvSXEyc0NUSW5L?=
 =?utf-8?B?Z1N4WmlPSDVjTzNDN3NoaFZhMmcvcHI2UUJSZUVwK0RBMHJ0WnFHalBoVnNH?=
 =?utf-8?B?TVY1bTU1RWpwUXV5M0xsNllRVVROWUhtVms4UFRleitXYmsyNzFnU3lTdTJH?=
 =?utf-8?B?QUkwY0dVS05lbFpIdGRhYmxqMzZsTWRKbGgxc0p2VitkUlg5c0dBOGh3L0F2?=
 =?utf-8?B?SWRjR3p5YlNoZzlUZ0N3RFY3NlBlRnJWMmVmWnM4VGlET3RiQngxOE0veUZv?=
 =?utf-8?B?cFJnYm1wYk1JMWdGRjdUckMvMnpJR0Q2RzdKejhYRUtVZWk0d0RtUDZMRko3?=
 =?utf-8?B?RFBGUVA3Qi9xdW9BZWtZUGEzaTRJRk90UkNRdkIwMFlHSjRaZXlJSUhxVUFy?=
 =?utf-8?B?N3RyTjI5RnI1eXY3cGRkMFdNV0FBM1N1Rk5ISnZ1VHc3M3BhTVBSeXZHYkI4?=
 =?utf-8?B?YkxSN1BVc3hMYWJ4cloxbDFPaDArT3FhcHNNem1VNG13N21YOGc0REIzNGtu?=
 =?utf-8?B?clFmaUtrN3ZlZXVWZG00UGZRdVI2TVVuT3AvOS8wcHhSTm1zOVg3TlpWbElz?=
 =?utf-8?B?N3dMSm4wTk1ESDRDUTNDUXZUU21IbTg5SmN3ZUdBY2RtMWJLdytyQzRYQmww?=
 =?utf-8?Q?ZcvmDyy5E8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVR3dTAzNDJFOHcvZnFDQ0lDaFQ1YmtZbTlZNkRtWmFBdjJzRElXWWEvUTlP?=
 =?utf-8?B?K1Y0Yy80R1ZhWUNmaXZOSGtzNEQ5ZUFzWGZIVitGZG5OVkxORjc5QjdGV2xB?=
 =?utf-8?B?dzh6TlByTVEyTm5jUFgwY1MwMFVCQy9Gem9yV0FYZHFwRkpSMW9pOVU4aGhV?=
 =?utf-8?B?UlFYOWVWZjhqZjIwTDNVbGx3TVgzeHJHNklnVW5tYWNnZFlWbEdpdDRmN3lU?=
 =?utf-8?B?SzJPNU4zRjlLZUtyOGJ5UzdLMFRiMWsvQ09PcjEzVDNVOTY5alZxR2N5YkhH?=
 =?utf-8?B?YzRCcXRjSEpmV1Y4Y0RnSllhTGhvUXVYL1hBL3Q4ZUlyckY0YzdHalBZL2k1?=
 =?utf-8?B?ZG9odDA2eFV6dGJxK3M3b3FwRDZoRWJnSlFvSmJxT0ROQkpHQnZWblJBOUdh?=
 =?utf-8?B?R2dZSG8zRERYUTJMS01aSndYLzZMK3YyT2RXWDJSeldhNkNTS3BVNVU4clRz?=
 =?utf-8?B?MCswMm12bjBKdVQ1a2IveFlhRDlBbGZIYnpabkJGNmg5Y05aeEUwM0dpcm8w?=
 =?utf-8?B?a0ZSM21GNERvS1Z4SmlsRitvTkxOaVBzUWVTMDVTRUtRTUZTMnpXZnRHVDVp?=
 =?utf-8?B?Q3QrazJnQmlIRVZnTklhMGVBUUxpb2wzVElwWVJ2VUROOE1hT1hDZFM3S2JY?=
 =?utf-8?B?MkRBS0NoOEo2dVRKK3htZkNmUVBUNWNiWUVobXRiS0Y1Qzh2Z0krUFlHVWY2?=
 =?utf-8?B?VGJkOVpXamZ6TFJpRjhoaHhMYWhQOUN0UGNicHRBTUtnYkI1NWIydjlPT01w?=
 =?utf-8?B?b2JRb0NLV3I4VnVqUjhxcFpsaFlJcm1KK2R4V0ovL0kvbmJSQ0JJWUN3WkJ1?=
 =?utf-8?B?b2VyZ2IyUFZZU1hsTzVrVTFGQ1lyQmxHdXlwS0RwYUM0VmtvWk43L1dxMXlr?=
 =?utf-8?B?NkxmRURaYWJSTHRZblNDTDl3RWRrbElnUlNrTXgwaWdZVVplc0JpWVd2QlRU?=
 =?utf-8?B?R1FHcTRzZDJuaFFyMFpEYUhvU25ENk82MjF2S1dMRWhKczNWQ3Z5blZaMmJK?=
 =?utf-8?B?RUc1clhkWHB1YWRaZmluZnJoOFdMZGwveUd1bHQxK0Q3QlFseUZnSW1WT2Fu?=
 =?utf-8?B?ajJwWm5VM1NJRDA5bGg4cmVNdEhldHdJNHRjNWNUOFlzRnQ1OStteGJHY0cx?=
 =?utf-8?B?d21WLzN5UUdzZ3lrcGorT1hCcW4xWU14Vm52eWtzTFhWVWpmTWxWUlgwbzQ4?=
 =?utf-8?B?V09TLzNHQ0pmNGFEZWQ1d2dpTGJjMzhKZE5nTWZsSExNK3F0M1hNR1ExUG9M?=
 =?utf-8?B?alViN1JvVzh3MG9sQ1FPalpOcHBaOTBxSlBtTGNmR1V0K3Vua2ZFTkdFTHVR?=
 =?utf-8?B?bWU0UFJQWjE2bkJiZkVNdFJ2MmNIQ0xBKy9QR25ZUlJWYmlVbzE2Y1ZUUThD?=
 =?utf-8?B?V0dQU0JuTzltckx1ekI5dUZkUWZwUUtxYmg1bUpRUEcxdldJVmNMVjdlV3k2?=
 =?utf-8?B?bkx0N2dxcmM0MjVrK0pvc3FnSXBCVy9yTjh1TUJCcXg1aXpidjhjWDR2WlpQ?=
 =?utf-8?B?RVNwWDJGa3kveXBZZ1d1ZEtxckxmc3Y4cGJ2N1JQQlVuazVldWNGOWJWZURG?=
 =?utf-8?B?SE5EdmtDOTNvQzVrWDArMVJsN3AvS2pWRDZKMUM1Yk51ZWcySzlIVFdWbTFF?=
 =?utf-8?B?eUdka3doa3JYR3VVaFRlSStYV2Q5OTgySXowVlFWOGROMWVTMk05MDBJQmg1?=
 =?utf-8?B?Z29vSFRtcitSNjJjTG5IbWpLb2krdEFEWEtHUnVuY3pReENaM1FzU2pSaFFv?=
 =?utf-8?B?alZmaFduTE9FQTQ5MVNIMERmT0VSSEg4Z3JVaytTdkg1R0Rxc3FzOHhYYmQx?=
 =?utf-8?B?SGFMYSswVTNkY0drSXJJUUhOcEFiQk9VNDdON3YrQ3lGWi8yL29hQy8rQkxB?=
 =?utf-8?B?REdhd3VLenFSOGp4L1NibzBvQVdoNzVOcklNMkZQK21vZXpEZWs2dHVZdkx6?=
 =?utf-8?B?L2ZQclJpV3RlUUx2cXYxV2N2Q1huNU9PVisvcVZYMDZncjNNWUtQd2ZLRjhI?=
 =?utf-8?B?RWF0NkwxK2dTUFVDM3FlOFRGcE5yVmtNRGp5TWdMK2xsdEl4ZnVGRmNIZkxE?=
 =?utf-8?B?cWN0dUxBbkFoT3JDNVQ2N1ZNNUd2NHFNNVNPL29FZUtRT2Z2ejZsQ0htZThW?=
 =?utf-8?Q?f1LGwBbkNeyVX120UBdfFY49b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86175bd-3eef-44f0-6811-08dd36904477
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:45:40.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo+cCy+DdVvYwRu6ZJEGxU30558mNJtS5tCWZeKEzZKd83+CZB1Dtes72LqjISmVQTDz7MMF5lCFe8irGQXheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602

On 12/11/24 21:37, Alice Ryhl wrote:
> These abstractions allow you to reference a `struct mm_struct` using
> both mmgrab and mmget refcounts. This is done using two Rust types:
> 
> * Mm - represents an mm_struct where you don't know anything about the
>   value of mm_users.
> * MmWithUser - represents an mm_struct where you know at compile time
>   that mm_users is non-zero.
> 
> This allows us to encode in the type system whether a method requires
> that mm_users is non-zero or not. For instance, you can always call
> `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users is
> non-zero.
> 
> It's possible to access current->mm without a refcount increment, but
> that is added in a later patch of this series.
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

It might be good to add some #Examples similar to kernel/task.rs

Acked-by: Balbir Singh <balbirs@nvidia.com>




