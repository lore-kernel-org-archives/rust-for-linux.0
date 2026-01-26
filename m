Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012051.outbound.protection.outlook.com [40.107.200.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EC1A317D;
	Mon, 26 Jan 2026 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397843; cv=fail; b=kwHd5W/5XXBeTBuOL2GdnFfo1E9WFhtEX8keGRixHxKoXNQw5ZT9etP+XWGRF8iVi3O1YPxxx3Vf75Q6GPh0fTzewJloa+7/H/uSFTdLPZohHYD10bWQQjLV3tATQ3QEcIf13Mpuf7i1SSqJg17O4HpqMHoLTRHYU+Y4Zne7aGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397843; c=relaxed/simple;
	bh=nY8BSRnRXpffwEjtIDNBrjJXwZsiU+P/rv6rlKA1Uo0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gW6wlS17N15H+cTW2yuMDvnF+/NNs3SzbTFQ7zi4vrRv/u5DZsaqjgh3d3bukAn6uPhGzOfdZUIZ6KtFodznC6CI2S6psiK4xW6E0+mwUK1/2Fbd/lKxPVar3o0VyVyEBYIB/0HZUIB2khw5I/woRqF9Lj3pTsLsdGImcIvWKXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DFp/2nEg; arc=fail smtp.client-ip=40.107.200.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DFp/2nEg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1Pp9IFZJEVhOIrjUjkW9Va72vx1bRYzZz51Ag2Lv66UdLggE86m2+8Tklp3AitmIiV49E32ceq9ZnJjHSegNMP6dsqw7UlWBZCjMMVg72iYWlhWfKTkHH2ueXRDYWqSgKdE6PloqwiAtH1TQJCBtURbByojQJly3YpoNCZfBQAofjKH7rP90hOXYRbOo2NG4LatP4Wx6R/zBPwZedx7NGDng6VbZYjC7ohaSQDd4xR0cSjkhh4F7dg5AN7QbQ502VLOr9bQ8GjENaW19AgeMgdB4CeBRai5p+giT1c8Va/x+gsTjACiYuqQYcrwepKAlTO+XD4QMG3Fiuqppzc7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmW/zIJR74CSNplwXI/5GVKYenCMnMUTPv5CMqcWiKo=;
 b=B2ckfCNBGzxIz8RSLLJUZYSqb+TAZeci85zxUIBEsiUmqyXBUhteEWrCBX9Z1uE5mxgcDwHS0GyL0FeFzuRlEXPavAf3VvAlvOs6gTXjZn2NgRKvwz0N3fVe4dooa0l/b5HTCHoTvsBfzr4c+8QwenST7H+M1/Bsj8xcuV23/2kxQOabWsphJb6CsdFsTmdW3lHypN8Nww8Qk3q8oiqiim8pEyUIfBuxVGrGs8HOtC8ALSnvirKOTN1NSOjLja4R9kJEBRfX8nmL7xDNDukLNDXRJMCyPkrOvaSOR2JH25VbjN1+k6LAQZipcGyo+i2hZ0eXljlgQYXIbcIoeoMGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmW/zIJR74CSNplwXI/5GVKYenCMnMUTPv5CMqcWiKo=;
 b=DFp/2nEgqFPffGDjBeSwu7RDPYzWDOYi+gnPIkCxSwoJO+vruOiEw7M1d6eKFuJwUJRQoYVfhf4wUmOnl81oXBrB5dQ4PpyyJxzBZwQBCjyaSQDyCz3DWBASkxUBiFBZusI4pukgI6Y71atpxLU9rKvmX8TBdtTZ6GK0ZmHMlTAwX8DYihNUqTLBVC44HvFbItwkzBgPjvWouJImx+OYWPPdTbo+Noxh50v8GI99EwHOBp7YNqEbjruv9QIwOuZYltqa83idADv7dmMmjHzEYIf6WrhIQdNI9meWyhBCwN7mvi/tZswQLPJD7vWzu8dgQvfZZ8PhoOYdUqcNww7RHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 03:23:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 03:23:57 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:23:53 +0900
Message-Id: <DFY76NDCE2HU.AJ6VJ1ETD944@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to
 `Bounded`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>
 <DFUBUAW9WMGC.3KY2ZOUJPERED@garyguo.net>
In-Reply-To: <DFUBUAW9WMGC.3KY2ZOUJPERED@garyguo.net>
X-ClientProxiedBy: TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bb7470-e00f-4666-517d-08de5c8a5770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHA0d2pnQmVzeDZSekliTGFXSEc1VGRzT2xwZWZxV1g4STdldnB0MEp4Z1d3?=
 =?utf-8?B?Nkw2MFZwZXcyQUNFZHBBN0JXTFNOWlgzOGhFK2FCbzdlL2FJYkRFaVNiWEVs?=
 =?utf-8?B?NGp6OGJNSld5UjR5S0JOaEsxRDk3YzQraFo5V2tlQzVCaU1VVmFZVkpqNVFT?=
 =?utf-8?B?SGgrMUM5YkFUTWtlS2JFbEF3RlBsYjlRcHRRUkcrb0JzYmdmbDMyYWd6cnRK?=
 =?utf-8?B?UjNBR0FUSGdaZVcxa0wxWEJoTEZIQTNpTC9ZMURmYUFESjQzVFJUdk0wMnk4?=
 =?utf-8?B?ZU5xYXNEM05QbzBaQWhUbHdaZEZTaFllQXd3TlpxRzFob3MzNGVxQ2NwRCsy?=
 =?utf-8?B?T0ZYUjJFNXF2cGJBQmdGYjNrNDYwbnhnb09QKzhQTnVINU5UZDVMUm5icWFL?=
 =?utf-8?B?WW0rM0w1MzBZZ1hyd3VZVDhidUlGYkw3TnF4NlBXcGM0SXEvMnBVdG9OUVg3?=
 =?utf-8?B?TlZtNnpENEE4KzltVVhENEdPUXJhSWNDOWEwVEo0bzRuakJRUWkwZDdZZmQx?=
 =?utf-8?B?TmcrendsRUpGam9NMFdiUk9nQTBqRGpPaFZoYTM4Sis0aU1QcE5vWTY0MEV6?=
 =?utf-8?B?bG1pQ2VrdjFnSUZVVWVVb0VrZTJlNFBpRzNVWHl5YU0yZjV6TmFkQm8zRXk3?=
 =?utf-8?B?LytlMWhPMVBab0Vlb0dxUVdZLzA3bXNqc1QyZjV0c290bnVPZFA0K3BPRmgw?=
 =?utf-8?B?aVBXOGFZL0syamdsOG9MNmp4WVd0aCs3MVhRbzhEb0RuVldPWmwrQlIyMUI2?=
 =?utf-8?B?YW43YS8vM3J6dWJWVy8weHVuS01mSC9WUXBnZmhlYW9YM2szMUw1U2tkWUc1?=
 =?utf-8?B?MU1scXlIN2JiSXIrRERsWkhxOXlFREc3WW9jbk5FQW9Ld3lwNXJpbG14NGUr?=
 =?utf-8?B?TVNOdGp3ZmdEWjZmSUt6d3FBd2JucHczRE44Y1NLUUhROTBnajRydHh1bkxZ?=
 =?utf-8?B?NGR6eUhDa01pQUQ2enN3TGJhYlRvalc1aW5tdnFHSkxCdHdOSmhMVS9JQzQ1?=
 =?utf-8?B?M0tSRHFyQ2tST0EzckJ4c2EzQ1RyRU5hbVRBMUJoK3ZFOC9UQmZwWW4rUWht?=
 =?utf-8?B?NjZJRmRwT0NkdHcxdFlxN2F0NnQ2RkxzMzl1aHNYL3hhaVJyV2ZCeEMwY045?=
 =?utf-8?B?a3d5djZmcHJ4T0NxaXN4NmVMb0NmTGVIYStzOVA0VUhrZmtSbDN1ZXQ2Rm1J?=
 =?utf-8?B?TUdWZ1FHYSt1RzNOWkVra2tER0pIYTlLck8yVUplcTlISkNTZklpYjFzWlFI?=
 =?utf-8?B?Zk5jNlFoWGIxZGo3d2JwZFdISnlHYThTZ3huSEFMT1FhUEtZWHJpVTZFbXpZ?=
 =?utf-8?B?c3Y0eTFROG5pZGI4cFphM25BQUl5dlhnbGwxWHB5d1gzd1FZd1F4Kzh0d0Uy?=
 =?utf-8?B?enpEWlpuY1JIS1IyQ0NkTC9oQzM0enM5Z2p5NHAxK3JSOC9kdnJVT251ZmRD?=
 =?utf-8?B?K2NiWE5XWGNUdjhaSWdvSmdQb2hnSzZmQ3JZUGFxL0VzRGNIbHB0L21HVXZk?=
 =?utf-8?B?YW5XRGZYYjZpS0RtMTNMc0gzYXIzV1RkaVZXekFvVFF0eXN6NGhHOFg2YXBK?=
 =?utf-8?B?cWRudmJoZGpPOHFudFVoeVNjWldrVmZya0oveGF5WVF0VHpKbk0zaHhrczBq?=
 =?utf-8?B?OFVVNEoramVMQjE4Uk9pZWRycGxCVndIY3FOemY2R0dQU20rd0JhSWhpT3VZ?=
 =?utf-8?B?YzFaZlhCVnhFMTBtTzFLUU1ETExucDRuSEVab0NDVzdzbkJHeWRIYUxjSmRi?=
 =?utf-8?B?OTlUQ25tNDZXaEZpY3RyWXpSOHIvaEVZQjlPSG5tNlpUaThRVWVZc2FGOE1R?=
 =?utf-8?B?ckFaa2NQK1VUWWhPS2VKY3ovZFRBbDZ1aVc2WE5DTGw1OHhBZFpTdG03M25m?=
 =?utf-8?B?aVA1V090cHUzYTBUdHVTRDlMVjB1Mm9GM1FsaUpKd1BqSEU4bzRsY1J6S3Ez?=
 =?utf-8?B?YXBVZXBqNHpsa3lNQUNNT3JKT3J6Y0wyYWRIM3QrM3djL0hqVThleGJENmtR?=
 =?utf-8?B?OG9XaWcwVzlCalVZdFVGSjZDbk1pZzEvaUhIUkdZdEovK2VHRndUMDNENjF5?=
 =?utf-8?B?Q1FISkdydGNyYU5RSWdEZlRNMURpWEVRUVhBV25HN3hNMWlROStKWC9DUVkv?=
 =?utf-8?Q?qh70=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUVLZlM3MklKU2hZTGpxVExYMDM5Q1g5MkpxcGd0WGdSNExEVWJETmxpQy9D?=
 =?utf-8?B?enVwaWhUMjcvNnFtdnNXZlNTZjFSdVFjM3l1T2lpUkgvbzZkY09NcVVvdU1Q?=
 =?utf-8?B?NzRPMlp1SzlpRE9JNkdkVVBJcHQvY29Sa0NwMFExZlhNUkxYNnFhS2gwY205?=
 =?utf-8?B?YlJCaVdJb1NnMWIwc1VlL3N2NTVsT05oT1p0bEhlSm51SWVXY25vSzVKaE5n?=
 =?utf-8?B?WE9kbzFtcGM4d2Y4Si9QRDdWK2d1TzQwR1dNejFySWFMWjlkbnU3MzhJendx?=
 =?utf-8?B?TDdRcnVuaVB6T0I2ZjR5bGJhbjJmOVAwQ0dIeDc4MElicUswbmRUWU0zYnZh?=
 =?utf-8?B?L25sUTJkUjdSdGd6QnRGL2JrbG53TXhoam9EZFBNNWVhdE5yQmNwdDh3NVdZ?=
 =?utf-8?B?VmZtYjVlMlZFREptZWFmYzZ3dGdBaFY0UU9kZ0t3eXBSdFNSWHRrZjZKOGdK?=
 =?utf-8?B?OXhXVUcycWh0S285bVdTWFhWa2dtdnFtVVhNRnNnVEtRcDZtOFkxbjBWMHdj?=
 =?utf-8?B?My9EbWVQUHIxbjViUHZTN0doK21uWTk0MEFQVkMvQjBoRnJxUkFzT2lBdnZR?=
 =?utf-8?B?Q0NwakxITXdjL09TUmNTL203dXBzZmVKQXdzSThGd3FQK2ZGQkhqczdoVk1u?=
 =?utf-8?B?aFFIaWdMSmp1OGNqWFN4cnJJdm9PbTJZOExBa20xYlJzUENLZEVpZmUzMlhJ?=
 =?utf-8?B?eHAyRW5jNFM1eU9mcWd2SDdDcXZWRVR5c21ZZmljaHozVzZla3VuSi9lSzFL?=
 =?utf-8?B?enpDSTM2TVVpR2VXVmtybUtMWC9aMzNCOThBb2tqQ3BFY29jMEtkWEhaSnBT?=
 =?utf-8?B?Vmoxa0Z5c3hQQzdIN2dmNFdGMjNpdGFaYlRuR0dBZTVtaE40cGN4TTdtUzN6?=
 =?utf-8?B?dTlaUCs2YW1UaG1BNkl6N1V1RmNjelNUTVJnSkVoN05IelBUV281SmpndEJa?=
 =?utf-8?B?a3VrZnUyZXJVZXJZNS9mMEFlRVR4RmVSYWhZVGY5M0xnajNhaldIRVV0WUpV?=
 =?utf-8?B?SEhtTnVXVnFVQ1pvZCsxcUV1RVpaUUgxbzV6UWlPWUttckZDOEw4VGZlVDhI?=
 =?utf-8?B?VkgzcXJtNEx5Z1dNWENJZzFzb3BnczdaZHVOMXMvdWF6RUR6ZFBxZ3FSOXRu?=
 =?utf-8?B?REtQVmxjcG9pQ2Y2dWZXRWFJenVoS0RkaENSNkVLa3hDNVFSd1FlVDFVbW9D?=
 =?utf-8?B?bFgwUVdpREZZWGtTUWd0Ymo4OENVWXk0S3FTMmhhRGttSi9ad0VjVkh2R2d2?=
 =?utf-8?B?QS9PZ0lMd2RDWUJBRTNWMkRrZUU0Mi9zallveEtQVGNycWRQUlc1a2pINXlN?=
 =?utf-8?B?Tkwzak84YTJlVXNOa002WCtwc0I5eHNWbGdRTmhmYlZhNW82SkorM3MrNGV2?=
 =?utf-8?B?c1M1T3hXczl5Y1Qva1V2dWFxa3VkbXRoaElwbFM2bVlhb3hGNFFOTkVTWGNm?=
 =?utf-8?B?TmdIWTZBeDlBMEhqay9oTVBRMjZUelN3dEFZRmpmdnZLSVp5MERuQjVrcU5n?=
 =?utf-8?B?WWtQNGhML0lVRUxxcS9zVGF4TlhtdjVaWXdRdU9Hc1pmQXhpR0RzS1p0UmtL?=
 =?utf-8?B?MGI5dnNLYnZ4aVg0blhPdnRDZXJtYXNDWjg5NDNIc3dTdXMvcTd6UUJxc21Z?=
 =?utf-8?B?R3kxWjNyM0d0dldFWnRCQ0RORDd0MU9EYjBiRHlTa09zODk0aFk2N0FZYklZ?=
 =?utf-8?B?RjQyUXo1KzZHUjA2NkhJR0J6MlNZM05BVlVzSHhTRUkvUi9FMzFZSkF1ODdv?=
 =?utf-8?B?djgwV2pnS3pNWW5lcG9PM3V0eU9lNVRYZE5ZM2lIUzgzN1JTbGtTZG9LZ3Zr?=
 =?utf-8?B?eUUya3Y0dHpRbG1zalo0cndLbDdJWm8vQ1llTTlCM3dyS1I1WVp2ODNQYXdS?=
 =?utf-8?B?U0ZsMnRVY1NoSnZ1R3pKUmlnV2E5L3hBQnZnejRQNTFIRVEzYU02VW5OOHN3?=
 =?utf-8?B?M1JpTFRkZlY3N0R3RkJUTlg5U3h2Yk5IVXZPS2ViUHV1OVl1TFNzcDh4dUFY?=
 =?utf-8?B?bVV2VC83OTdGMnoyUDZKc2tiZEptbk9OOEVNdDRRUjlBODdVUlFVRTM2QUEy?=
 =?utf-8?B?UXFhMWM5cVFVbVFiOXZRQ0xoMFgxaG9FM0tzMXFZUnFXaEVqWDhjYU5JbjJX?=
 =?utf-8?B?eS9mZnJ1bkxvT1lKWExLTjg1L0hENkM2VmFtTk5pd1h6S1JlcG96aTNQbEdS?=
 =?utf-8?B?Nm1WY1d0NTlrTzNLSk90bGhFZXdqNUtLTk9waWI2Ykp0MmZUVVpiZnluSFB6?=
 =?utf-8?B?c09WeVNTWmlMbVhuUXBMUzZvQ2xYUXM3SUlMbGR2cjY5MHNuRG5QTHhsUVBS?=
 =?utf-8?B?ZXc1TzgyUTJXeThsVFR1elk2dGVRelVjY1FUekJKR0paV3ZXU0NreVVackVa?=
 =?utf-8?Q?fPutN7c540zS0BwQSLZXKOr41pWnH7XC60qs0VF1Muxyz?=
X-MS-Exchange-AntiSpam-MessageData-1: t9OzIyCtYm8mbA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bb7470-e00f-4666-517d-08de5c8a5770
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 03:23:57.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsV3WAkvzLYqqpOSzbR6XXpIByZb2Laxc9zE0azCKvtn2Ea1ScspfMeR5rZBko7qb/GxXMuO/+CepNQXuu5O8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

On Wed Jan 21, 2026 at 11:12 PM JST, Gary Guo wrote:
> On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
>> Shifting a `Bounded` left or right changes the number of bits required
>> to represent the value. Add methods that perform the shift and return a
>> `Bounded` with the appropriately adjusted bit width.
>>
>> These methods are particularly useful for bitfield extraction.
>>
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/num/bounded.rs | 40 +++++++++++++++++++++++++++++++++++++++=
+
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>> index f870080af8ac..8782535770f1 100644
>> --- a/rust/kernel/num/bounded.rs
>> +++ b/rust/kernel/num/bounded.rs
>> @@ -470,6 +470,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
>>          // `N` bits, and with the same signedness.
>>          Bounded::__new(value)
>
> This patch doesn't apply cleanly. Looks like you send it from the wrong b=
ase
> commit.
>
> The __new call here is still safe while your code has `unsafe {}` in it.

The cover letter mentions that the base for this patchset is
`driver-core-next`, since `register!` lands in `kernel/rust/io` and we
need to rebase on top of Zhi's Io patchset, which will land there as
well.

This indeed creates a minor conflict with `rust-next` as it includes a
couple of patches for `bounded.rs`.

>
>>      }
>> +
>> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bou=
nded<_, { N - SHIFT }>`.
>
> The returned bound can be larger given the assert below?

Indeed, I forgot to update this comment - thanks!

>
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::Bounded;
>> +    ///
>> +    /// let v =3D Bounded::<u32, 16>::new::<0xff00>();
>> +    /// let v_shifted: Bounded::<u32, 8> =3D v.shr::<8, _>();
>> +    ///
>> +    /// assert_eq!(v_shifted.get(), 0xff);
>> +    /// ```
>> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RE=
S> {
>> +        const { assert!(RES >=3D N - SHIFT) }
>
> Quite surprised that rustfmt didn't ask for the block to be expanded into
> multiple lines.
>
> I think we probably want to create a new assert macro for this pattern
> (obviously this doesn't block this patch).
>
>> +
>> +        // SAFETY: we shift the value right by `SHIFT`, reducing the nu=
mber of bits needed to
>> +        // represent the shifted value by as much, and just asserted th=
at `RES =3D=3D N - SHIFT`.
>> +        unsafe { Bounded::__new(self.0 >> SHIFT) }
>> +    }
>> +
>> +    /// Left-shifts `self` by `SHIFT` and returns the result as a `Boun=
ded<_, { N + SHIFT }>`.
>
> Same, the bound can be actually larger.

Fixed, thanks.
