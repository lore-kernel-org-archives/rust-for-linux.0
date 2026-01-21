Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022115.outbound.protection.outlook.com [52.101.101.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806B29B76F;
	Wed, 21 Jan 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996120; cv=fail; b=dxySPsnwY96hPwyxJDA3uFRPrfxJzvxWmHRFAQ2mdIq9/jjCLeGwZpZKVMQbfVEbdqEhT7ixPbc0Xd8Bg2J44MBudD899JtvwavEuxvZSeiDlYam2T4qlYCzaqiGUDSk6DINIOcgg6SW39Qm0hnrSlLZUtdVr1tZ8McnwodPOB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996120; c=relaxed/simple;
	bh=j8LmUZvo+EFFm5j2l2szpD2ZJ7A6Jg1qoOVCfe/UCO8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=juv4o8mVbC7QMf/cCuw6tagAkog+b9tQ0Ccv+/u4h2RyVTCM1UsbzsJ/IpFoPhKjoux2ZECyyw+zx3Nhh3SuQCEsp1xGqhsF9J6294sAFtbCNCtFAeZCgX5VfCQDsJsrdy7dQROh/Z9xk6DWlNSKGEINrxnhnxo/KvViXo9ddlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u9y3H4wB; arc=fail smtp.client-ip=52.101.101.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u9y3H4wB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myDSa0+sOCRQelBrTb89DkjOth3+qEFtjgTViRQM+1XBK97qIThVyGg6XrTgXzXPGT0WvUO4L6oqvE0zHfqN8wNsPTUaN9f+/rDxrfpsiQsIjYnioosQzr6SwWe9va2jSiGeNWPRiHgXiDVXDnAcfXyyEfkW1CjtAPSlwA7cH6GfVctwQgDxAuasEpYMMVSGX72ZuRf5sQXExUiaPzqqfM07ti5DoE1wQDKK+XIOuhpcw4x6nbOL4/z2CrbFmaRIdXArbul8QbKqu4fZonpHNrUxkQqm+sZ+AoNornMbvt3H8k00FN9XVo1FIRa80eYZBjVYlYLckYKXNVcw3+fd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxA8OpSa7zim/1Dsb9Abwha0Z96GfToe5ufM5gUN+S4=;
 b=uO3Z0Jck9hq5ghBZYnXJOKdGxoBMstHJB27AGbHNXG7kY8PcZ/XSC6D2jUw3yrfPev6yPOHQg0tJukLZw57BcGpjMs+esn7l4+q7/H6pTdSAIFKTLnI7S52WlOoZdlb6wPhztSMuIqNxpr3EB7y7J5t12HL2PK6/7/V4K9GN2rFKJoUpNSNLk5WdFyLewGRPsiMDK4FgHBRDUQXi9ko8zbAjfRbSLrrjrGv6DVV0PnX4hOrG+zoinTuqP2uFnOjMeubpX8SoMfaZpfJSa2cY/DCzLNrdkALGL6X6qkkcuGMz6blLWHap3IO2YfeGcidGRC8lpzskK8+Wn1csPg6yNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxA8OpSa7zim/1Dsb9Abwha0Z96GfToe5ufM5gUN+S4=;
 b=u9y3H4wB15xbCgUxFE8VIR7DkPQpxiztoAEPeOo79SgHsPjowST+CULMO1CjgpxD42EFsuN8KLnthbzcHJCbaeiCr/zhCcil6vX3NpECYt4Z91ZDdASn2CQJxfGRlTXpGjKiBQ3VtAyW4hTOenijG4pT097AZPMRAxEqTsBdGZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6303.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.14; Wed, 21 Jan
 2026 11:48:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 11:48:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 11:48:33 +0000
Message-Id: <DFU8SBP3U31P.17WSDBQA4BKS8@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] rust: enable the `generic_arg_infer` feature
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-1-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-1-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: af26919b-2e85-46c0-aa45-08de58e301d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWJNSTNUNXZBZS9DWnQrbkFVeGExN1U2amtSMzNYN1diU090ZitHdkVBNFdO?=
 =?utf-8?B?b2VRcjBjcExiQ3BpaDFkaDNTdUZFSHdwU2QrVEdCZmZGNThqVCtmMWM4ZFNL?=
 =?utf-8?B?czl1eTNuRXRNKzkrMW1wVmYzc1pTOWo1RlVycndsRTl3a2duRFhGTklwalE4?=
 =?utf-8?B?MTQ2QldQb0NxaTdpVFNZTDkwMnBJWmdadFBlYVNFSkRLbFYzOVVHWWRpbGdl?=
 =?utf-8?B?SnRpRkRyUU1uOVZLNDF4emgwd3hYMDdaRFV5RVVEaEhkOWlwaFFVWEF3azJs?=
 =?utf-8?B?ODlJUmhLYk5zVEprYmNIK2RSMFZ6WnZKdnFHOXNwVkJ6TDFvbVd3YXJMZkVP?=
 =?utf-8?B?QVhlYVNOOVMwZ0c0NGdORXZKQitJLytXbVBDbFBqNUUyZVlXdnJzVjdmL1RE?=
 =?utf-8?B?MldXdzM4TmdRL3FqcDRReWlzcVRiaWZZUFdUWFlWTkh1V1VnejRQYytOQmdz?=
 =?utf-8?B?aDFKbFc2Y1RoanZ3L3pTbUxVd3RRT2RmdGsvN3M4MzRON2Y2eFY3eU5aTFdi?=
 =?utf-8?B?QUJFUTRRVDdhZzBGeDJPWnhWcWhhcTNFbzZoenBLdzJLbnd5aVZWbVF6UXJZ?=
 =?utf-8?B?YUdhRHorYjJEWmVIY1p4dHdwZjJ0eG91UHBXN2pXQnBxbHAvVFJqWEJFckhJ?=
 =?utf-8?B?SXhzaklUQnZ4NmN1YnpmQUt5MjJrMDVXTGV3RFhUMUpUOEhpaS9XdTdUd0Vw?=
 =?utf-8?B?SnBTMjMweFZKaWRhYm5vRy9HM01VMXRNOW5FWDNhTlQzRkJ5d2xKSmxqNU5t?=
 =?utf-8?B?TXZXdVJ1bWx5TVoyYWJ0UUt3aDBmSjdzcUk1bXlKd3lvNlVzSERhcHVQY3pN?=
 =?utf-8?B?bE0yOTJhM1hPbGJlQzdpYUpaMFVuWnh5RjRCa1NKZ3hza3paVTBrNzdMcUNI?=
 =?utf-8?B?YTlLOWJGcm9LSW1TdGE3U3MrVnFxeGVtVkl3aUdkai94Y0hmMUVhUmhjTnFh?=
 =?utf-8?B?aG1odW9DOUlOTkVDWXhXNnlBMXlaTmczZG9PTUVmNE8wL1Fqak5SY28vQVor?=
 =?utf-8?B?ZitqVDE3QkVpRlZYRlBXSDJNeThla0tKcWZ3M2V0YUYvbjRWSzhoTmVCOHJw?=
 =?utf-8?B?VldyRW44NlJwamh0T1FydWprRTNyTzV1bU1TWlBLd3FQbnpGVXNCc3VSQTVH?=
 =?utf-8?B?VFZYa2hlR0cyTm5aZUxpU2ZYSWFQTzNIQVNUYWVIMHh4ZHFuVzBlU2tPNUIr?=
 =?utf-8?B?VWs3UTUzVURCaHl2b1BReFQybitMeXgxYkVNSXFoSDdKYWdPbEV6MmhvNHNI?=
 =?utf-8?B?U0hvS1oweTBtRUhwRExTY09UWEtMWDBsNHRhZ0h6SEN0Ync2UHdyNU1PUURo?=
 =?utf-8?B?Sko1eEZNQWtTVUtzcEFoN2NIeGd4WGMra3ZEZW9LY0hObndkMERLT1R5K0p3?=
 =?utf-8?B?YkR1V09LWGdvWFZTOW1ZcU9WNmtMWWt3TFNBbGl4VzdaS0JZTWxvQlN3V29h?=
 =?utf-8?B?Q1lJTjJCYmd0dlpEZWdaSHp3bEhnUmFsUjB0WkNzd0JWcHIyYzB3V1JFbjl4?=
 =?utf-8?B?LzZYWE1PbWJFVUhYWkZGeHdrakdhcVVSWnpDeDd2QnZ3V3EydFlLR0VrT0Vk?=
 =?utf-8?B?UjVUbGxndjZHbnNXbG1Qby9qNGdNcHI5YUdjWTEwNmRlL2loMDlESXFxT0hO?=
 =?utf-8?B?MXozblJ2VlZLRUYvNEV6c1RJOXpvMUZqanFaemFnNGF5b2t6V3J2Y0dEa2pW?=
 =?utf-8?B?YkRQRG9aQkJNU0E2UDZFRmRaNnp3dllNR2FoYjcwckQ2TlZLQ21NWUFLeEJk?=
 =?utf-8?B?N1pqRUdGZ21LUUJtajZ2NGJxeituSll0WVVuTGRrS05iZGhTYXhHSnpBZk5y?=
 =?utf-8?B?OE9rd0cvZnM1a0hXWTRUczRHVlF0YmE3VVpDV1k5NmhGUm9waVJJVm5iQjEx?=
 =?utf-8?B?dFR0VUlkWXh3MzY2TzU4K2Q0MXgzZmtNSlNLMXJ2aU0reHhIVnVEVXl5RjYw?=
 =?utf-8?B?YzlZeElUekVmS2lYODFnNmdOS1R6THZuYkFKRzdac21zd0V1cVY2NnJ1NVUw?=
 =?utf-8?B?SDg2V2lCbVF4UENEcWIvK2JoQlgybVU1Vkx5bGpDZld2VlEycmVJaU9Tcldj?=
 =?utf-8?B?clU0NURiZEZ0Nk5VMENxSjBwZ2wzam5TU2VoTnNDUzF2SGgyNHYxUGpUQUM1?=
 =?utf-8?B?MkdkZVRXZTJRcWxnQndpcGtnNmtqRGhkRXVVUGl1UkVWZmFZTEU1V3pOU3R0?=
 =?utf-8?B?U3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnpPL2pCYnE1cHdqdkxEN3RDb1ovLzNpWTRvc0E3U0dHM1ErSzdWSUliY2tM?=
 =?utf-8?B?SkxHOUNSV1hIWVlhNzRXc0xoMDA2TmxERGdld0d5eVkyR0tiY0RLcTc3aVZV?=
 =?utf-8?B?ZnBvek5IcGJCZFFiWjNXODdqZ1lySUtvZWQzZ2Uza1ZRVnlKQXZHMm5aL1Jx?=
 =?utf-8?B?YXVacktOVkQxZDJlNlNWbTBhbXVyUTczWEhwb3dDaVdTNmprcjVMSmVQMWs2?=
 =?utf-8?B?VEdXc0xrdWNlVGEyajN1SXNwdVowTnlERk85Uk12Sks1SFBzQkF6TnUwMDc4?=
 =?utf-8?B?cEFQNHN6NHlRNHY1NTR0cVY1M0t6ajV5dzFoeHFJOUFrM1I4ZW1Ob1ZneEJ2?=
 =?utf-8?B?QTNIeWF2VVluS2VnQ1lHSHJxNXhWWkF0Ukh1UncxWmpnRk1XMW9SOEpobE5K?=
 =?utf-8?B?L0JjOEQ5TldGaytpUFlQVEtESFlUNUE0azdvcEJxTmNiM2RnaGJlaEMwMmZB?=
 =?utf-8?B?OFR5cFIwOW1hYWJrQ1hnTXRHaHRYL3lPR09CRzYwa0VUVDEvU0FuZnB2L2tK?=
 =?utf-8?B?cHZGellTNmsvNDVDblhXQ2plelowVUltbExUNWNxRkYvanM1Rlg1VVdVMmhL?=
 =?utf-8?B?anJJaWxCZlJpcVJ0S0krbHBjeFpKZU4wSVplMW9DQ2dWSTN5ZmsxQVdWR2Jr?=
 =?utf-8?B?QkU5N1hxZnNvT0VVS3QvWGo5N3YxeDVRQ2NpSGNtemVJajV5KzBuTjM1N1Qx?=
 =?utf-8?B?ZEI3cXFaTlJSSk43SEhDemJSUmFueWF3cnlHbCs2NS95MXZDNDJKRjhpNm5q?=
 =?utf-8?B?VTJMYU9RZUcrVHl1NkkrM3ltWmREV3FFeUZZWGZaQkV0YWxRazJLZFdaUmFS?=
 =?utf-8?B?MW0yWUhDaXEzaVlFTS9OYkc5bXA0bjkyNWR0VFQ0ZmFjUDVaakl6eUY5eWhi?=
 =?utf-8?B?QXoyNEdxS3Z2SmdJdzZhWk13QXFUNSs0SnFsK2ZMVXZsTk5yNktieXBqemRh?=
 =?utf-8?B?Z001QkNvTzROQVdhaGN0dytZNys4cE5UbURnS2E2VG5hdmI2L0J1YTJBMk16?=
 =?utf-8?B?OFNxVEpDR0tLMHNDaCtTam1ubXA3NEpuVmJpRHdFaWMwVldGK05zd3hWVFg3?=
 =?utf-8?B?cXFkM3hqbWo2aDFUS0I0NkkvSW1jaFNkMUw2UEhmbWZpWmJoNjdIN2VuQVNi?=
 =?utf-8?B?N1ZhWTcxdzgzeC9jZDZpRGl4cUVhSmMrU2JGMG10TWMwYW1NczlkUXZKZ2VH?=
 =?utf-8?B?R3pkNitYKzVMSW5Tc0diWW9zeXlTbjRJY1djZ05IWjRtYVlVZ0VGYld1UzJ5?=
 =?utf-8?B?Mkx6MWdKNWpuK2lqM3Z5WEptSVF5bjZDajRyVVBLbmlqanVDT0ZCWDR0N29F?=
 =?utf-8?B?T1Y0WUd4bnltWFBCRXJHU2NGSldFZitLaXowUFJnbjlnUjlFaXoxeDNwOEpm?=
 =?utf-8?B?S3YrWTB0dkJ4N3NIaGVud2lXanVmaFprR3R2bndPOFdhaUZ0dER3eXBTd1Bu?=
 =?utf-8?B?UVgzZ3NLWG8yZWtiUUQ5WVpjZVdOWENEdVEyTisyVDh4LzZ0dUZMT0IxdVRi?=
 =?utf-8?B?dmtpYTFwV2NPS3ExZ29GclVaWGJCaStjdEhUMzJKRzdoU2MrSWk0YUxNWkRv?=
 =?utf-8?B?a1VuZnBjN0ZtRlRwd3RqZTFBSHNnbzAvalVYTkZnN05QUDVNbUozSXBRRUFo?=
 =?utf-8?B?V0tXajA2RXR4VTQ1OFBxOGMrbmlDcm0xaU11b3c1dHZHQld4U3JSYmhHeXIy?=
 =?utf-8?B?b0paYm5yVzVXVzBZZ2JTdEI5cVp4ZmxQQ0Z5UE9pVnl6c0NnL0doeFFsMnBF?=
 =?utf-8?B?MVFobW11Tm41L1JUSE0ycTQxbDlKMit2djVtOEppTmx6RmNQdG40R2tvWFZS?=
 =?utf-8?B?cXIxS3hCeGt6dFc4TDJCemJhM1pWaGRrWDZtY1M0MW91NVpWWXVKSTRjL2sx?=
 =?utf-8?B?bjNLcHl5RmhnZVphelJuOTlxRS9HaEQvTU1JSmVBS1IrL1BKbER3Tk52NDJs?=
 =?utf-8?B?MUFWNWQ0YlRhQVU5V3VaRGxER1hjb0YxNUpYSktGT1VVdnBnZytzWW5MY0R1?=
 =?utf-8?B?VGg1NDk0WnpIUUpzTWVEekUrZExZMTduZDFiSHkveDkrRE5QR0RCNkQvL2pq?=
 =?utf-8?B?VC9VZ3BtV2YrZmpQU3Nvc2lsemFpOUl3bjJJb0xyQWlpZTNSM1V1TXRNTVp1?=
 =?utf-8?B?R29yRTVseXM4MW1WNzhDR21TVm52V29MbjFiWE9MbTRUY3pGcWpWQlpjaVpI?=
 =?utf-8?B?RldXN2IydU83QXdBS1ZrNHFsNEk3SkRNL3F1QjJsMk92RmVsVmx3SS85cE1Q?=
 =?utf-8?B?Z044dDNjUTdzMlh4VHdGZk4xVUU3MW8xVVV6MDFsNWtIdmFUanRHd3U5VlBZ?=
 =?utf-8?B?R0JNeEY5NjUxQ0ZYWW5kUUpmQmhycXQzdFBGekMyd1FqSFJGQldRc2pxc1NU?=
 =?utf-8?Q?A7Dn/qw0FBI2FiIo=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: af26919b-2e85-46c0-aa45-08de58e301d2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:48:34.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u1Hg8x5E34RDv3hEi9IJP5A379OnFKeTB37P4C8hIby+DgB4A6UpfD6Dc4MlBZjAq/3QdJKtBzALXCgge4v9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6303

On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
> This feature is stable since 1.89, and used in subsequent patches.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs     | 3 +++
>  scripts/Makefile.build | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6d637e2fed1b..122ad64880cd 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,9 @@
>  #![feature(const_ptr_write)]
>  #![feature(const_refs_to_cell)]
>  //
> +// Stable since Rust 1.89.0.
> +#![feature(generic_arg_infer)]
> +//
>  // Expected to become stable.
>  #![feature(arbitrary_self_types)]
>  //
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5037f4715d74..8fd0e7096bd1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -312,12 +312,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
>  #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
> +#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
>  #   - Expected to become stable: `feature(arbitrary_self_types)`.
>  #   - To be determined: `feature(used_with_arg)`.
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for detail=
s on
>  # the unstable features in use.
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg,generic_arg_infer

This is an alphabetically sorted list.

Best,
Gary

> =20
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree

