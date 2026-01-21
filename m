Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC03AEF2D;
	Wed, 21 Jan 2026 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980264; cv=fail; b=s947gEoc88wg2nfa7RBZe9rLTIVVR34fsVga2/yMA14NbVovpODU1aViWu8XpuHk3E2k6VGCwnEHazWt1MGfsWYBkjtzI2YwOMbghY1BVNrYgazMmrluZIsmm5EZFmnYH21dJiegIW0HMRaK8V1vLAITT6aREYWXetNjHLGHvno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980264; c=relaxed/simple;
	bh=u6vranoC1vQuUDy/FpehRH8OoU9Zd8p1WGFA0bKnHFM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fq0bSGYiu/vFhQgYy9CCSlffIDRgvQamQS+cfgaW1x36PCiKXWYWCjfwQPNvO3+3nTS8fFFlQf2bGWtbw3NZRH/bY1s88YSXA0ieWH4RUl6kmunOecwxIPtfJsdjxX2up/Z4BkTejbZiK4MSg0bsi6tTrrPKoE/SBmIqV5p4Ppk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WtNE16qv; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WtNE16qv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHAlJHI51sO8ZB45W5qhSFmgLR24mzeVCypYXWxBvm3aZvQ4eK5Ftr2NuThcgT9LckCAyIxRAI5B9M1Yic6nK4lEPCdY8xDiWZ+VJNaRCOwR7PL4keEwwZwkwV8guUu2+ry/5+8A12Im9W87qLGHSzYG9QhT78qJF1BBjNdYZj+0oE4HkIcdK1g1MhBT5H3RAI1Ofy4FiiZtYTjtSUoWr6EUZnMIUbOgBmYmT7zqFzdjgqikqjdPE9GebfFm97slyqRS2e7mwEHsS2d7wlOLqqfliYPM0n0SXY2B88TRxaXsVzn4h5bVF9zBid8f9tOYhvy2IOaI+6qZM3GGZrrc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcbbOxSZWOgbb//TER3P6xUcbw1rNq1B103CxYv3CkM=;
 b=nW4/59sUjJpBHjsAXLLWQ8Rt74w82oi1dj49RvHmXHZjLzFUsLgLNoN8GpCM151ynOQNdpXVqEZmO2ReUjddnziJ9vxNGSW/kzGtN1X+mW6ZSKAkZXD8ZnfnP79yZEADAStJo6MeAktyg3K0z7QOuQ9HPrxSkT6lQ6FB4Az3OFdV/MBHvNxy/1wDs9DMQ96qYdpQ7J8oZ0rFDi+wf4GpF+zfLnDjo+us2wN5QQgrWvA/9FhSant8sZ3SxqY4oZFe3HDAWsUDKRlM+y5f+DjxgZv5/teDtBDlb7ZSkgb9C/+sgmblHIo/DGi/A82LVD6kukFc5eSNsMO/dxQHMxbzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcbbOxSZWOgbb//TER3P6xUcbw1rNq1B103CxYv3CkM=;
 b=WtNE16qvjT8M5VSz7B1jojXYFHX+WDS2eoy8QfK1s1Z8gXJz5ChJ3mOFSnPeulcJDbTcbKsNCcfVddLs22V3cXyJYAsUw25JDq8ERoNGIyF30rtwpvrN+880vBEXlRJZw9rNB0ks/SQF4RoeEuA1ZqJY7fx18K/KLHaMz21mj2I7SQexPXFBA3/AylOXOMbhxNCm+12jlFMvUeyQOJKY5J9PPxjgyHVW5G4BWlcsmfjMARjwWIDsUWGBlF/T4B4/5cgyEIjq7tjSYTV877KD3yfs2VtVhKt8EruRQHg71GG2F701IXn3xIff2bjMtVNrreEKi6hmLFXiY634OnVVoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 Jan 2026 16:23:53 +0900
Subject: [PATCH v2 1/5] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-register-v2-1-79d9b8d5e36a@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f833eb-6b64-4c89-e283-08de58be16d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3hNZmhmclFsRm1FeFAvSS9laVZrZkp0R294NEpvZmxpRStOWjZUUExrOGdK?=
 =?utf-8?B?K0ZtbG8vNklyaVRHc2FUSHVVeGhHQzlhV3VmdGZ4SjJtUUFab2FQK2VNcFNi?=
 =?utf-8?B?VS8yWGdKN3hrRk13NE0yQi9pa0Y3Wkk1WGFHdGJycjRGUW8xOXhkWGw2cGs0?=
 =?utf-8?B?TWxQNFZKZHZPSENpOGtSQzRFU1hPM3dqTVJ6dDNKd2gvWHp1SEJBaUIyQS9I?=
 =?utf-8?B?Vy9vOUZVN2k5S1Y4UWpUajlZUWtiYVN4WHljMUtMUTJRd2o5bitqUEVVRVdK?=
 =?utf-8?B?QlR1SjV1a2FIanlDNHNLUmFZY1NzVmdPYmM2bEtnVFlSWENZVkYrL0FCaWRF?=
 =?utf-8?B?Rmg1enQ2a2plRjUwMHQ0R2c3bGtRK0FGdWl5SGlSREdPanRqdWFWZ09sZkw1?=
 =?utf-8?B?d1NvaENXMWJDMm8zWjR1U0wwRkk4Y0RVYXJIb3U3a3NNZ05IazlwL1AyVndF?=
 =?utf-8?B?R1FBQms3dTZIeUJaRFRlQU5wOVZGc29HcE8xT0F3K0cwSXhNbVMzbVIxdVk3?=
 =?utf-8?B?WThTZFRnbHp6RjQ3akZvM3AyRjdyei8zdUU5TWIwaFR5dkthMVBlLzZmOTlG?=
 =?utf-8?B?eTArbm9VUHJOMXRNYmUra0doaUpOWUxWRG04NHNRZmdpZFNIZmg2T0Y2OXdo?=
 =?utf-8?B?YkY0UUZMWkJDQU5sVkI0bnJJa3o3YkRWc1JvTUhvZ1pNcDZWY0E5SjdzRVl6?=
 =?utf-8?B?SU0zVlZFMnh5TmJ6RHZsQUUrYXBiUUJRQmU0UFFNT0lka0NoWUlTa0hsQ3Ix?=
 =?utf-8?B?cjBLdG9YeUk1OUJhc2Q4UWg4L1dDZXB3TjRBdktKVnFZQnpxb2FNVlFpTUww?=
 =?utf-8?B?V2RTQmEvck5VejF4MkdoQVFqM041Mmw3anlXc0NkY09tSERobEdneDhXTjN3?=
 =?utf-8?B?SGpaZldoZWhNU0dVZVl0UHdLK1FpVWZ6NkxKMDZJZjFTc1JZemlETzQxZDc3?=
 =?utf-8?B?NDBpaTJWQjFMZEZ5U2hhdXA1Tlc5V3JSZmIrcnFFdXFCK09CSUZlMnRBWS9L?=
 =?utf-8?B?MU8zbXNDaHArOEYzTzRzandyUTc5N1BPUTE2a21SbWhvcmJEUWwrRXdSMXY2?=
 =?utf-8?B?UlcwSGp0amJYMERjN0x5UDBlZGdobGhodEtSa0ZhSU5RakJEMWNQNytiRWVa?=
 =?utf-8?B?anYzK1JFWG9KamlpNk85a2paZjRQR2EyV0dsdWRISGlUUU50d0Vwa2taMXFT?=
 =?utf-8?B?WjdRaEZnTmpmckZtRHV2Q2dXZnBJZ1JmVDA0V3lSOVBseFVlS3NIWm1zTUpU?=
 =?utf-8?B?NFBHOHptV1dwQkFaRC9OQk5jVjlMSzFIcExnUlBjZHVWYm8wS3N6RFJvNS9O?=
 =?utf-8?B?OFNnYkwvMlZUdVNpUUZ2RW1SU24vcXJjTHZxWS9pcHZuNFphUlNEZkZFZjBx?=
 =?utf-8?B?WHNsVHc1UjU1Z1RkOE5XRVFLUHJYK3FHM04xWE5ZTFl5TkFqYVdmY3d0cnFS?=
 =?utf-8?B?emJlWHBsdVVkbXNQN0ZabzBjMGxxSmxlaGd5ZG11d1NOc24wdTY4cnJiSEpx?=
 =?utf-8?B?VHJsRFJEeDNUM0wxVDdjN1g2Q21qM29oNG5Id0RhZGhmbFhrQldOVkJOV3l3?=
 =?utf-8?B?bzZwQ3FVUHpUSk1ZekZKdnR6MkxzVElWWnZMMWNoNFRWSUlWTGRjckRJOXhE?=
 =?utf-8?B?eEY3Qll3YVF3S25rcTg1VVZ0WnlrV0UvbUVLWjRBaTY3dmE3blRldDBvRFhM?=
 =?utf-8?B?UGd0U1JRWXFYUU11aEtMM3MyZGdKMnc2dlI4SFJqbGUvNFd2OXNFakI1UVNh?=
 =?utf-8?B?Z2ZacGhyS01samFrOHBsd0htWGprYWdXMEdpQWthd1pRNnhSYlpGZ3N1WW11?=
 =?utf-8?B?Mmt0QzZ3cGZEZ3hzWG1JeGlsb0N2MFRSbWt6blh4MjlxNUJWNlJxNHZiaWJj?=
 =?utf-8?B?WmUzM1ZHVzMwUU5VYm1JMUFrTFQyNjRYNnFGQTUrYWVNUDk0QzVDdFdNQ2Zy?=
 =?utf-8?B?eXVqUGFBQnhhTGhVQjZJQ212WjJSRlBDblk3R2NYazdDZkRzVnZrQUFSZlBn?=
 =?utf-8?B?VHprZW9XMzE2V1VrVU01VmJPeDFYdUh6ZzRqc3hQQWlpY2ZKYnpVWFYyVVcr?=
 =?utf-8?B?ZHl2RFhMM1owUCt6aVNZSkFvTUxZV1lyQi9mc0RyN0VrN2dVUkFpOW51ZWRM?=
 =?utf-8?B?by91S2ZFWDFyYmVQWGtpQ1pObkZmN0xaYnJlSkJvQ2F5bk1ROHNUa2laeC9h?=
 =?utf-8?B?S3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGpuQXhwYTNNZG53Y2EzbzFCN3JsQ0pYQ2IxSFYxNFN1d2FWTzNIcTMrREZm?=
 =?utf-8?B?NUdoaDJ5SWViZ0UxUUFNQXJJS2JUaXVNZTdXS1c4aEtxTEYvbkIvSGVUdTI1?=
 =?utf-8?B?VlNra0FYK0drUmh2aTk5Tk9LeXJCYTRRd2VrTjQ4ZmJCZFR6a0UyN1ZUT2h6?=
 =?utf-8?B?c2gySDF3dWZWVHVGd2RERnFjVEJRSGhqMG5UVFdZTlgvSVJZSnhOVDJkR2Q5?=
 =?utf-8?B?cS9LeHhIZ25Cd0t3Ri83Y1hDbEZHODEwQXJFNEhEQVdPY2NYWEZscXduWlJk?=
 =?utf-8?B?cTNzUTczeE9zUWVxcGo0bEZ3KzQzdmU5L0dyYUNUTjI1Y2NpbXhvQXJtZitt?=
 =?utf-8?B?Q3Z2R3Fjc0RiK0szR3I2T2NCYkZVTmhrSEZGZndVOFdzZ2VUR1F1UnFXVlF1?=
 =?utf-8?B?aWlHRDQ2NmNMay9aRlVtaW05dXRqekFXM1psL3BudFlTbkxSTEhSRXRsbHlx?=
 =?utf-8?B?bko1dGhtdHd1Zm5SM05UMXZ4RFZCUE5pZ1J6TE5pOFBjTVlFd3l0bEVkeG1X?=
 =?utf-8?B?M09rTnQ1SUcrdDhvbFhLZXhDWXBUQWJaclFXYnNaS3FXSmtPQzR5VHVVWEdZ?=
 =?utf-8?B?L1JVRHJuSTkvMGZGYVJMbXE0ZDllV0VEOU9DdmZMZmNLK24vK2haaHhMRXNt?=
 =?utf-8?B?UjVSYTNxcm9BSURyZ2xqQUpodGpGY0VCQnA4UFZoNDh5aG9OUXk0Ly9sRVlS?=
 =?utf-8?B?eiswbUN1TjZOcjNNY2hmSVRucVBrdUY2WVNSQnhRSmVhZ1Z3bXNNcnYrVkkx?=
 =?utf-8?B?WjFuY2d6VWxwNmtoNVVBZUEyNFV6Wk1iNkhxNWc3MjFlcnhvSkE0WE0vREhz?=
 =?utf-8?B?b2ZPQzZTWE10ZURKK29QVnJFNFJuTVhFLzdicU9yN2M4Ny9uNlQ0MGRVNXlv?=
 =?utf-8?B?Znh4WW5VNlhxR2hPQWVndm9TRmRsNmFycWdpZitpNC9IcWNZTmx1ckZrRFJ1?=
 =?utf-8?B?OEtXSkd6V3Nod0ljQWlrUmhTWjlrSjhQRXQyN3o5bmE5eTBCRW5RbkljZDc0?=
 =?utf-8?B?cEtzUllkMlIwNEpnRHpMZk9ka2RLNXhXWkdUYm1ldVNqWHFwb1E5RjFyYlVT?=
 =?utf-8?B?UUxRT3doT3RmOVdsenA1ejhiL0g3YjgweUwvdUJTVGpxbmx5S3hkUG1IWE9H?=
 =?utf-8?B?ZkdEMzJjcXV6bVdjR0lVcmsyR0huMkFFM1UzbEIrU0ppQmV5OGRyWXY5bFVK?=
 =?utf-8?B?WHd3UXdzLy9wdEltakFMaExYaGwva1MrNnc1Q0FRS1lVNThzd0tjcWZjblpu?=
 =?utf-8?B?amxpVDI3VU1ESERIWFhMbjBwdFNwK1JETkpRS0lSUHBueU1OZHROcGJ5WjE1?=
 =?utf-8?B?a3dyUnNmRmlIamtjbEY3VnRuenlsenozQThLQTFjTkpxYTU4TXJBT1RjcFA5?=
 =?utf-8?B?MEhHWTFwekZkeTNnL1d0M3dPRkloK1JyUU1oUldhK0J6Z3hETU9NUlpWdXRC?=
 =?utf-8?B?d0Nnb1JncDFOTmZmd2lnNHB6cXJzYUFkRG42UmYrM2QwSVNxZk80TlY5aHhY?=
 =?utf-8?B?Vm0vRHhjRzJnNzhRK1ljajU2Y2tTY2dObDlRd1o2cDVTdlU0K3AyYTZKVUlN?=
 =?utf-8?B?d0tTSlVFVE1jQjBpcEF5RDl3Z0VZV2R3TDZIdy93WU9pbG9iR0lhTDVjbitY?=
 =?utf-8?B?aHhST2tNb0VMSVdyY1I1TWdJR0R3T2t3Rmp5SnpSOXlaaTNLSkkzZUZQMTJE?=
 =?utf-8?B?UmpSeW4zM0cxUGF3ZFMvWWExamY4Tk9iYzBvTGV1ZzI2TWovWFYxYW1sZVdB?=
 =?utf-8?B?ckkyNUVYWS9nbWh1V1lWSmVZR2JJSC84bExwL3BDRk9kNXIwWjVNeEdyNVFN?=
 =?utf-8?B?OGxkaTZLT2F3Y1B2ZkV2RHdiUjFLcmVDcjI2NzJNRlBCVllUZTRNQk56aWRx?=
 =?utf-8?B?Y2dyem9Zc1FaQi9VK09qL1BTakRndHdwTENQSktELy85UUhsMkFtY1NnQXhU?=
 =?utf-8?B?aVpkM0lkU2FlM2xaaVViVGw0aUZsWkFmVVl1bEJwUm92S2RNc0lxSHN0Tkg5?=
 =?utf-8?B?Z2pURjN5dmI4czZNSGtwNEFxK3dkbVVFemNRU1Y0MmJIT0JVZ25UOGZQbVcr?=
 =?utf-8?B?aTYxL3BTT3NZZG1BbGg5Um52YVlhdU1kNGtpd0xJVk5zL0NYTGhyVktOSW9u?=
 =?utf-8?B?UXFvV2c5QStHUXRCaHJQTHpNVnZIdEZZdThMcmdML05QeURHYzJwRDdCdm1Q?=
 =?utf-8?B?aW9XU3B1QjhsVU5xODc1ZjU3YjFjRjEwTzQrN2UzQnBXTjFKNXZjK2ZBVXFj?=
 =?utf-8?B?YmpNSXIreXAxbk1FQ3lpQTBoR01jR2ExMys3ZElpdUNIamQzYmR3ZldRa0dB?=
 =?utf-8?B?TkZQQVpNSlBjRDcvQ3pldnNUZkdjN3R0WGxrcmkySVUzeVFwN2lXMzFDcFRG?=
 =?utf-8?Q?+7/wKZLMED+kXHNOoTfQ/wO9tsZ0XAzYIiKAOmwpJDRy3?=
X-MS-Exchange-AntiSpam-MessageData-1: Brll8v6rbHHIiA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f833eb-6b64-4c89-e283-08de58be16d6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:18.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5/uhey6qJGjc2eTOid1e/BEKorzcE99J+BSSIRwCnxqN7mqf/0mrc4DHvF/FqX3RMqm8wzehr44Tgnx427UIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

This feature is stable since 1.89, and used in subsequent patches.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b..122ad64880cd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5037f4715d74..8fd0e7096bd1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -312,12 +312,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg,generic_arg_infer
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.52.0

