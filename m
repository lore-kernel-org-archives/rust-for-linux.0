Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A129CB57;
	Wed, 28 Jan 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567862; cv=fail; b=kjl/GMuHnMKT5j1eyjNC4jwOFlb7XcyCq6LwMIN4N+9wPNWv0F3q19oD3cLNBx9d+Jvu24vAX5b/wsEPwC4yYb6xiNyzf/JWU/TNHGWbiviviBID6KUHfwiuZcdXb35SeX3bpGZ2l7WvoLB9sT7l7vdKhu39Eur6te0+FHNVfR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567862; c=relaxed/simple;
	bh=X4lDluXAUVw2Jbvj0d4PEL7Nz0HYbGEfpGwR91vlZEM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MwMHcT5mR7ruxoLjlMHDD6Ib7qEgaqTwfqW5wchagTKHaUpUNtZ77Ex0sczx5tkmbQTF90LJ8VCaMSB+QlTdA6gcl3eq5AAtY+yjnkABTpY2Nbi4z3nnhZHSPY3y+LOcX2PCD00hN23Bu3uUx0H5+mrUiYDd+az+NUkYiDwRNuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AFL5nMwx; arc=fail smtp.client-ip=40.107.208.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AFL5nMwx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCPLC1q76xVDNEIhTsR2GsWX0Cj5nEdNLdipy3JuZ3gzojAxs33Gdw5Oh0iCzNJFi6zkAB4pJOcFo5YiRbBrJJrpoRwcDinjnFD/hKnOH+wU5rsbZ7x+rRGJV+TqmUfw6PvppRCmYcMi/ymUeVfqxztuUd/50/7pIquV5m9IwPF7sKryFZB0OriXFCA4De26waxazwT88u11HIoNYH9T1fD1awRmxPLWmKwUYCZXPsuv4kewfOYej+OgBYrx4M+XA+XoL6MZomwNn9gbTEUmrA1EBuZexG+JG5lJishYD24KqcXGzWb01EjUfk+uqWKfRL0LaBtun4GWcVtdP24VdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSfvAxLz+4SDIFzSHfVLJiFUaRGC75c5uP82GVaXaRI=;
 b=jA+24vhzZ+YI32ph5VAOB7szQeCD+KewLrTpC3XJ6qnx6anXlaqO0eJXdna6YIEPbelnCjvqWjcD0bdnU6mQYPegeIZ/vOFuV5Usxcv8EEyxzBlgRkf6GRAo3AAHTZ5YuV5vem3vOLGAzpLW+706TwXJjcjSQA0n1S+nuddkrJIgwUlyIA8gKA2QD7b7xQqnaise5YbtZmG4CKgm5g2zd1OecZSCZ7UoMrEV6FRztaUdQF7XyL9cMhxShlRMuTRNkqofNG3TruR/j+K+ey5P/bXeYifKdbSqsAXG2jlgjjHqP1N4NLcWxelvieQTl8u0dycP8Mv3hnIMohhgRl3n6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSfvAxLz+4SDIFzSHfVLJiFUaRGC75c5uP82GVaXaRI=;
 b=AFL5nMwxGQVY6ZViKGlkuOnbZhJmyvFuZf4jEMQKjrzhrOtwnWkGH3vu5r07KIDO1eB5dMGUBcCdtwKjAjIzgXmWJuG1LbEoog8jCFlzzUHgRKw4sMcmiDekr/RLwcLNb8wJq6U3zEM3Pmj7HQxUbNmVJQbCKpyrtln9qUG9/ygLb0VGAiVUljdzQvAGNZCVuTdk//fnm0XiBHXZ2NrDBsfIPQc3MEzZxJTrMZjiOHH7cL/GiALkVL2ZzrD7ch4vTLO+RNajSY5j/P2EXYty775O68Sg/DSbRs9WpLNPbKD2iLAEEMyJ7tcQilqBtykxcLgKRJoDs7yaAIiNiX7GnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:27 +0900
Subject: [PATCH v4 1/7] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-1-aee3a33d9649@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a51f512-96a9-4fab-2a99-08de5e163416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjVFV3VDSFBMRXpqRmttYzlTS3JLaFFGWTFHa3FSdmdOLzh2VnNVQzg2bFlS?=
 =?utf-8?B?ZExucWxYZEhnSzJFNTEzdkgrTXF1Y1VzTllGNkxrN1NrcW0zMmFkK0s1SzdD?=
 =?utf-8?B?MFROWm50aTdZVDZVK2tQYkhjYmpmNEZZdHRaclNORWpnVkw3clI1bWwwaHhx?=
 =?utf-8?B?MURLMGMzRXpoanZLUWJzQ2MyM2FMbHFXYko0MXJSamRQME1ObmdtUmRkS1R5?=
 =?utf-8?B?bldkSHpldmZ6U2E3WUFIYmZOVHJCZ0lDL205MSthQkNuR3FmU0owYkpUWklR?=
 =?utf-8?B?SlNSeVZWTzZ4TjhNV3UzSVhpdDlsZjVVMXgvTk1KRmdoY2lTTGN4SGNvcmlM?=
 =?utf-8?B?MkpsQ1d3WkNMdkdSK2JFM2RLbzcyOHFyUVpVR1FKTG1USWNtcmNaaFdPQjhO?=
 =?utf-8?B?TElzT1NyMHdtV2svOFk4Nlg5aG12a3lKTmJvd29leGtsb3c5K2NYZ1Z1WkU4?=
 =?utf-8?B?bEtIemJpNytUUEp2Uk85WmNwK0NVdGF4MkVFaHNOdUk1OXNXRjdzMjY0YkdO?=
 =?utf-8?B?M1ZNakRTZjNVbUFIcnlJZlg3bzBtV1dCa2tGcVd1K0V4bmNxZUNhd290ZzFw?=
 =?utf-8?B?Z3EveWx3VlE1MnFoQjZxQzBuc0RwdnFYb0xsNkZLV05EWk1MRk8rVUFtdk1V?=
 =?utf-8?B?TFRzTTlITmU1UUdOYVZFLzRxRDAwK2E2Mk9TbS9mdEN0aWNkSVl5UmpRSEZL?=
 =?utf-8?B?ZDd3MXNRdVIvK2JpV2NwcWdpMG1RRWZaZU1IRGc3aUpEck9OSlZEYjU1UWlv?=
 =?utf-8?B?MlJrWktPSTAwWHZZN3duTDVxYmJnRmR2dWFJSkpPR3hpaVlrNXovVXRVNE5R?=
 =?utf-8?B?R0s5OXhGU2dkWGYzWVNuNVNQS2NzN1dIaDgwSUZUT1hvUUNrTVV4M3pUTC91?=
 =?utf-8?B?NFdCclFZeGxDTkM5OFBZelJWdnZ3V3g4Z0xUR01jeTQwaEFMalhrV1B3WDA0?=
 =?utf-8?B?aThPTlhMYUxkSktoZEg3THdYQ3NEckJDNnNrWkY3N0xNVktGcnNua2g3WTVn?=
 =?utf-8?B?Tm5oaWF1VGtObUdCek1EM0Z0Y1BsZUJEcUlKSEhCS3pYeDNLaVBQZyttMVZM?=
 =?utf-8?B?bW1SMEZlNU1YOTZNdE9mLzZzUWNPNXFhWXczYUltUEdEK1dNeDhyd3piK2dj?=
 =?utf-8?B?cUhLcmF5MWRCOWhBTklSbEdQOFNnQmFkRWtMS1V0WmM5KzBZUURjTXFGa2U5?=
 =?utf-8?B?WGhER3VzcStsSzViNVUvS0dhTnVIWW81ellVS1BnY2ZNR2s1QmpsYUlTaVBO?=
 =?utf-8?B?cEVHRkJBT0Y3aE5GQzh6Y2tTdk5jVytOWjV5blBpbk9jU09mYVB4N2I3Yzgy?=
 =?utf-8?B?T0s4blU0Q1ZQWklVNnJ3bzFlVmwreUZ3OXNiL21FUDZYTTh0OVl2U2lxNEF4?=
 =?utf-8?B?ZU05UHBRbVpvS1ZFckdPeGZqQ0l1WmhzZDVObHBsRC9TVFhsNHRHL1ZzaWFj?=
 =?utf-8?B?d1h1ZTZGc05adTMrOXhTR29wdnRDUU1zbjIxZlQ0TmdocE9nNGEvL3hRM3Ft?=
 =?utf-8?B?TjUrb2xoNjhwL0ZSc3NBcVIydFpFcWFnYkRJYzlJVXc1YjJ3UkRnR2k5VTJp?=
 =?utf-8?B?dGFPd2Iwa29VRmpPaVU3UXIwcEVVaC9VbENEeDBDSXoxWk43R3RBQk5oT0l5?=
 =?utf-8?B?WmdCMDEwQWdYVk9rSjV5RmtpOXRmUDNqckUwV2N3dWJOd0dsVncrd01HMElq?=
 =?utf-8?B?dkxCemU5RkU4b0p5UUtNUEgzTDlBd3JpQ0xVdDY2WElrd0MxSlRLNHI5eXJI?=
 =?utf-8?B?TVJaWFJzbmZBd1NYbEtaeEdQdE1QcW5lakZweUlHRVZZdWZ1VzJuMjJReStY?=
 =?utf-8?B?NU14S0prQ252dzYvbUt1eUlYSmRYdW4venBsOXhWU2M4Q0FJVEhYY3c5K1dh?=
 =?utf-8?B?NXN2azBDUXI5aERjTmhUTmphYUFWVUFqSU11amlwZ1NOejlZRWkrT0hPRnRK?=
 =?utf-8?B?L3VoZ2JTbUNuWDNhbm5wU1p4c0toby9YbkNNTVlSdlFmNXRrM2FhakU3RUdr?=
 =?utf-8?B?bDZieWhDU1JOa3EyVXF4aEJNNVVFV0c1REdRc2c3NlhHY0F2OTFGRU5qbmxC?=
 =?utf-8?B?U2N1R3FzeU5ZMG9IM05QekJ0OHpDTVBSbEpwNUs1OWRuekpkcTQ2aWllQlVW?=
 =?utf-8?B?K0hDVHZMTTJKM0pqeGZad0FGRU5ybllQK0o3bUI3R3dEU1dVZm5DQ3FiYzhq?=
 =?utf-8?B?L0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUhOZ1hic08rWFZLT0JzejNkSVBTVnFSYXh0cGpSMGJWSHBRaHFEaGJtaEpU?=
 =?utf-8?B?V1E5Vlpvdnp3L2lmVmFDUjFQWXJBc0czZ3BMdWV0WWZzME9yWFl6RGdEZGxa?=
 =?utf-8?B?YlNnQ0Y3ZE9PR1lvTmxYUXNxeks3OHRQdGVkSFAzUXh2MFpuMTJidHkxVXZl?=
 =?utf-8?B?SG5NRHpRdFRXZzlPdkJqZzl1UExGNi9lbUZFcFY2YXVhWFFKQWtYMzg1T29x?=
 =?utf-8?B?ZkNsSmswRlI4dXI3Tk4xUnpja1ZBaFRUM2VmcGQ2SzBWODVKdktNMUpscGNa?=
 =?utf-8?B?RnZKZ09WR2NSS3g1Y2t1anBFVlNJNThRQVZ4YnlRa1hhck9BWmRJdWJPK0pi?=
 =?utf-8?B?R2U0ek9pMHJvU3d1UDdMRXBvNFhMVE1UZVNYVXlFUWo5a0lrRUJXbm9pbjNa?=
 =?utf-8?B?dCtGd2J5bUxzZmcweGlEQ3V1dGJ0ZVNTWXVBOFN5MzFaWXY5U3ErR25kSEdV?=
 =?utf-8?B?bTQ3YzNlM3cvdGJONEFJUmlWRDZscmJFQnhMS2xkcjJHamk5QWxWL2ZVV3Rh?=
 =?utf-8?B?NW8wQUNoOWVUdGpxU3AwSmVWdk1mR1dHaXJDYUNFUlJ3bW9jU3VYSDBWc0Iy?=
 =?utf-8?B?KzRudWJUUjJpZExpSHoxVzI2bjVOUU5Qc1dGeG5DWXlOV2xuWVBNYkFOTkdJ?=
 =?utf-8?B?dy8xZzBRK2lUeWVUZzRJaXZqaUUzVmRGNXNPOGlLMHh2NHRiMC9ncE5OS2h1?=
 =?utf-8?B?QzBmU2FMRFFzeEw1SXZhcU5ib1NIMUFLc3JpdnhtVEIrL0pma1JHbUhZUk1Y?=
 =?utf-8?B?U1o4STY3S3p0Wmc0TDNBWnhjRndCRlhjcURFU0FYOEE0L2g3cm5wangyaXg0?=
 =?utf-8?B?YVVSMllrMEFYS21KN2VHaVZzd2lqQ3NuSXR2RGo2dGs2VjByRWhQeFFMSzhm?=
 =?utf-8?B?WVpjcTVxekhWNThGcndISlB4NHpTZFd5YzBMTHp1OFZvUVhYc1JpV05rOVU0?=
 =?utf-8?B?K0JNUFZQaFA1eTFXYWJRT0I3RjNMdDUvMnhYdVpuTGVxSFBTOGFCYkNucEhi?=
 =?utf-8?B?MS9pSGlvMFgvNEFHakp1MVh4NVczV3JsQ3Y4My9OTWMxQ2ZTWmxIdldsZUZp?=
 =?utf-8?B?YWp4WFBJRjVuTGxOcXJpWUtwV3RaZW9PbHZqZyt0RmZTTUdFNEhsK0FCUFlh?=
 =?utf-8?B?T0gyWE8vUDFhdnRCRWFEUjNDN3J2TGJRTHQvNUpCYm96YWZFZ2xEVDhtUk9s?=
 =?utf-8?B?Mk9waHZYOHRwVlk0cm5Vdy9VNXFhL0lKSlNxZWRKWkR2LzNYUlkxc2czV0Ru?=
 =?utf-8?B?YjZnZHd3MWVvTXNyYmNVU2MxNUprZ0x3WmsvY3hFY2d6MVRFK2VPdmZ4eDAw?=
 =?utf-8?B?bnA2dUNsUzVHVTRLV1Z3SWFiS0VVSlJKL3FDdmNsVVBEOFc2a20rQkJBZ0VO?=
 =?utf-8?B?Z2lrRWxGY005VGZCaGZJdCt5UmxBeUNmYkoxSmQvK0w4MHpyYy9sdWwwZC9M?=
 =?utf-8?B?aEJWUVFacml2OFptVmFWcnpEQi9iQ0hlKzk5L3FMR1ZlWFJmdjJNNm54cUxY?=
 =?utf-8?B?ZmVkZjFOUXlCbDc3VmVKOWZPeHlsanVRUjhtbFlzTDc5Rm00aTY2bi9XakRE?=
 =?utf-8?B?TDJzWWtWY3JTMXl5L0dpQ2pUMy9uWjZDaitzRXQwUjFOSEZYd3FnL1pkTUJn?=
 =?utf-8?B?aVpRaVo5Yk1CY3VnYkUxWFZabkhXYnNIVVFyRDU2QUNNTk00YUdDMWlTWUlm?=
 =?utf-8?B?dmUvQW9LNWI2K2cxSVVxMkM0MkYwMGRWNTByeHgzWXYrSmZkSFJGSXVmSnYy?=
 =?utf-8?B?emN0ZzNyemR2ZnhwVThmdGxFTDBGV05mb2RhczJwSi9YZnROeWJJQVVucDVR?=
 =?utf-8?B?eS9Oajhwa1NPWVRlWWRMekZYUFpkNUhQdzRUREF1Tzk1OTVOTjVpcWxaeG5m?=
 =?utf-8?B?V3JzZWZRc3VXbitvcVRGdGtYSHNVOXRMRlU2djVrZlgvUFdVV0VjSExBUGRu?=
 =?utf-8?B?dmoxN0NOaFlISEQvSE1TRHlseHdkTENzQld1RFprVGlEYjFoNTVWa1UwT3Rk?=
 =?utf-8?B?WFJUek9xaXZ3enBwbnVsMVJCQ3o5MmxFaVB3eGJNUExINndiUUNTRzBiWHZH?=
 =?utf-8?B?WVAreVBlNmZOdk9LMmR4NENNeWZNOVgrU2NiU01IaTdEajVlNURtZ3JlVkxR?=
 =?utf-8?B?Nk5tODlUYzJwYUQxOG5wem1tdlZUYXg0RWVIUlFxZnhRM0RxNzEvY0JZQVlQ?=
 =?utf-8?B?L0JIUURDVFUyRkh4eFRkdFl5elFUVlZoWnNvbE4rcy9SRlV3Yi81WFU0dmVL?=
 =?utf-8?B?bGlhTHM2WWpsb0FQKy84aDRORGVlVFpnbXpwSnI3RGxtUVIzWmtuY2xlVWtW?=
 =?utf-8?B?L0YwVmpsM0Vya1FEbTJkUHV1QWVoYkFRZkRVUjFGeHp1YWJ5cFNQV1gvQjZ4?=
 =?utf-8?Q?UjqYjzhrd/i1jg/vP/9t4FHij+CKztjTXvKv3I1crQoQu?=
X-MS-Exchange-AntiSpam-MessageData-1: EggVfsBFO6pCJQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a51f512-96a9-4fab-2a99-08de5e163416
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:39.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfDwkHXCLbwDa98g02xW0UaeY8q6qoO7K8XQlI9Xds6UjiaP6X3YoTO+2WGtQrD4PxDb0/sB9hoEXiwCxcEA9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

This feature is stable since 1.89, and used in subsequent patches.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
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
index 5037f4715d74..4637aa11e870 100644
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
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.52.0

