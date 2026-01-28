Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65227F724;
	Wed, 28 Jan 2026 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610364; cv=fail; b=Tm6r1qYmvECD48bZ7ufwAtwA3gaKhHKvX8i2iefd/Y9vcIgoqA/mzRg/7eiVtafxaLJKdhncZCh6gpnkNgtJwmGK72WpzKz/CK9LmyGb0GLJP926826bz89F50Xkq9j7ueKFmk9IrVqItG+t8QrQ1hrmR3vhXCNVnNk9QXFEnnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610364; c=relaxed/simple;
	bh=FCC+bLiS0YuJj6MIOPRrG9dtAEcAFN3QpqNM45VU6GU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=G7WQBLjirviD8ZH5etoKXQX3Somq7pilrfOmehcr1LDNJFaBSkVq7AmwQsbNVYKzmWRJIOI/CmwLtO790peee4YaAlr8sd4uCtGHl82nlRLc3fKFjgHUKBxXnYeWUdrubiQBcQiwj7iasROh8eRKYqMWo7lKWs8muKwZNcVVads=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y2SDDAwT; arc=fail smtp.client-ip=52.101.193.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y2SDDAwT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydsGU48kIA+69wg+a2kxrHJXzPvZvXv2AWx0zzYKXV4ddsICnar+2GR0Uym2LGEYBCW0UGB4RHKMNf/wuROrxOdtfq68wsHFIiFEJEINihV7VqndBpd+5MyxyfP+18cAAJvIUyjdaclq/k0FSkZ+oi6WnEcTTiNpLoTq1WZeEEFl7mpCm8KsFopm3RL1wA9KX9MbcQfR36INBzKDCPM2ajsbuBcysFb7QDgnQpEcnw1MOPIUOV8YTXCGe8CLqi/23JGxpraXAj263kpdI2+y5PC3XpvnkEie0Lb6ESaCqGFCnP3GCV6j6DARdWF/l9afJkpqziOzPZUqjZdpcJqYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ujnyNHKpMX/7Rt2IHY/b1jCmBTiWa42k9xao1tpv8g=;
 b=SL6VRHLNLJkHneDc0oS+9eqpc3o5OJOITDxjfAceKO0wEjL/7iJ5q41VD/HMkoPEKIBmdiksdmHE1fVlw8NZoKAaCZeSYtA3kQTVo1CJwlg7/8pCqVU5at10BvyrcGLPNiDZiazjiFyRYNJ9AeC6fCVXBvbIPnKny30CIy6FRMLPuyR8M2LOSLunpAKvhVp5EGvybLC4KZsN2RIXAulpYSbl0y1a7R5jjPoNYBJXY2AT/l0H2dSg5aPpGh4dImzGlXSnJG5RkCn+I1qWjvbk4Oih1hFhOkAHLXhZrqNI6iO0iiEX4EKvPbpAKzZOuYscvBoPQ/naMDM3yn6JKkgvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ujnyNHKpMX/7Rt2IHY/b1jCmBTiWa42k9xao1tpv8g=;
 b=Y2SDDAwTd+BglYcGSlz5bbG5UEIuWMNqjjwkHbCCVhGm/jivn2uYGgLRCit0J0Sccy27oKWQjD7EiMg2eu1DdbJ5LiwqYaYlqrrw4pPOizd2flvehVdSl62z+l1hxeZ8qFmP4O7vGh8/bOlGdbwfc8eyGfx2ydMBM/p0cvY+FifSJd9Q3atvoeyKkgLF6aDKFhF2yrpNN1lFg3H2Gg7LS+db9FNEGrD9oLq9ZU0TjCFEH3hZ3WWJ976kUlnzXeB1qjjYj0YDf+S22lrhbOBQdtyOzOSwFrIy3VDBpA4t16bSmJpcp9bI2mVSh5vzjydeUXIgUILHHffNMtrBEkU+rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 14:25:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:25:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 23:25:55 +0900
Message-Id: <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
In-Reply-To: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
X-ClientProxiedBy: OS7PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:604:256::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed2b3a3-589f-41ae-7f70-08de5e792836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm5Fcmt4dVVFMGVIbTA4UFgweGhOL3NIbWY4bHdYbDNmTjNONmtWTTBaajM0?=
 =?utf-8?B?Q0tuek9XbG9leGRmVEluS2lCUjZUU2hvTHl1b2FlbVh0dGx1ODVVVkxsbXFj?=
 =?utf-8?B?cnp0dnh4UVdad2QwWXlDZlFxVTN3Vlh2WUhZNGZqY3RISWNqWXB1eHZDb2dy?=
 =?utf-8?B?R0xENXhCZCtyTW8vemNJNTZ1a1VEaTAybVNpUDFCeER5NDYrSEcvQURBWFhI?=
 =?utf-8?B?dFliZTYxTTFoNWhhUi9sSWlpWjVudjFqUXZWdzcyMmtJK0lzNEdlQ29mdFRS?=
 =?utf-8?B?ZENaY0VsczNhcHBCRjVPV2ExQ2JzQ0VJMTg4TE90dmM2V3lXVkhtekRXbXVY?=
 =?utf-8?B?b2lkbzdxQTNqTVRwcTMzYnpqNWtzak9wa2l4YVVYUU1odVAvcXFseGIxTlly?=
 =?utf-8?B?Q2crcDV5OGE0ZHNzSHhwa2FtOUpWVURjdnpRbTVEL0ZqSVFweEhPZkxObUs4?=
 =?utf-8?B?alh0amhJUndUOHdlMEFCOHZSbytYblZaSUIyMVJmRy95Y1VNbjZPVEpGcFdY?=
 =?utf-8?B?dDErYnphRTZ2NUQ0djczRUNGNVBLUzFyM2JPVjhFSi9NMlo4RXJzUkpvSHJz?=
 =?utf-8?B?MzhRT1pHZ3JYVWx1ekRaWkpILzVJSnJDQ016eWV2YmJnY0EyZ3o2OFpaNFlh?=
 =?utf-8?B?WWNvVWJQd0l4U1VJNjFhRThaaGRqamRIcmU0WG50WFp2N1dOWCtLSmFHbWxv?=
 =?utf-8?B?UVV0M0ZIYzNHUWRQdXl6ci8zak94bFA2ZjgyM2FyNXQvQnVib1paMUxRL09F?=
 =?utf-8?B?RnVsOE1jV3VUbFVrMXZWc3lseTNTMjlMdlYyOVBtb1ROUGJ2TWE4QnJwdDda?=
 =?utf-8?B?Ty9EZXhYRXFwL0FaS0hVQ2RIU3J1UUNCZDFwNlpaa0JHOEZCNXdrb2RqMkR4?=
 =?utf-8?B?MlBRK3lJRFoydUViYUZUbUZ4eU9WSVdJTksweFplTWJPQ0xCV0NKckdMSjIx?=
 =?utf-8?B?MWtPTm4yVGZDM0hBK3NOYm44bUNicVErbWxOMGJwTWpIbVJIc3gva2FNa0hO?=
 =?utf-8?B?SE5zNGgzNElwQnJmcmNObElmNno3TFlQS0dOR2xQbU1QY0IzSVRhN3MwNFUw?=
 =?utf-8?B?Y1FMOUNOOXU1K21VejR0MytHbUd2eUlrTTNnQnRnT2hzbTZGSWlnbmNZSFMv?=
 =?utf-8?B?QUpKNW1wV0MvYlc0T3IvNHEyek5rV1JmU3FZRFRVSmJNVUdIUitHZTEyVjhH?=
 =?utf-8?B?T0VXeTNXTVBoV2VNSUs1eU8xVzBWbnB4L3FCdjN3REpCNGhNMDhLMUdHSUlG?=
 =?utf-8?B?TWFvcDBKVEozNE9YdllmYlk3eHBRdWVKSGJFd0hsODdlOU00ekN6UEl5TGlm?=
 =?utf-8?B?VElEZUZFQzQzdVIwVEdYaDhicFNQcWRWMk9UTWR2RSs1dEkxQnh4dHIzcHNK?=
 =?utf-8?B?YjFPVDJhVEtQekxTRGJ4eGw2bEFMTlpYZUgxNk8xenJOdXhPVHVhZ3lPMEVM?=
 =?utf-8?B?R0c0Zmh2Z2hObUdNdFkvZDZsbDlCaEtuV25MTkhaVnhiY0d3dnU1ME9tZUFi?=
 =?utf-8?B?SGVNSHpwOUI4R3cyUTliVzhPVGJQV1dST1lLYlJDLzJycGZ1UFEwUVFjbDM3?=
 =?utf-8?B?STlXV1dVaGpiclVlOS96a2VXRDV1emp6Z3dVMWF4a0lBemEraXVOd3BWZ3l5?=
 =?utf-8?B?N0psbkZCVzNCcFRHZ2lPOUlJNk03T1NJYlJwQzNhU1dJWkQ0QkVzSFhDeGZE?=
 =?utf-8?B?bFFvTkJDdFh2SThUaE5WTlBTSHVndVBvZGhwNDMvL21tU21NVWZkb0pQeDNH?=
 =?utf-8?B?VldrSHJhY2s3RS9qWGxTanYwTmt1VUdic3BNbldNZkt5WjJZdmJ4Q2pmejhm?=
 =?utf-8?B?YndxTDdSTzJvYWVsZytRcmtYMjJpZFlXdHpPRlVLVEk4dERYYVBxVnFUS3py?=
 =?utf-8?B?WUdLM29BbnU3RC9aY3QxYnpYbDMvU0NRdUE0RkZFOEg2V05YTUtHcXdJYVZB?=
 =?utf-8?B?d2R3cXgza29LZlZGNk9CRzZZazI4WW9PeUxRYkdSSGpTcytSd0plTC9MQ0t3?=
 =?utf-8?B?bk5nTzVCU0NMVnErQ1hsYzRyTjlMTmExc2VHdXNjOG9EWkxpQkVjSUJQQjV1?=
 =?utf-8?B?VVJyc3dZUG5CdmZyUmFkcmVHUEgxOGZJVzRwcWxPU1QyMzBLK3V4UTF2cVlO?=
 =?utf-8?Q?PCjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWV0NHVVdXQrOCtuU1FQY1hTUXI5d08vNHJESlN3NmVQK3JzUm1HZXMxN0xv?=
 =?utf-8?B?R25vajlEN2YyUlhBZzdvOE1selBSRlQ4WHhmeWJXb2hhYm1kS2VVUWtSTy9w?=
 =?utf-8?B?TENmUC9MTU5VVzJsYTJTV1NxNjIvSXpmZ1dSS2dFZ3VSOVkrNVg4Q0o0Y29K?=
 =?utf-8?B?bjVQaExoeDhXNGxtVkt2SnAxQnVBdEgwS1R6S1l6Vk43ZTVCYWxOODdxSjFj?=
 =?utf-8?B?QkcwcDg1KzNxTHByZzdya1o1dWl2UU1hTzh2czlDMTV1Sm9lS05pa3VqSWVm?=
 =?utf-8?B?RXVyVFVVbGRQL2Z3NVNkbkFvQVE3dXdMSnZ4K0dhK3Z3S2xLMzIrb3podHRx?=
 =?utf-8?B?ZzBDcUh4aDdiWjdSaDhMajRhQkhaVnYvV292RnZEUHZmbVJCa2pCZTJWcjF2?=
 =?utf-8?B?SzhMTSsyNkV2T3QyeUNFd3ZrVlIyWFp2YmxpRzVmeklqSVlKL1BaZzZYckJK?=
 =?utf-8?B?S0hUQmxiVHBkMjY2TWQ1YlI5Ty9GM2J4YTltMVBwTGF6eFlQdmRXSUlUalhL?=
 =?utf-8?B?T0cxOVVBNnlicy90aFVsMmhJN0ZwMW5zOFB1bGVjdnZDWTQ3cDBxcU1Gemc4?=
 =?utf-8?B?NEJVTnZoVldtZHRCL2R6OHA3aFV4eW1xSGNXcU43R1MrQ1hvRmw5MGpVV3Jv?=
 =?utf-8?B?M1JrZUJ5THRLeTN2Nll1b2ZlUFlqdlFxbFBmVEU3dHhyOW9kUjFFdk4zejdi?=
 =?utf-8?B?c2RHRThYNlhQODF2bEtIM01DaWRrZ3NYTmJ2WkJUeXp6dzN3VW45Y1cvZ0xm?=
 =?utf-8?B?V21Tb0ZIQ0FiWEtOSWpUSG9PMVZhaHJTS0JIRklvS00rbTEzOUt1bklicVAv?=
 =?utf-8?B?cmNsWVNFalphMlRuMGdqSk5PSGcxdmRxZUhLaFZTdVIvUXpiWWZBS0ZKLzlu?=
 =?utf-8?B?amJUbmE1bFRuLzNpWFV0WXBhNEJYMjB1QXphQWllVmtGRkgxa2laR1gyM3Q2?=
 =?utf-8?B?aHF1RDV5aXpkN3ZoNE0rd3lGaHJSNTU2N1NuUEcvV3pLNU95QW4vWU12RHM1?=
 =?utf-8?B?MW9ReG5xK21KQTJBU0hGK1hNajErWmE4eW43bFpKVXdkM3JVSGppUm1hVmQ1?=
 =?utf-8?B?ZXVUZDZwZHd4eGdtT0xsV01CUkRjcHZFamZYdXhwVDlWbXFNbWxFaFI3YW9Y?=
 =?utf-8?B?Ym82SUhCb0dmaDJZbkt1VDFJVzh4VlBodVpLaFF6dklobmcrOWpFWm1rY1Aw?=
 =?utf-8?B?QlNOMisvSWlQRlhxNG5wSnlybGxOajA2UjJEck1LNktpcjBaeGRrWUc1STRl?=
 =?utf-8?B?d1A2cmRJdE9OU3ZRWFdBZ1BjTHhaM2llSmlJUXd2Ky9VMm5FaTZqbUFZL1pp?=
 =?utf-8?B?SGkyaDJxYVZoMHFlRGYzMXhaczE2TlBOd09kY1VrUXZXN0xUWHp6OThWYmUx?=
 =?utf-8?B?OHZGTW10M2pvcW1qTExENW1MNzdjL2xyVDluai9PSWV5WCttbklXeHF5RFJZ?=
 =?utf-8?B?UDh6UXBzelFKWHF3Y0hGQzBwZFdVbUhVR2hoUjloRE5paU00RU9VRkpYSVor?=
 =?utf-8?B?TTBOVStkMW5WRkxMcVpmNHR2UWFUUzNqbU56VGEyK1J5T1NZS1Y5T3QvMmI2?=
 =?utf-8?B?MUtLTjBCZEl4ZHVPYUFhZGx3VFNjaEpRNUlXSSs2Unh5WG9vMW03VVpGdGUv?=
 =?utf-8?B?ZjhYbFBhUHhpSFMxdGRCQ0ZpaVlGV0dTOXJURFZwaG5FWHdNRTZ1MEJydHUv?=
 =?utf-8?B?TFprR2g1c2UxK2dvcGZFbzR0dTVxY1ZNcWI5VWFRZ0NuUC9sSEhIUGh4cit4?=
 =?utf-8?B?N09lejlDTkxWVlg0Uk1sYXNUTGNwcmhxdHhkTU1yQnRRbHZLQWg4UU10Vk5M?=
 =?utf-8?B?M0dINFVSbFg5czA1M1o0NkpHelp1ZGZTUGczUWp3NlIrWjVTQ0g1UHh5eEdD?=
 =?utf-8?B?V0JuSGhuVEp2WkphRS9ybGJ3VnVqaTU1UlFlazlEZWhoZWhnZnVOdllwbjVZ?=
 =?utf-8?B?VDFhY2V4ZTE0NGJRcnAvT3gwNUI3QzNTcFJqbWx0VVZFV1JIUmt6dnlWbFEr?=
 =?utf-8?B?anpOc25pZUI3MWJWT1hORkcyTEhXN0VUOTluSWF4WGEvWERhR2ZBdXh2SDV2?=
 =?utf-8?B?cXhWQllpZHk0eHF5UGdHM3JXR3FMa0NyMXYrTUVSMHd5VURiVk00QSt0K2h4?=
 =?utf-8?B?OXdlRnNHdFpMbEZrQ1ZzMWE5cVhPTnNSNEdlSG5HRlNPQVJ2QVBiZk0rWGI4?=
 =?utf-8?B?UEZHbklCd2hDeEJpRklScXJWUndES0o4UlVIbGYwRFdMQXlrNWd1M1VwL0Vh?=
 =?utf-8?B?TGMzUXVFSm84OU5nVFlpaUNTS0ZITUx3YWJTbzJHYjBtNGdjand4bFlUMDZC?=
 =?utf-8?B?MjIzU2hNUzVDeGxvRkpEQlJGV1VCNVlyVnpnZ0F0UkRNL2ZFRHNiRmwrL2Fl?=
 =?utf-8?Q?7iC6xiDej4XIWgJFmwm5ITblZb3CGE3RWjeLQAm9uEMui?=
X-MS-Exchange-AntiSpam-MessageData-1: FrIJ8RyOyjEF4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed2b3a3-589f-41ae-7f70-08de5e792836
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:25:59.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT7DmpRqJ4+JYNQYGtBy6PRWhgRkXt1ghuHcXVKIV11EGlW/oh93rM8QWo8hHnnk1IFrpANPCiqSJldFh9E0pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856

On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
> `CacheAligned` allows to easily align values to a 64 byte boundary.
>
> An example use case is the kernel `struct spinlock`. This struct is 4 byt=
es
> on x86 when lockdep is not enabled. The structure is not padded to fit a
> cache line. The effect of this for `SpinLock` is that the lock variable a=
nd
> the value protected by the lock might share a cache line, depending on th=
e
> alignment requirements of the protected value. Wrapping the value in
> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs           |  2 ++
>  2 files changed, 61 insertions(+)
>
> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
> new file mode 100644
> index 0000000000000..9c33b8613c077
> --- /dev/null
> +++ b/rust/kernel/cache_aligned.rs
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::try_pin_init;
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit, //
> +};
> +
> +/// Wrapper type that alings content to a 64 byte cache line.

nit: s/alings/aligns

> +#[repr(align(64))]

While 64 bytes is the most common cache line size, AFAIK this is not
a universal value? Can we expose and use `L1_CACHE_BYTES` here?

