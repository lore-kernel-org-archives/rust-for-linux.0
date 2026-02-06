Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8B347BA7;
	Fri,  6 Feb 2026 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365630; cv=fail; b=W+YUVXuDPRfkfQlaN+B9o0M2193tG1DCvsVynb9HHyHQvLIC+CpteUerRC4wuFT7lSdpwgQUE5YEzXJVq2u4twstot+Dl7RPiWwXtdnV7/kEgFFU3mCUp0wgK/CqqgzrP53Bbu9dqe63DvWNTThtRsYmgWVjVBHPPvptrDyJ7b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365630; c=relaxed/simple;
	bh=CbXzpXLR1Le6p3gwfe77XkjxY6UbyPx4hTmp4kTAR9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PBHIN7plxhofKelie2C4ARWvSMZ2arT5Z0tuF35lV1y7+yj8iHxjlkrzf81ACMe8oQAIhxFWQUn86wKqtH5p2ehyUjQoHyEKOdDxeCOF2ap1lgvl0BS5MAoHdZwTc386St0X5v91EBQrDbkKupeqloppbeVfh+EACneBJzbZp1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PDLnXz6/; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PDLnXz6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMIr6FO4O6j70Nsq06MclFdU4BVLfa4RSmGXdfeNFMWarWuhfK6JcBD3p8BiaEj5j9WKf/uwuaONfuyYJJ5u291isL8p77rvThgpOt+DsTeyXMTaNrSuP9L8MOtZiVfnnjm/Y73jYPbHJQPBu6tFN9XHXF4I/WLq6pYcOgQBXnJfGz2HGcjNIg4WQvqZQfWwGAhTWiR+z8E2q0WJgyo9S+j61lj7+FVFv2jBqq0ojocCJlW6NXtjWRDYEpULM//flX+nLzuoTgLfaheKwQ4iU3bPPEDXGOqPCmC0DYDoYwG3bTDdTVMlSgN5jqtHtknjs+nIyMa2fXLcS7u1yZcoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eU9H3VMaEOWFMajC/v4uv0N2ax78OM0d0Y/Hyg9qAmE=;
 b=MhuIKjq0yaGgD/UDOckGr5AQEstFjvRKgQF3TRW6IjnuGztBiVLsGQdYboPdHxH65T57sdAklLWL+yblrbnF2BCT/lh0lipE2toV1Dgw0/riDDGuqr4YChvYnpkand1A4UXJWFv59152sxRyh3tekdFrJZF95AoXm+aQzf7Mq7bJuJZQ+v8ujUvAwCp3vwhbS/iGJaKbvfFpzPLMfcU7lJVLdabr8XWy8C4tIrN42ks8Xr4LkOTHLq4sDrBoXNcPOEHWuIZbzR9L8L03VlLTV2bB62yvHxZOizNJFsmYHvXL0gVbJqguj1T/ybpJrqFgarQo0PkeqhaiJXTQr/IDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eU9H3VMaEOWFMajC/v4uv0N2ax78OM0d0Y/Hyg9qAmE=;
 b=PDLnXz6/c/OcfPji80ZVrBuF0menNNnNVsnY2B9ighV+DcEdl+6WyjCfIWqBTo5UU/tnZahFpFZONkTFdAQ4iBMRxZA09Sjylq8cqJWxsunlk97NlDUn3IY7eJqI8pkRQ2IyXsD0ahzw2fJ5ycbY5GiWouCRgEMkPo1md3bGoIa35g3hYuBRzYaezRRswTcnCE6RNcHvtsFRFdSODdBAriroqf9jWB7FFd+r22JeTctVB01KvW/Tqv61UhF4yAaOjBQzcJOYf8tr4w3lB4rnykBA9hmaQQpa3Zmc11sG6eeF0TXvaiKwuxL89ejikByoIVzU37o5s46kFZI4dQBJ+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BN7PPFEE0F400A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:13:45 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 08:13:42 +0000
Date: Fri, 6 Feb 2026 03:13:40 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>
References: <aYVXQVwOZapVbnP5@tardis.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYVXQVwOZapVbnP5@tardis.local>
X-ClientProxiedBy: BL0PR01CA0003.prod.exchangelabs.com (2603:10b6:208:71::16)
 To DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BN7PPFEE0F400A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 7143ef29-8739-4518-144c-08de6557a44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFpUcVhiMjRzSm15dFI2WFE4MTFWa01mWnlRNVNYTjhpSnZ5SEJJRGRkeXo2?=
 =?utf-8?B?ODRvNEttSUpEN2lFYjFRdGV1c2wrMm5nblpmWmFJZ1h0NFdwNG4vdEdMR1kz?=
 =?utf-8?B?SXhSeWpMN2Z2d3RCRk1PaHJmTjVhUjJyNjFPTEk4UVhBYThuVnJ4S2FSeU9k?=
 =?utf-8?B?WFFEa0ozaEZWai8rTXNGVUpIanFDWmZ4QWZ0TnBjWXRpR0p5Unc5VkYzakYr?=
 =?utf-8?B?L0lXbGE2VkRPS2c5MEl2bUtjY2JFWlVob1ZPdzhXZW83NFU3VTJqaWRNU2ZH?=
 =?utf-8?B?NGpCOHdYL0RXbGo4ZEI1MS82VERhUGpzOU1vWUNacmkrZGdRcGhWa0lPQzJZ?=
 =?utf-8?B?dWhvTjFGeFFDeFlWajY5aVhpOEpaWjNJQXBvRlJNZjZueXlpTEtyUVpOcWRN?=
 =?utf-8?B?R3hjNTdqdVVGOEF0WlA0Y0JkcGpjT0IySWhsMGNwOFRpUXF3QjhwRGRMLzhH?=
 =?utf-8?B?QnlPUk5EZTdPc1kraUlOZnloMFg0Z2s3QllpUkJsTTNCZ2s0ZUp5dHAyVWRv?=
 =?utf-8?B?RUhlVzRMeFl2SDR0NjByeHVNZTRFK3ArYW85MmJveXBWd0ZJeDRZR0liV0V6?=
 =?utf-8?B?ODhtT3hkaXpLaXQxbUIrdWFHMllBUFVWa3BFVVBDWDBOTlBQOGZHQXBKc29s?=
 =?utf-8?B?WUN3NjBadVZGcjQybm9OWmlxS2N0WHNBNzM2NC9NOWVaazhKMjJRU2l6bnN1?=
 =?utf-8?B?ckkrYTFRYnkwT2Z3UVl6TTVQcXEwQnpsWjhhRlp6dDMvSW4zc1FLem9CTkVu?=
 =?utf-8?B?LzJHQ3R1TENTck5DQXBGT3VlOWxUa1Nqb081MkNncEx3UmluT3VHenc5eVIz?=
 =?utf-8?B?TmNkdmg4dHdnYVh2ZE1oZ1ZHQVNZdDc4Q1J3Mk9XZjlpakg4b3J0a1hJT3NZ?=
 =?utf-8?B?ZTVWSG5SM0x2ZExNSnE5d1hRNGszYWtUQ1BYbU1zSWF2S1BQL3FqajNVckcw?=
 =?utf-8?B?MUN2YVdRZFpLb0VIQ2V6YnVVV2IxN3FoRHVrWGlXZUZjeGdLZ2VONmdGdXAr?=
 =?utf-8?B?L0RQTzM5OFlRQkZRZGFJZjI2YkI1ZE8rTGxjeW5iZkdzcHdPSlJtTjhyM3BD?=
 =?utf-8?B?MEJvaW9idzFtSElpU3hCM3FvOTFrd0hpT0V5Q1d4QlliK2JOYkoycGlOOVRx?=
 =?utf-8?B?eVRPenRsMFpkb25QS0ZhUGpwTUtHcHd4ano0ckQwbHpGNkV5VzVrZkQzaytR?=
 =?utf-8?B?QThnaE5mcWtQWmR2RnBHVFVEaWVRc2orUlRCNUFyMjhBVTBlMWVSbzdRcG9P?=
 =?utf-8?B?R256aDJ6Njd3VTFQcGxIOXRwc09vRjQ1YTZPRi9veG5ScHNuUzFlbmYvLzMy?=
 =?utf-8?B?VnN5VXByamREdndHTVR2c29TQlJ6bUtNSDRVbDA1ZUFUZWZYb1EySzM0SFdM?=
 =?utf-8?B?NTJPRVZQQVBGcmlRVmVNYWlDeGlVYkdOMXlZdlh1dFRHQ1p6dkFCZkl5enR6?=
 =?utf-8?B?U25GS21STlluU0VvM0ZFMWZqM0ZnZzladzE2WStScmRuR09BNHo2UFJ2dmVv?=
 =?utf-8?B?Ti9LUGI0b1hwWHFPM2duYlcwdnZZVWpUcngyVVJLZERleE9TdFhab3VZTGpG?=
 =?utf-8?B?bUJoT3lpUys0dXcvRlFmVU5aNzZWcWM4dk8ycml0dDk2L09jMy9pS3RhVTBL?=
 =?utf-8?B?TWc3V01RZmhLMUNCTGRJTEhtWG14RmJlQXVGWUI0dGJyczFiMjJ0Ym96dTFB?=
 =?utf-8?B?QzEwMHNSZDZwNk5HMFN2MUdBaUExMFJCWCsrUFdVUlMrYWkrVnY2TVptRkpn?=
 =?utf-8?B?UVhsUDNBbTFpd1ppYUt1Q1dndWNKZnRMTml6emtUeVBTcXRXRHZjK1RZL2Zm?=
 =?utf-8?B?aXVMQ2IrK3hwRUorTUNYMGtOMXdBczBnVGJvYTJVUlV3cVduT1BrVnc4WXFy?=
 =?utf-8?B?VEJWd0E0WGRybXRCRWw1aU9KS3hFdnBLZ1hJT1JJdVRvOWE4OHhTTHVVdUZ4?=
 =?utf-8?B?WlBuMmJDVmpuZjV4L0EzUnpJZFE3M2Z2UkdidDJJVWlMVStrdDNLSlBXaG40?=
 =?utf-8?B?NG1tZWtEb0xBdWZ1ZCtrNHUzWFhuOTdQREs2OGl1Y2cwUGJmT1drZmVTNldO?=
 =?utf-8?B?OXJKVUR1RDV1WHFldUpZaXZzMWl6dy9rcURSbmhwcU11ZjBEQUVPNFNWRGcx?=
 =?utf-8?Q?RRSI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS93ZkxNaXAyaitoQ0lXOUZLanlhWDU0Kzcza2p0YlBJQVBJbUN3aVV6L2U4?=
 =?utf-8?B?dkdmVjYwSDV5NFJDbWNsQlhsa1lmN1hkekhCRTJSS3dOT1hrVHlFNm9DWC9F?=
 =?utf-8?B?dk0rNjhmTGNaQ002eWxsNkhpcG4xb25IUzRHM3pOM1pmMGJUclIrd1k2a0Vn?=
 =?utf-8?B?clRIWWxna05wSEU0dDRhSEl3REowbG5hZFgyVEtxK2dReW54cW0vM1FTdG1N?=
 =?utf-8?B?NTdVc2R4N29yLy9hU29Ra1NOWS9kK3Y3Z1FFQ0ZTYWpiVURsOEQ2dTE5WXJt?=
 =?utf-8?B?WE9SWDdqL1h5SDA0K2cyYzVPNy90UFRQVDlNVDY3TDR6Wnh3STlWMXRZbWNG?=
 =?utf-8?B?czFJVkdTdkV2SW8zR0loZGd6OHE0dU9NOVpoc0REM3ExcW5oTWhwWkRMUFBs?=
 =?utf-8?B?UmlHSEtSbUVtY0RzWjJGZlBvZDNiaDM3YVNrLzNsWWV2aTlqWm1UMHR4emdn?=
 =?utf-8?B?TjBLNmc5OVhHcUpKVUJnZ05Ba3VsUE5yUlhCR0VtemNMbm1JUXlsR25EUjA4?=
 =?utf-8?B?clA0Y1dsY21YbmNhM0I4VUNEaHJIU1NlZml2NzI0K0ZJODdwa3o0OVZ4MGJG?=
 =?utf-8?B?cVVOVWNFYjgrazJEdmNRRk1IV3N4OUFRRk1QSllOeWhTN0pHdGJVRjRWVXdP?=
 =?utf-8?B?S3l6V0Vld1FrdVlEek1pQUVxRmRTL0hhak1xZTl4c0FSY2JrSzg2SzB6OWQ0?=
 =?utf-8?B?TVBXWmNKdkQyYVdwY1dnbkE5THNURnE5RXcwdkxhenUvRVlVbTByNEIrZU5k?=
 =?utf-8?B?TGZ4OVhsaWhjdmluSnpCcWgrdDQrR2t0Nm11TmJWcXZ0ZlNtQitKUmJEaEZW?=
 =?utf-8?B?MlowWmNwSk1vVCsxVUpMSERLYUVrckErcTVJSnd2RWdBczZVRGZsNmQvYUNv?=
 =?utf-8?B?WmIzY1Vyb2R4VEw4SUpRSnJHdlNRV1BLejlzRjJFU3VZcGdnbm9XeW04ZDVN?=
 =?utf-8?B?Q0VnQmJVNHp5K0tTeTJDNUJYemF4NUtOMVQzNTVpTytFbzZJblh6ejVoalVY?=
 =?utf-8?B?cHh0ZDExTldLVWhyV0J4M0Frb3c3aHl3cGJRZ2pibnRpbmNDZ1RGVGRnai9u?=
 =?utf-8?B?MGhsQ3B6TGJsWDFJZkNhZGk1ZERiN1lOTlVTNlhuYlRsREF2dENhSVNRV0ZX?=
 =?utf-8?B?MzBJUGNLa05XRDZZUW44bk5VVkdPeE1KdS9OVllZK0NZZ2doc0dhS3YrZ2ZS?=
 =?utf-8?B?TS9QR0Vybzg1Skl2bmpqVTBVMjRQMUZqMHJJWGloSHJmL3JsRWZmbXRMUnY2?=
 =?utf-8?B?VHZSSjArdDJMMWN6TG1WcWMzMkd4SHlZbkNnMDY5c1g0R3V6QzhIbDRTUzFz?=
 =?utf-8?B?TEVRdHVUWkJKNXFZOHV1RXd1Y2FJYzFYVHVUSHFLOU94dU9JczRtU2V3bDhr?=
 =?utf-8?B?SnBOb1hxZFZ3UU5wNndrbm5NNTFsY1d4bERMVXd3ZFBNTnBWWi9ZVG96RUt4?=
 =?utf-8?B?NUtlTUFQSEw4eXZqWk9yZnI4VGtDVGF5WTIySXNiVm9yUnhPZzVwMmQ0eVM0?=
 =?utf-8?B?UEg0czA0SUxmSlM5THZIZDBVTEkwQXI1c1JvSWpTSU1kMTZybHRmbzJoT1pF?=
 =?utf-8?B?WkpmWGM1RGdLWmZON0dwMk5rWFBBV1o4UlVvWmdscUlDREF3dTQ3RTBCRGtr?=
 =?utf-8?B?WURlV3VhbURZTVFoNE1ac1VQYUUyWXRlaUJ3WUZaUVZUdVV6SWtQNmFTTktJ?=
 =?utf-8?B?d1ZQRHVrSXJvU1NTSzA4QlorTGV5ZENFbGNNK3lDRzQrcEpOdmJLSnNtZHdV?=
 =?utf-8?B?WUxhbkhkRkpxV3NtT2V6RTZVVTNPNngzQWJobmY2WjBpRTNiRnBLeTJrTE1s?=
 =?utf-8?B?anJDRzFjZmtkOGpCenRIcjZwVFRBcy9Odmp5Z2RYRGlraVNNU3pDUXZsa2FR?=
 =?utf-8?B?ZVdWQzdVMldaV1RFSXFVcDYrZk5KT0VJU2RLa1JlTnY3UkRFZEY2TXdKY0lu?=
 =?utf-8?B?RFdxYzkxVXpwYlhtRldRNm9XS25xT1FmcFBSRFFvQStBMXMyOWYwNHNCWkFi?=
 =?utf-8?B?LzJ3eHlHYVNoYW1ZSmJranRYeEYzWVQ5UHp3VDNQamR0dWdRUk1EZXVGNzhF?=
 =?utf-8?B?N0hPMkR4M2pCVUdubThFSjc1RWxmTGcrLzJHaWF3a29FeVkzSWl3aWcyOHF6?=
 =?utf-8?B?YnBicVhZS01TbUZYbXFlL2h4cDJiandkWEpCbWM2RHlwcmlzY2hqTU91dUZk?=
 =?utf-8?B?WTdVOW9GTi9Bd3o4VVJ5Rm81bkVUU1hjTWpmSlVZRXJFVVFvU21VK29uUWlq?=
 =?utf-8?B?QlROMmx0N29RVERXTEhHZmluTlpIZk42OWpmb2lRRHk3eVVncS9RZXRWZzNu?=
 =?utf-8?B?WU5RSFFnWU1GODJuVnFpWkdOcHNJZTRtMEpWK3hHOHpibTVDbUVpdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7143ef29-8739-4518-144c-08de6557a44c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:13:42.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVjHomqQTBObN7ffYw5aC8E4cgjCdNWLemzuvEQjH6tdadBaTLZaTRMcPfY7IVZKTha+Kjl1IH6L+o0eUTslvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFEE0F400A9

> On Feb 5, 2026, at 9:51 PM, Boqun Feng <boqun@kernel.org> wrote:
> 
> On Thu, Feb 05, 2026 at 08:24:40PM -0500, Joel Fernandes wrote:
>> 
>> 
>>> On 2/5/2026 8:14 PM, Boqun Feng wrote:
>>> On Thu, Feb 05, 2026 at 07:50:03PM -0500, Joel Fernandes wrote:
>>>> 
>>>> 
>>>> On 2/5/2026 5:17 PM, Joel Fernandes wrote:
>>>>> 
>>>>> 
>>>>> On 2/5/2026 4:40 PM, Boqun Feng wrote:
>>>>>> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
>>>>>>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
>>>>>>>> But I'm really somewhat sad that 64bit can't do better than this.
>>>>>>> 
>>>>>>> Here, the below builds and boots (albeit with warnings because printf
>>>>>>> format crap sucks).
>>>>>>> 
>>>>>> 
>>>>>> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
>>>>>> and some more tests), given it's based on the work of Joel, Lyude and
>>>>>> me, would the following tags make sense to all of you?
>>>>>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>>> 
>>>>> I don't know, I am not a big fan of the alternative patch because it adds a
>>>>> per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
>>>>> patch than the one I wrote. Purely from an objective perspective, I would still
>>>>> want to keep my original patch because it is simple. What is really the
>>>>> objection to it?
>>>>> 
>>> 
>>> PREEMPT_LONG is an architecture-specific way to improve the performance
>>> IMO. Just to be clear, do you object it at all, or do you object
>>> combining it with your original patch? If it's the latter, I could make
>>> another patch as a follow to enable PREEMPT_LONG.
>> 
>> When I looked at the alternative patch, I did consider that it was
>> overcomplicated and it should be justified. Otherwise, I don't object to it. It
> 
> I don't think that's overcomplicated. Note that people have different
> goals, for us (you, Lyude and me), we want to have a safer
> interrupt-disabling lock API, hence this patchset.

I was also coming from the goal of long term kernel code maintainability. If
we decide to have additional preempt count flags in the future, does special
casing 32 bit add even more complexity? (not rhetorical, really asking)

> I think Peter on the
> other hand while agreeing with us on the necessity, but wants to avoid
> potential performance lost (maybe in general also likes the idea of
> preempt_count being 64bit on 64bit machines ;-)) That patch looks
> "overcomplicated" because it contains both goals (it actually contains
> patch #1 and #2 along with the improvement). If you look them
> separately, it would be not that complicated (Peter's diff against patch
> 1 + 2 will be relatively small).

On further looking, I think my hesitation is mostly around the extra
config option and special casing of 32 bit as mentioned above. But
answering your other question, if it is decided to go with Peter's
patch, you can use my codevelop tag.

-- 
Joel Fernandes

