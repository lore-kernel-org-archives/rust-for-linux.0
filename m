Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F952D6E60;
	Thu, 12 Feb 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884795; cv=fail; b=YyWprXMbEch0I8rpNwhVnBjFyFVhLj6CVzRIcaJomKL/NEE0TzexTdPmc7QbokWNn6IZG1R6W+3AVAMSCxURJaOhF1sQwnMMXpx9X2+yknsZbj+XccaF4gmP6z/JLNefAm1shtZwoBSaJwkaMzHpHOXAVs4ILM0eXLzZeIPaiaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884795; c=relaxed/simple;
	bh=tNwRVmA+JvVmAjCoy06/qHg071qfgRhKd5MRBqnYQ04=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bm0SDmftXhTE9QnTEiKWehNJXD9hT0psY5FsuOabjjFi1a7G8wd+WKSPAAs+BDc+mDCwdpNWhq2dB/yf8yOaAygvpmD0ysfnOdDkaoxoXVgM4lgDLnn7N8YKoYurvWf+uHKlyNIkxqqBroMpCBnJbSOL/P++9Wxgfjq2Y7hJRmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XGRShGUi; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XGRShGUi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTi+CHmSf3JnkhzIS89nnLBKHTNay4haqI+qDPsY28wlaEROXeh4RZSAIt4cL/qLAer7eqHy99KtVItUyebaj7wzU1t23wKdU7IzjXwhlX7zKc6UwrweGti+5E9YiQVraKhCN3AMLY2HiFq7ulXrZWayOQMl01vkwKuDBcAAYtpg3m5j1OZlfcTUQUxd0Bg2BC0e1utPh/kDA3J/ioSlGuTgN6wd2TW9SKS0VKgOizDECUOgjdVj1sbnuyqJq5s1g0Tsh0hKnsMtYKXPdWIWsnlQ0DNd1+jznT8iQGEk1pyoHDbl6KF93JQXb3Ww/JVjpYEhf1++YUjWgx2PpMO/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2eQqbIIcTVHiCEwvuRjDWxx3kLZ4OaFW4jgCYELI3g=;
 b=V0y/fmb0VBPH8OUl+Ou0hiEUNHyITfcN1fthAIDo9QszihWhdceNd6U8oB9vn/NMVXWMdVvGyt9qBY8NCWWAtHdkuBEd9oTlxJyzkuHbBIHIW7vrrEmRv1ygnENdVXsVay713xA+2rERdjh2BAcx/unByMjxhNWfjIKUzicveZ02DQCxtuA4Dho2apJsZJzeNxezPfEIfTDmp3o2m9+BvRnL/pAIHUF8E4IUfCHpUFfujhoLSyELotowR2/FyEieFM93emgVDdlEtruLu0gdDiXh6BIn1YWLId928ow5P/GNbhDAWNo3DKWE/QNfUuTO5nWoO4cQgqwmHUaytehlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2eQqbIIcTVHiCEwvuRjDWxx3kLZ4OaFW4jgCYELI3g=;
 b=XGRShGUiyG8H/uAKbXV1zwA0e/32XMiDLyCiHl8kNkvYqjttrM0BgJ6zMiyWrD6PqI7UuC7Q2sWtac851wXBHHQSMXmxPvzO7nLMsHEUF2uL/sW+kQL9TRkgbozcFzRDreMfRtKiJC90yTHd+AZxaJV/rH7Z8Eo22c6xv91/opsyTSuMorPJbv1/issB8xJdw94gZvkob2WF6kWZqeUZe1fer0TW7d/OtEX0nRNas4Y5A9ztud3oO08A088gdJyfud2g64w059yQ4Ok82tTfEHHaLSG3lVRDGH13lmwuHmWgCqU9OZSccZer+3k1irn+uhcP+gXFjMmYeGZvZWZOFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:19 +0900
Subject: [PATCH v9 2/9] gpu: nova-core: require DmaObject on
 FalconDmaLoadable, not FalconFirmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-2-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd6e88a-5b11-48c2-6ab2-08de6a106d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFVkMXBvYW5CcUUrZThBenVaQnlFV2tDZDV1Q2lETjEwM0p0aGYzc0VRKzBh?=
 =?utf-8?B?MXRFa0p3NnNBaDROdmRDNndvakJZOFBvcU1rQ1Q4TTIyVTVwemtvNlZkUzl5?=
 =?utf-8?B?RTZwbktLREY3WEVFL05EbnhoZllhTi90b3hqOHJjdG9qaXFsdlBNTGZ2UHBT?=
 =?utf-8?B?UEQzclExYU45c1RHanhmTnpVTmZHZHIxLzlmWTlNTFg0ZkhjZkN1TFhqY3NY?=
 =?utf-8?B?NWk5dHcvRHhRaElCdmx6eE85aGFLV05iY0UybldqcmVGcnpzOVVTbU5SbENn?=
 =?utf-8?B?dHVzWkdYZGxzVncvREFKQldnSE00RDhpa3lGSURzMWVSdEJsWnpRaUJyanFk?=
 =?utf-8?B?N0l1STJ3VmVtYU5nMDd5cEdCcThGbDBtWHJpY082VjNCTHZYR2tWTTZna3dq?=
 =?utf-8?B?dnk3TjRVYlRGMEtmUkZDMkVSeSsxcFZFVjAzTjRZcHY1b3N5RDFwaUZlY0ln?=
 =?utf-8?B?NE5vak8zR3IxSkdJM0IxSHRFb1Z3VXhDYzMzOU05a3o3Lys4RnpVcTJ2L3FD?=
 =?utf-8?B?MzU3emJRUmFOTWpTSGZ0cDkzVjNHc1hxa05RYnAxV2k5c0RJQTEwblVLWWx3?=
 =?utf-8?B?Y0VaVkt2WElrMWtvUzRHYTlXb25lcXpqcTFORWoyWmtrWHNzKzh5YjhxOUZF?=
 =?utf-8?B?SVdrK2prckdiTEhUdVF1aUFSd0tnK3FkbXBnUjhic2JScWprYUJXdEo0bzND?=
 =?utf-8?B?Y0p5eVVGc3drMXVxL3JlL0RCVVhNMDhiRndvNHRoVm15UFlRMWN5dnQydi9j?=
 =?utf-8?B?SG5GNWlDUFl4NjBHS1IzNTlaSVJ3NTJkQ1FHUlpXTzRoZytGa1Q2Mno0QkNL?=
 =?utf-8?B?cjlPdy9mdHJqYlMxTi9GbmZIcmE5LzdpcHNnd0tSM09FMjVEbDdaNXRydHdo?=
 =?utf-8?B?Z2pNMDIxU3NQZDRlTnVUemIydVRzMVNmTUpEa1FNc3ZwYWw5aUVKSXhyZ0py?=
 =?utf-8?B?K2hpWThYbkQ4UVVLTVBGbXlZSHVScXpELzVORUgrK2s3c2RSRysyRkJHQjRI?=
 =?utf-8?B?anFWMzhVOENaTnhCeGZESEozbVVSUlR1cWV4ZGNNMGNEKzlMbUNDb1ljL29S?=
 =?utf-8?B?MHlSMHBVck1pZjhrSmphT2xvaUNrUFhGdnBqbGtBeUZqQkM2dzVYVXZ6L1JP?=
 =?utf-8?B?MjJNam9xa3FtdFhneHFhc1NpdnBtblVyOCt6akRmdjNqUnI2clFKY0kxd1lq?=
 =?utf-8?B?UUJHRFBsVjRRTWtadTdRVXRocFB0dGhVWGdvWE9wRm9odjFDdVB6ZHh6MGVR?=
 =?utf-8?B?WTBuTE5aWFZEN1lMdWh6WkpNeklidVIvZCt0bjlIYWpzQUJLeS9pNjdsZitL?=
 =?utf-8?B?VkVZZnRNUDI0RnpyRnBRSTZiM1g0eUJWN3hRRDlTRk14WGRWWnYzNmk0Ui9q?=
 =?utf-8?B?Y2E3UjV3V2R1bnhQYnNKYWc1aGdvUFpBN1lkcHJid1JhMzEzZ0txdlpuVE93?=
 =?utf-8?B?a0pLSE8yWDhJUml3cmpZOUxhT2RZb1dYbjg1ZTRVQ0JNb0dtNFFFQWIzRFlQ?=
 =?utf-8?B?ZExvdE83Z2lja2ZXeXdtU2ZXSHdDcDZ6WTRWNzFwYXVnYnRobWZDT0hPcG1Z?=
 =?utf-8?B?V1lqN21iVnRQS3RjQlRML1JnbmJWdnhDdE1GZGZMbUJ6Qm5CQUtzekdUdEdy?=
 =?utf-8?B?WlZxaVdYNG5ieDRWR0NSOFJ6ZXorSVIzU3FUclZSSUNkMU9jWUdjcnAxMGg1?=
 =?utf-8?B?NS9zNUFqaUMwODVsUURRVmtGbllmZzZ3TGhIV0IybXIxT1ZtZmVxdzJUemNK?=
 =?utf-8?B?TzEzekpkVTN6c1NOaGpPdWRDWmVZd1A2Sy9sTUdwdzFoT3lQb2RjaC95UVNE?=
 =?utf-8?B?bUlobGZMejFHVmdwcjBYK0RGelN6dmp1dEVUSWc5Q3BhRVFFMDJFVDFwOTRw?=
 =?utf-8?B?Qk1CNVVRcGNsYVpGdVlpM3lhWmt1ckFPVUpKeWtSYlpscVlKOUFxV0Q1Mkd2?=
 =?utf-8?B?MDA5ZmphZVMwcW1nUXVVaURtaXNXNmw5d2V3Y2IwVmFpKzFoMmpTMm12VFNT?=
 =?utf-8?B?bDg4QmlsSXFwMlNkeUo5Rk4weElkVkp3Y3NPaGdwWGVZYkxSM2lkK2phclN0?=
 =?utf-8?B?SXJVV1d1WTZKOW5CZFBSYXNzb0VVMU9YZnFLWDNqc2ZtTmhVRDVyRDVmWUY4?=
 =?utf-8?Q?VThk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlczaTZKZmI1ejVFNE1pYm55SFhURWFVMzdXUlNOT3lCZ0diYk5aYVRMWVND?=
 =?utf-8?B?ZkZjK3BvdGpxaE4yaFhTN1FPWDhSL2doNytSSzJTQ0pIRUZTcGY3S0NPZGEy?=
 =?utf-8?B?TVVYS0g3cU42Nzl2eVRQaGR1cHhZdDNPSlNaeUFNSzRZaUlPTElQcnBVK09s?=
 =?utf-8?B?VXpDOVFhV3NuNXpMTHZMWllIdGZuQWd2Q2dpdlhrS2ZtTHNjUjJ6ZnJJWU1I?=
 =?utf-8?B?VVc4YVg4Z1NlZktkN3VzaUFFSG9EVllHdnp1YWx6WlkxUFNvSE5pVUNxTkda?=
 =?utf-8?B?YUpLcERrTkZlaENYOWtoRE1lR3hubVhMU2lCay9QRFJFRGtmSWMvbnNHeTlB?=
 =?utf-8?B?S01nWWFVQ0dGWGFvTktYY294QnNMMkFMSzJucVlJSkl6YURnMGZwT1g0TnI3?=
 =?utf-8?B?YURyeGRxT3NZWXVRcmlCQkZtSlZPeE9wbVJtS0IwenBwTDZFSmlEbWFaSHpQ?=
 =?utf-8?B?Q1MrNGJJajVHZW43T1JtT3FNZjFiRVBJdHh4ZTc0TWRFNmRzZXRPWDJpTEE2?=
 =?utf-8?B?K2tQM204Vk1MRUZ3WVV4SDZwSlk3OTVHRXpFcm5FejNXN0RMWklwZ1RBZlht?=
 =?utf-8?B?TXJXMFRNSXo4bGZMd3VvN0w5bWhNUmRvSVlUek1KSFNxL0M0cUNYZGxHS2xi?=
 =?utf-8?B?RkVLYkJUQ3hjVHZlSmE0TTI5MFRCeVA3SDNPS1dCd0lsMGNJMVdLL0tORHQ2?=
 =?utf-8?B?QlNaQWJVRkZEamRsSXZmOS9sM01qVExpbTBQZTJ0czNia1RhQm02Mlg0Y1Bx?=
 =?utf-8?B?TVZ1SlNUL2MxSENDQW4ra2o1YTVTa2hvMFJzOW5BQ2tuMVRhK0JnK3E0QTdp?=
 =?utf-8?B?NUNieFdIeUY0dlVRTmlMYUxySlBNTHh0U21jOTBpM2ExcW9yY3dHb0txMTcr?=
 =?utf-8?B?OTMyamlydjRjdGlGaWlFWDY2VnZsdzRYdmtRWVY5RTEzZzBzV2xVZUJ0Q29D?=
 =?utf-8?B?cm1Eczl5TVRiUVJCdGJTeGlJNGNyYm1SSm1hQWo5V1kyOE9BMld6WjNRWkRt?=
 =?utf-8?B?ZEtzZUlHSHVBRXZ5TWdBM3BPalV2Y0lpaU92QWg2Q1dRTkpXU0xLMmUrcjFN?=
 =?utf-8?B?aUx6SjFVbUZ3U1JWOU40cTJEa2tRQkJJa2RRSXpOU1RvWGdDemk5VmJ4QnFs?=
 =?utf-8?B?WG44UGZ5Zjg0ZHh2bE1uOTRydmxlMldiRXdJcENYMDVyeTE1b3N1cnlMWVgx?=
 =?utf-8?B?b1dsdHFOYVJqakJ3cDNsM1ROOHhXLzNoOVVqNE5qRlVudExnY2NuaCtVN3ZZ?=
 =?utf-8?B?QmtDNWRqSlJLSVVMc1FZK1FCaEE5ZUptOERlMFRWam83Q1lGT3Z5V0RVbk0r?=
 =?utf-8?B?K2lsY0dwdlJyL3BSb2VKcjh4QlRTcWdsTWkyUk40VVJXS3JIVEtEUzhjWmp6?=
 =?utf-8?B?OFB5WjhidGYvVHhuRVhpclJWcWJWRTVROGVzbjRvQ2k2bXIwZ29EMnd5OEQr?=
 =?utf-8?B?eHViZGJsN0RqbnhTdXJLQ0w3bWtIQmJkdGp1S25Tb3NISytEQkVTaWcreFVE?=
 =?utf-8?B?M0s0ZmI2ZjAwQVU0Nkg0cU0yU1U4bXhDa0xEYlhXVXBkZzk0bnlsSjJwLzZi?=
 =?utf-8?B?NW5NbE9uWkhWanpQSmwwSVQzTm9aUnFsaU5PbXZrbzFCZEZvcTNJaUo3Z056?=
 =?utf-8?B?ZWRZTzdoblQ5VnBkT2JDdG9oRmlETldlQ016Ty9OaW1za3QyYXpuL1ZRZUJL?=
 =?utf-8?B?dGFmZ3pKUEF6TWhiSHd5QkhXUHJ6M2QxYXRlemFCNTZlVFMrOHRDdVFSbW9F?=
 =?utf-8?B?V3ZLMmxVOUhqankxT2xuT3J4UHZKSlpVZ0NFV0lEU2VoRzRZMEVleHZjM3Bl?=
 =?utf-8?B?emRoTnZ3WTVyWXphV0FYcFVVSVNCenEyTjRSWXdiRlVGNVpGa1lJMkU2MEp2?=
 =?utf-8?B?aVFnZzVBTnhnUExaUzFML1JsR2RWbWt4cnQ2b082NEgwWE8zVlBVZFNNZGUw?=
 =?utf-8?B?VFUxU0N3Q2lJSVVvWjhZOU1oTXhwOU1PT2xUQXpma2VmNzFCTTlsZHBLTHV4?=
 =?utf-8?B?OHNhZVVYaEgrRnFoTGMzR3lZck5INkQvQ2V3OWlqYlZwYWF0RCtMT3ZsUCt6?=
 =?utf-8?B?blRseFhpaTBGK2pTWFBoZ2dHOXZxMXhnWWRsZUdyYTNjdXM2ei9zQVZmSEh3?=
 =?utf-8?B?ZkhkS2xia3FUZ1pseTBhdWxITHRoSThBODNXaDk1blhtYklQd0FIanhDSmhZ?=
 =?utf-8?B?aWhKQjlwRDlLSDZGZHRrVVZneGhyM3cwZytsUDdIRUtjZmhHdzNFUVdCaDRE?=
 =?utf-8?B?N25oa3VyeGNwRlQ5Q0dUcG1JQ2FHdzdQakVsdkUzVTZDSUVWaEZ3TFdXWUtm?=
 =?utf-8?B?cDF4am5JK2RSTmJISTBqcE5lVzdVanV4UUVJdmdjSjA1cisyTDBHekpzc3Iz?=
 =?utf-8?Q?s/C1BWwiP/TVGhlLHcX4bPd9g+0UK0dqgRIf1UvNlefUF?=
X-MS-Exchange-AntiSpam-MessageData-1: glbsNCaFq1u8Ow==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd6e88a-5b11-48c2-6ab2-08de6a106d0f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:31.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZMIyRD4ts+VWCI7aoe2jLbOzMYyj4SBqGnmcI5T2XUt33UVHg1PIMntjf3V93oX8TWUCsWra5NQeEE/rjq6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800

Not all firmware is necessarily loaded through DMA: the PIO loading
method does not require shared memory between the CPU and GPU. Thus,
move the requirement to dereference to a DMA object from
`FalconFirmware` to the mode accurate `FalconDmaLoadable`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 85918a03b37c..d2f27847f533 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -351,7 +351,7 @@ pub(crate) struct FalconDmaLoadTarget {
 }
 
 /// Trait for providing DMA load parameters of falcon firmwares.
-pub(crate) trait FalconDmaLoadable {
+pub(crate) trait FalconDmaLoadable: Deref<Target = DmaObject> {
     /// Returns the load parameters for Secure `IMEM`.
     fn imem_sec_load_params(&self) -> FalconDmaLoadTarget;
 
@@ -373,7 +373,7 @@ pub(crate) trait FalconDmaLoadable {
 ///
 /// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
 /// object.
-pub(crate) trait FalconFirmware: FalconDmaLoadable + Deref<Target = DmaObject> {
+pub(crate) trait FalconFirmware: FalconDmaLoadable {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }

-- 
2.53.0

