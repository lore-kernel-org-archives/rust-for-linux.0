Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F00B45091F;
	Wed, 21 Jan 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980282; cv=fail; b=aU6muGAWfH1Iq2YhKX41/BaA/Au1o7Yrb3PIFb4ZtUIlsl6cdO+klrms3rCGl2ZZ6mxxY5qwotK4H7L0OBmF5sZm5kgl1yowJqwW0az72x4WzybBo4iiggcN0f0ghbCwfFZ3AwnixX7GPQLlbZqWDK82i0gicPw4iTyXjm5xhpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980282; c=relaxed/simple;
	bh=jwDNtk9OsX29eCQwgUtAYZE0XkL1rAyEt8OT3AFDots=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QbnOpgg4UjJiHZhG78JDAg/bR2tYkzqFwJHetug3eegezuDXr26tsjRTlXRUQPjIFhMqInRiwffJ5gagEXKFCwxj5FtQnzq/RsxQAlSiVs0xVx/+Ycd+ZnrzgtTK7246ujpsBtEPwiGDqaDkPO7xM2tPkawpMP5xPdcDD7g9Brg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bQScDoCt; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bQScDoCt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7locDCG4wqTgi6/T7AslthqFPN40lCRBBA4JupF5hygNDSZs2FLRzi2DxrHFJJ3dhc/65Aq0XRgQsDN5LKDidtzMd6+yuG62QOFWfSZUkRWU1UKqKgsqmrVJgtWMEE/m7n8S1iYHwiM/EL4X6S7mwY1NjhDYkyvFrDup4EovHQh7VMmcQJeDB1jYBHwSnr7vNQ2yi71pD06tan/X6KKCS0VUSK8T6w3k8HV4ZtLTiPW3mJMZn2F8NafSsvs0OazNgzodvh63WXo8VxOA2kzg3GYHSg2SG44N9tEexJ9wH1JlOsXVyl/XQoI5N/O6hNmvM/OynylopyRBu7RFAxbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgPdXLNesZw3etccU1i7jLaVS0pP2U3FeEQU3aJq4pw=;
 b=pJh0ujyxOCYvqp0WwMhvzBJohmsiXHAG2BC/hG5t9sWXORXsFqcWuAvpCGUTOV+EZTe3pEQ4olRxXWUeBoIAiz3+X1sR5AcZO1OKuA5oh47Kou2FyJ8dVBYVrcWs0rkH7bu6ppJumqKTGZFdBmGyFLq+AwhGN6aJS6VcuuvpplDTqQjsaHfzeWkSLscuq7MmTaETyXkGv8KCNLdpOo9/IMKPQVZCEp925DyruD9Ux3rHC0dGudeEYVpN8zS5Qnlxsr4BAjB6mrhPR9XWQ6rzwIwQkXHrxiCHe8EzaKrTWImwmG2Jdchm8penEVpuru/m4slUuoUr6Azj7uLSoqaUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgPdXLNesZw3etccU1i7jLaVS0pP2U3FeEQU3aJq4pw=;
 b=bQScDoCtQ8edWJIW+NjTApU7xp+rBQhNTT03tyPMwC1UlSdBEbh1LHTahjDyASavWKXosSBkg3+WUkjG/fICSJBEbzgbkqpX3kl9L2juUV7x7maR0A7spMBVQ17c1eoa/HDCIT0ra/XEvtGTn+pmTbgmbbMXJlns0bEmWv4KcRTFJe1oes0THMi2XXNYe58iDQWVPTQ8ltOZjaYGmEqbtF/Eh9GVasYivoRXC66r8u+E/0WFfRnK3u0QJX3uh44bAn3Bnn2qPr31LScCyVGOCtcjuIkq+be6lWSblom4obw82ZGzGlcKzDd5mlyTQvlYjl8Uomo3nOih9XTLroLADg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 Jan 2026 16:23:56 +0900
Subject: [PATCH v2 4/5] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cb4f18-b2a9-4b1e-98bb-08de58be1d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|7142099003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2hGM2F0ZjRRVGNLcUs1Y0R4TnI4N1FuUWt5VXY5ZVkzNnUyYmFDRnRlbWpr?=
 =?utf-8?B?SDk4WUtjb2tMV0I4MmNhK3ZsVnpBK0t0N3pnNkJGL0M2WU5yRHRiSXk4SFZ0?=
 =?utf-8?B?cC9yVEg1SjRWWGROb3FaVDg0d3VlQWtEY0t6TEtjcDZrMVFManlBRW5BSGdI?=
 =?utf-8?B?TUl2cGROdUJ1Zm9Wcm1iclZtVk9yM3dCRUQzbm03VE1jcnRzMEdSaUxwY0Ex?=
 =?utf-8?B?NUIzYjVPNXpLU2dGbCs2Um9FQmI3QUJOelNPMmJXN3djYUJ6UzN1NXowZ0Jv?=
 =?utf-8?B?Q1FzZ3lTNlkrLzNZdy84YlZwTDA3OUJXTzYweU1LSGY4eURmbVpLSUNHQmtr?=
 =?utf-8?B?bWRXazlzMUhwdWRqTXkxQnFBRWhWbXNKdVBGWDVBTzZhekRDb1ZhOUcxcXdh?=
 =?utf-8?B?VTdJYTZsZXhpZ1lzaGQzUG1GNGNLNjhETHhXMmhWYkN5eHltZk9LSVN0bzNt?=
 =?utf-8?B?N09oTFZmU09BTjZyRjVaUW9OeWZqUWdQRzhKYUFaME9pYVZiYjBVMVl3OHRt?=
 =?utf-8?B?QWtERkpMc3lRdEZJVyszcG1FTzVxanJyeXNWZFg1QnJhVmxkOGR3WVJaRkhE?=
 =?utf-8?B?T2ZJUXpHY245SFVCV0Z2TFNqMnFoVDZQZWtTaGhQT21TRlpaWGxqeVBEWExV?=
 =?utf-8?B?aGJab2dscHRKMm8ySzcxT0Z0TXJQZG1LZ0ZRWjMzN05YMnRiRFVHL0JhQ3dl?=
 =?utf-8?B?bCs5dlNlbHFncjFLYUNhLzNzYTJIeDRnNndUcFEwM3R3SHp0SFVGTW9mTUJB?=
 =?utf-8?B?WGg2QnMzemJFTlAzc1lEME55UGI0S05peGVIY1ZZMmNvY0xTRkR1UzhrRmJK?=
 =?utf-8?B?YkJ2N0MwbWUzdWJDck1sZStsTUJ6S1diY01OZTZodkRzbmNtUXNKWHBRREN1?=
 =?utf-8?B?c2tjYWtHZWllQ1VrcWZoRStXWWVwQ3E4RnhXTmdFVnVYZzlkZDBNQ01FL1Jk?=
 =?utf-8?B?elVrK1RkOFEwSHdVZXg0MStQdlNOSjZJS0pvcVo2T3hFRGU1RUY0VWdLVU90?=
 =?utf-8?B?WklNTng3alBuV1pqdjJFV3N1b3VIbmNkU1dPbXkycnJPN0FzbXpJN1pHb0pZ?=
 =?utf-8?B?ZlVFNEF5RnhMSS9UbXhNZFg4OStySGFyRlJLRVkvMWNCVUgzZTU3QkEvTFcr?=
 =?utf-8?B?aldDYjFsVlc4YzBWL1hQOUZVZVcrcW5HZjh1NDE1TGFMWFIvb2pNV3RCZElm?=
 =?utf-8?B?b0U5Ly9KK283ZDBVQ0pkd1FFRFpoUHlsdXRMbkhmalg1QkFiN3oxMGlnODZ1?=
 =?utf-8?B?UjR5RDNLZjYzQjlWVC93ZWtzVEdhVFlZY3BPSTFmWXA5RUV6QUVBNmozUFow?=
 =?utf-8?B?djJVK3RrcjJPd3BJQlpWUlpWTWVRMHRHQVptUk5KaXVZa3cxdHd3RnFTTEdQ?=
 =?utf-8?B?bFRuODFSb0l4clEyU1hOc2NyTXorSmdBdmwxS0Z0bHVIdUpWaGYzYzM5bEhL?=
 =?utf-8?B?emZpUlFOMlVmUkxUWDNJOWNjZ2ZkRThkakwvZ29hVnpvd0xiNGxxa1owMFRG?=
 =?utf-8?B?QndKUnFuQzR2QXFtVmFwbFNUOGlWM3B0Rm1rZnlsc05qT3VBdUdvcll1SWVa?=
 =?utf-8?B?c1JCaUZ5NnIwY2d6N3pDWkw3N1FHRXpsNXg0bVpnbzNVUmdxWmE2SjNFVStn?=
 =?utf-8?B?eHNKSEtVNnZ5NlQ4RHZORzZVYjZHMWxnS3JvQko3TmlzbHpiWERCaFFENlg3?=
 =?utf-8?B?Qk9wOW04QmFaT2p6S0ROOVpCQ1JaRDFuM2tsMTRNL3oxWmg2YkxIanBiVXZ2?=
 =?utf-8?B?NG5pdTZNMFNoMzZibG9mZzkyQkhsRHY1SkNTd0pIOGJURjJBNURqYnFFdDdM?=
 =?utf-8?B?djFGTWowckg3Wk5rODdEblZGRG5ESUloVGcyNTd2OEl3V1Y0NldQTURGT2lI?=
 =?utf-8?B?eXVYeUVXVm5TRVFtcHc2N2xvRW9uTUdtUmFoUzdtbVNSQkhuZEd2LzhmendN?=
 =?utf-8?B?c2duZGNnV2ExL25mSjRvTlIvZHRYalhHUDBwUk4wVjZjVnM2cFhEU01JRHBV?=
 =?utf-8?B?QXI1NG52cEphU3ladHFXYkZheFk2RkR2SFBpM01CVmtsOHZEQXhaMUhiS29m?=
 =?utf-8?B?TTF2NmxkeEdCSnpZazdPbERPVXhmdG83SGo0NnBIMjdBWWpNd2QwQ2haR0d0?=
 =?utf-8?B?eWRtWDhmN0hXNEtsbmJFMFEzekwxNWVIekFDTVBENkJYRlAxajdGWlN1RFZq?=
 =?utf-8?B?Umc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7142099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2c0M3BJV1FOZHpHS0hXekJ1aFJIZEk3Y3hldTRwZnI2T1BadFpldkk3TjI4?=
 =?utf-8?B?blBETjJzLzhaM0NLMDJkOTA0TkdKSHlXQ2xKVWoxQWtGOEZ3UUZIOTJ3dktD?=
 =?utf-8?B?TGZmZnVHQS85RXpMalF5ZUFmQnhwSUNZWCtiQytLajZ1VDUvS2Z3ZGpTalY3?=
 =?utf-8?B?MHhzWlBYTHV6TFV0WEZleU0xWGNjTEZBMXBTVzZTSkZaSnpFVFVDWER3elFQ?=
 =?utf-8?B?VWxESkF0UlFEVDQxajlueE16S2VMSjVVdUIyRWMrZGF3SC9mK3BCbzVXQytn?=
 =?utf-8?B?RmFTWkduYlAwWXNlRHY2UjA3dzI4Vm1mNWNLZkFWVXQwSWpOZzA1aGZJa0ZF?=
 =?utf-8?B?azRXM1NMR1ZSTCtDaUpzU2dWRjhLYlEvUWVNRCs4SmsyeC83STlmcTNMZ3do?=
 =?utf-8?B?Wk11QXlzSjhoaldjblZITml0c0xRWnVzMHNLbEtwR3VXbnp1T1AzRmZ2aXpS?=
 =?utf-8?B?Z0cyOGQ3ZWtYL2NGL29idEFaakE1bnV4NHJtNnFsTmEvMW05ZjJaRHVhalUz?=
 =?utf-8?B?dC9FNDRFOUZYbUg0UkQxVzFHM21IbGdrUVBDZFpoTk5iYzA3T3hEVStSLzN0?=
 =?utf-8?B?Mnd3N29ZTVcwSncxWTJlZEQ5WjFjVWZLS0FsZ2VTRUM2cmVUckZEcE4vT3ZB?=
 =?utf-8?B?RXJ6cWNPNkcyajdJbFhQKzVtWnNEa2trM0JNcXFLZ0FTcmQ2TW9oVW5rMk5S?=
 =?utf-8?B?eGVDZCswOEs4aDhPMGpQQi9DbUtmMkRYMmhUNm9qekpYc1hoQkRHcGVzSXUy?=
 =?utf-8?B?M0lhT3dCR2VtMzN2dnhWZnRtaTFtem0wYkp2a2hoRnlOY3lWcVlRcGZMOTlG?=
 =?utf-8?B?TmhIeFpmWjNrU2NmellKSDdUald1eUkxY040QnBaWHJtZUFIeS9mcmxOeWpC?=
 =?utf-8?B?bFE3M3I2ZGYyclZ4SWwwUzR2SGdOKzVvZmNwNEttSjZONUYvOVZRQnM1VUhT?=
 =?utf-8?B?WXhSNHp2U3o5N2tVOHJnY2JVR1k5VlNaRWozbE8vYi9HK0FjL040MlFyVkRI?=
 =?utf-8?B?bVJYN2xLbm1OWDlrSnVkRTVLMERSbkhtUWdQYnZFNWtGa0V6M3hlUkRWRXlp?=
 =?utf-8?B?SG1JSlZOTjM5SEF4U1VDNVJKZWZ5Y1kzV2FWcHVZa3d3Vjd3TEZuM0NtSXBj?=
 =?utf-8?B?VGNUMG80MS9OT1QxcjNTMVUrUmFGS2llZWNxanptblR4aWUxbjJkZER5L25O?=
 =?utf-8?B?bWhyeU84dXhoTmZjdFNUUGlSVnFvN3RPTXlnYXo0bmN1SDFnU2gwT2xVNTJJ?=
 =?utf-8?B?NFFNWWxiZkQzVE5vTnhzVFNWWi9KQUVNa1dXZnVsSWtMR3FONmd4VVcxQmJB?=
 =?utf-8?B?TVUycndtVEZNT24ySzA3UXVDV1ZnVGVBYnZIcWNLaU1GY3cwM0Y1Q3dkaFht?=
 =?utf-8?B?WnQyczdsbmZ1WkNsRFk0cFE1MlBmMGRnakVEL0xaV3ZiU3NHQ2Z5VXFVdUtE?=
 =?utf-8?B?UW5haGFGZW55QmNLNEZzMTAvT1ZxcHlsU3R2REhRZHhOQkdJb012ZnNxRWho?=
 =?utf-8?B?eG5IS2FwQ1NFVkRtOVZiSG1URzRXNjNBcDVBUkFiMVV3Smg0eldtOHg5YllK?=
 =?utf-8?B?Ykhwc1UzTFhBdFVLKzJrZmFvWjljQ3g2SVJnUTR2RHdpaWlvRCszYUhpbkRE?=
 =?utf-8?B?Z3NnMlppdXlOWjVKQ25nS1VJSnkzWTQwSlFXZ29QcE96TVI3dUJCaDJIQTVS?=
 =?utf-8?B?Y0RMWWpTQ25kWDNlNFJaZU9IOEhwMkN3R2JhbUttWHUya0dVZllTckdYVXZJ?=
 =?utf-8?B?V2xkdHFWdjRBOWJEYmpESmI4NlQvYXJvNkRoL25VdE8vV2gzQXdHN1RYNVVs?=
 =?utf-8?B?bmRNWENQOHBYd2QvUWxuWGQxSEJaRTE2WE03aHdIcTJ2MXNDWWRMQWtBakdH?=
 =?utf-8?B?NkZJVW9qS0RxQkh1RU8xa3BHaDJZZjloRWtQV3prUERCdTR1dWhnS3lITi9y?=
 =?utf-8?B?N3psNUtzUEN2QnVubTQ3N2xsdkM3V3Q4Mzc5TFhiRCs4SUZ1d2JhY3VIT2R5?=
 =?utf-8?B?UjA0T1NQRStkKzZJY2FZa3pvWlhrTVdlUDRDcTNqSExCam1QNFNFTXl4U0Uw?=
 =?utf-8?B?Z1JCRmkraWNDUXhESGhaTFkydDRJTWpXVjN5bm1UaElHNHViUUNNSERWbmx1?=
 =?utf-8?B?K3YvTTBuVjJRdWk1dlZVeEI5Wmswb0lSZWVmcGh3NW52YS8reVN0QTdNYnVq?=
 =?utf-8?B?YWZlbHF5WG42enVSbnJZOXFwQlNpelZsUHhDU2dLVDR2eFlWb0FBMUx2d0Vw?=
 =?utf-8?B?WENaMUJQd0Y2d0RmdmFkUkR1MVBwb0VnM0RKdkZQZklyRkd3UEF4Sk54eHBJ?=
 =?utf-8?B?NXNBekVEWFkwbVlkL0U3V1ZjV2dZYlorZG43elE1Nkw4OGVXOE1Fc0FxYnBo?=
 =?utf-8?Q?wKONIAiC6fJJuYO12DiSLT2o2Y4v99hcOO58P/sCypvL1?=
X-MS-Exchange-AntiSpam-MessageData-1: GlOYnZz+QFB3Ww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cb4f18-b2a9-4b1e-98bb-08de58be1d23
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:29.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVefm7FLOXCKqBsPuWWEhRa36bTYkJ5xznZ261ggKN/bk0Kw0lEWONxvO+mvAp6IFC0vK0GyfhvsBngPl2r6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    1 +
 rust/kernel/io/register.rs | 1198 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1199 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index a97eb44a9a87..eccaa176b6b9 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,6 +11,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..e414aebe4c86
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1198 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The [`register!`] macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid. Please look at the [`bitfield!`] macro for the
+//! complete syntax of fields definitions.
+//!
+//! [`register!`]: kernel::register!
+//! [`bitfield!`]: crate::bitfield!
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait providing I/O read/write operations for register storage types.
+///
+/// This trait is implemented for all integer types on which I/O can be performed, allowing the
+/// `register!` macro to generate appropriate I/O accessor methods based on the register's storage
+/// type.
+pub trait RegisterIo: Sized {
+    /// Read a value from the given offset in the I/O region.
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>;
+
+    /// Write a value to the given offset in the I/O region.
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>;
+}
+
+impl RegisterIo for u8 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read8(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write8(self, offset)
+    }
+}
+
+impl RegisterIo for u16 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read16(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write16(self, offset)
+    }
+}
+
+impl RegisterIo for u32 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read32(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write32(self, offset)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl RegisterIo for u64 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read64(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write64(self, offset)
+    }
+}
+
+/// Defines a dedicated type for a register with an absolute offset, including getter and setter
+/// methods for its fields and methods to read and write it from an `Io` region.
+///
+/// A register is essentially a [`bitfield!`] with I/O capabilities. The syntax of the `register!`
+/// macro reflects that fact, being essentially identical to that of [`bitfield!`] with the
+/// addition of addressing information after the `@` token.
+///
+/// Example:
+///
+/// ```
+/// use kernel::register;
+///
+/// register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information about the chip" {
+///     7:4 major_revision, "Major revision of the chip";
+///     3:0 minor_revision, "Minor revision of the chip";
+/// });
+/// ```
+///
+/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
+/// region. For instance, `minor_revision` is made of the 4 least significant bits of the
+/// register. Each field can be accessed and modified using accessor
+/// methods:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::num::Bounded;
+///
+/// # register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information about the chip" {
+/// #     7:4 major_revision, "Major revision of the chip";
+/// #     3:0 minor_revision, "Minor revision of the chip";
+/// # });
+/// # fn test(bar: &kernel::io::Io) {
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = BOOT_0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+///
+/// // Update some fields and write the value back.
+/// boot0
+///     .set_major_revision(Bounded::<u32, _>::new::<3>())
+///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
+///     .write(&bar);
+///
+/// // Or, just read and update the register in a single step:
+/// BOOT_0::update(&bar, |r| r
+///     .set_major_revision(Bounded::<u32, _>::new::<3>())
+///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
+/// );
+/// # }
+/// ```
+///
+/// The documentation strings are optional. If present, they will be added to the type's
+/// definition, or the field getter and setter methods they are attached to.
+///
+/// Attributes can be applied to the generated struct. The `#[allow(non_camel_case_types)]`
+/// attribute is automatically added since register names typically use SCREAMING_CASE:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub STATUS(u32) @ 0x00000000, "Status register" {
+///         0:0 ready, "Device ready flag";
+///     }
+/// }
+/// ```
+///
+/// It is also possible to create an alias register by using the `=> ALIAS` syntax. This is useful
+/// for cases where a register's interpretation depends on the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register!(pub SCRATCH(u32) @ 0x00000200, "Scratch register" {
+///     31:0 value, "Raw value";
+/// });
+///
+/// register!(pub SCRATCH_BOOT_STATUS(u32) => SCRATCH, "Boot status of the firmware" {
+///     0:0 completed, "Whether the firmware has completed booting";
+/// });
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition
+///
+/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// # fn test(bar: &kernel::io::Io) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register!(pub CPU_CTL(u32) @ CpuCtlBase[0x10], "CPU core control" {
+///     0:0 start, "Start the CPU core";
+/// });
+///
+/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
+/// // that is used to resolve its final address by adding its `BASE` to the offset of the
+/// // register.
+///
+/// // Start `CPU0`.
+/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
+///
+/// // Start `CPU1`.
+/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register!(pub CPU_CTL_ALIAS(u32) => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
+///     1:1 alias_start, "Start the aliased CPU core";
+/// });
+///
+/// // Start the aliased `CPU0`.
+/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
+/// can be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
+/// an `idx` parameter to their `read`, `write` and `update` methods:
+///
+/// ```no_run
+/// use kernel::register;
+///
+/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register!(pub SCRATCH(u32) @ 0x00000080[64], "Scratch registers" {
+///     31:0 value;
+/// });
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = SCRATCH::read(&bar, 0).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = SCRATCH::read(&bar, 15).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = SCRATCH::read(&bar, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = SCRATCH::try_read(&bar, scratch_idx)?.value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(pub FIRMWARE_STATUS(u32) => SCRATCH[8], "Firmware exit status code" {
+///     7:0 status;
+/// });
+///
+/// let status = FIRMWARE_STATUS::read(&bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(pub SCRATCH_INTERLEAVED_0(u32) @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
+///     31:0 value;
+/// });
+/// register!(pub SCRATCH_INTERLEAVED_1(u32) @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
+///     31:0 value;
+/// });
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register!(pub CPU_SCRATCH(u32) @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
+///     31:0 value;
+/// });
+///
+/// let cpu0_scratch_0 = CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
+/// let cpu1_scratch_15 = CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = CPU_SCRATCH::read(&bar, &Cpu0, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime value returns an error if it is out-of-bounds.
+/// let cpu0_some_scratch = CPU_SCRATCH::try_read(&bar, &Cpu0, scratch_idx)?.value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase[CPU_SCRATCH[8]],
+///     "Per-CPU firmware exit status code" {
+///     7:0 status;
+/// });
+///
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(pub CPU_SCRATCH_INTERLEAVED_0(u32) @ CpuCtlBase[0x00000d00[16 ; 8]],
+///     "Scratch registers bank 0" {
+///     31:0 value;
+/// });
+/// register!(pub CPU_SCRATCH_INTERLEAVED_1(u32) @ CpuCtlBase[0x00000d04[16 ; 8]],
+///     "Scratch registers bank 1" {
+///     31:0 value;
+/// });
+/// # Ok(())
+/// # }
+/// ```
+/// [`bitfield!`]: crate::bitfield!
+#[macro_export]
+macro_rules! register {
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET);
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ty [ $offset:literal ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base [ $offset ]);
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ty [ $alias:ident ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base [ $alias::OFFSET ]);
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $offset:literal [ $size:expr ; $stride:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_array $name($storage) @ $offset [ $size ; $stride ]);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal [ $size:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage)
+                @ $offset [ $size ; ::core::mem::size_of::<$storage>() ]
+                $(, $comment)? { $($fields)* }
+        );
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative_array $name($storage) @ $base [ $offset [ $size ; $stride ] ]
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $base:ty [ $offset:literal [ $size:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage)
+                @ $base [ $offset [ $size ; ::core::mem::size_of::<$storage>() ] ]
+                $(, $comment)? { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ty [ $alias:ident [ $idx:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative $name($storage) @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ]
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
+    // to avoid it being interpreted in place of the relative register array alias rule.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET + $idx * $alias::STRIDE);
+    };
+
+    // All rules below are helpers.
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use SCREAMING_CASE.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty)
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage $(, $comment)?
+        );
+        ::kernel::register!(@bitfield_fields $vis $name $storage { $($fields)* });
+    };
+
+    // Generates the IO accessors for a fixed offset register.
+    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from its address in `io`.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, $offset))
+            }
+
+            /// Write the value contained in `self` to the register address in `io`.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T>(self, io: &T) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, $offset)
+            }
+
+            /// Read the register from its address in `io` and run `f` on its value to obtain a new
+            /// value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Generates the IO accessors for a relative offset register.
+    (@io_relative $name:ident ($storage:ty) @ $base:ty [ $offset:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + $name::OFFSET;
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + $name::OFFSET;
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it, then run `f` on its value to obtain a new value to
+            /// write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base));
+                reg.write(io, base);
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of registers.
+    (@io_array $name:ident ($storage:ty) @ $offset:literal [ $size:expr ; $stride:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+            pub const SIZE: usize = $size;
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, idx));
+                reg.write(io, idx);
+            }
+
+            /// Read the array register at index `idx` from its address in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of relative registers.
+    (
+        @io_relative_array $name:ident ($storage:ty) @ $base:ty
+            [ $offset:literal [ $size:expr ; $stride:expr ] ]
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+            pub const SIZE: usize = $size;
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base, idx));
+                reg.write(io, base, idx);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<const SIZE: usize, T, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, base, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty $(, $comment:literal)?) => {
+        $(
+        #[doc=$comment]
+        )?
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name($storage);
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns the raw value of this bitfield.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            $vis fn as_raw(self) -> $storage {
+                self.0
+            }
+        }
+
+        impl ::core::convert::From<$name> for $storage {
+            fn from(val: $name) -> $storage {
+                val.0
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            fn from(val: $storage) -> $name {
+                Self(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` and `Default` implementations.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($hi:tt:$lo:tt $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        ::kernel::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        ::kernel::register!(@public_field_accessors $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+            $(, $comment)?
+        );
+        )*
+        }
+
+        ::kernel::register!(@debug $name { $($field;)* });
+        ::kernel::register!(@default $name { $($field;)* });
+    };
+
+    // Private field accessors working with the correct `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.0 << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        fn [<__set_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            => $into_type:ty $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> $into_type {
+            Default::default()
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            ?=> $try_into_type:ty $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> $try_into_type {
+            Default::default()
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        $(
+        #[doc="Attempts to set the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<try_set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__set_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            Default::default()
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
+    // `Default` implementation.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the bitfield where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value = value.[<set_ $field>](Self::[<$field _default>]());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+}

-- 
2.52.0

