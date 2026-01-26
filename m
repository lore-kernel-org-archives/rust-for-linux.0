Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93C339B30;
	Mon, 26 Jan 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434164; cv=fail; b=DamNBR8jbzHmxsij/G60vpHDwJJ1PGb+3qrSW58efyVIwcLqo+tsuaZri1Dpa7HEoXdiJnEP+1oVNtcRUbyJ7ng9A0VqoUU8wXOVBFjoJaStz6YbZq2+kpej/BS1fs0PX9K4d6z6PzUdlbBL9386Ahxzw4Vvc8xT01xs93+bXpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434164; c=relaxed/simple;
	bh=LpJOqQQv80rpbScdYBAXQbdPnefJG7cxJf/W5fqnWX8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sXa9r4CKRrsMyUHLCuRCuhrYS2rANSnOxEHgO29KKSPzp6oQqIGgQMQusRRxBvCOaF+jko6SKQ/Ou4t3aR8M0OVGXAdRu0RyOQamqMuy6mzO7vGvkmKWs7imZsW5M6KGREVlELar6OmEpWRXDMI2oF4nU52KGcBLwzLbAVgdnm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rXpUA/mb; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rXpUA/mb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMxhBFqUG3bnUDLBIgKDbJfnvBcZRcd4PZgyIevGTJeeb/DbZNR5KpYmB/4tAA8r/hhJ7OXhlquL70rDxfkYXkYHo0q2fr+MZHMQk4+8VL15bkCsluj7jDqRqiB2WYv6pLiE18kTLuDdxmgti2/VXnpbiw/yVN8gSDqh7sP+Y6K31N/F7/xROWIIhv7eSAIK7ujOiBDgbQ0gBu1Ie2/4wql6p89D9NqwEH/nPcCCkEcBrBE6iBAA90/hixMSMS3OxZJDfV6HJBAQ4TfZoxs8TWfnKV+o/rn2b1TWxRNG5mjW4S2RVu50jpKkGIdLSeAH28JyQ0+9HMTtsyoRFGQfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXYJUYs/2ceh+S/G1BVv7h6Qwx4QbVKGZvxc1F1Euh4=;
 b=Ud/jr3Z1GicUu/m1uw0I9mV5giYEyiC/ZmeU9uBzwUDhpzto9iHkkEJF48GnruFkfIkPWQBqixhjqUDIT7w+/XJwXTZhNHxDgXKreUd4jpaLyGsFc7fa9uPRtklqh1dmzOfyI0zdzTJ0kAYf5ohEHcr3xpwiCPAqaTvUavAWt7y25F1VaxZs+panH8m+5yNGr8RQGKp32z5TijexV2nTaYGhiNloX6CmseN5DZI43RSgkyFc+H46fhcgdfKQs+zAmUezqrGS1w0dmM5LjsoB3OAbWpey6xEF4QVPADU75vLurINpUdLPCa2v9i7hgKXAesRBRR+mD/krqRc8qp4Udg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXYJUYs/2ceh+S/G1BVv7h6Qwx4QbVKGZvxc1F1Euh4=;
 b=rXpUA/mbumnP/rR2dM+LVLeHi80k0jTn8CoAS0phEbOwuVDJcqmGa9VypCrAn15ynyVYq9ZK9PhTokvEyPnb5Wo5DO3lXk/fOQ6jlZaacNEyykkEs5RjhmoHnEVmwhICFLd9rR1iECtj/4dalyOpzmdyU3pxSjRcdrKJ95N5HFNZIwZjEZ2lhoqjBfqeHmrLu1K+6CFJsIbAAmlu9xfJpSvVutlVWDDBJaxFqhYwQQ/qHj4L3d0L+UUIACK24NBs/v9u+0viPgCS2bwtZPbirG/MLmer4OdGhfzlczDeJ1OVEctaMYovtRZrDAO3Qj3ulFViI1xQUvzy4ddlIoBVvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:29:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:29:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 26 Jan 2026 22:28:43 +0900
Subject: [PATCH v3 4/6] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-register-v3-4-2328a59d7312@nvidia.com>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 263763b8-b76e-4533-fd57-08de5cdee3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFYYkZ2eFpVOTVETTFOY0FnQXNrVTI0Tk5WOW5oWVUvZmRTZ09yV29BSWdB?=
 =?utf-8?B?RXhMMVZKNkp2cVpoS3Uxc0k3OUFyY2hQWWprQzNOeE0zTXJYUVlzVFpOQTJl?=
 =?utf-8?B?NVo3WVQ1S0ZHYWFvNlIvZmZ5b3lGRmpMeG1EWStKbzBvTi9nZ051V1F5MzZS?=
 =?utf-8?B?bE4xRTU2SXZwTWhPVWFmT21rUy9nYVZHbzU4bHRDT2xDSm9zVGwrUEcyYnhH?=
 =?utf-8?B?Y0tvQ2RscFdpVm8xNWZ2K1N4eGplSGZ4THBqNXAzbkZVYjY3aDRFU2tSd2VK?=
 =?utf-8?B?V0dWalJCV2szK1FRWGtQYTg1Um5TV0dlU08xK09oVEtkRUVPVVZ0cWxxVXg5?=
 =?utf-8?B?M1J2dUNrSUtzc0Z6WkhDaHMwa3NMU1dPcytQdzE3ZTlkN3VIdExGTGFHczI5?=
 =?utf-8?B?c3NNQ0ZaN0tZV0dHS1FsK1Vuc2RaT2cvOVdmS0praVppN0pQQ3N3YTRxV1JS?=
 =?utf-8?B?MUdDRFE4TTVmck5KL2MwQWZ4NDJJTE5nWTFDNWV6SnF4U1BqQ1JMMC9qZ3BL?=
 =?utf-8?B?VjJybjBhZlFXakMzdS95d2NTZ2VCVTN4TmFvQWYxdlZmeHlZMmpWc1dNWm1q?=
 =?utf-8?B?NU1IaXcvOUM3SzRudDE1dXBWSjJhWVNaeTFJMi9mbTVTNXVSR2RqUEp0bG90?=
 =?utf-8?B?eG15SFpoN0xTb3pPald3YnFOdm91UzAwdHEzN2dJRkpyaEJBNzFNemJQbU9L?=
 =?utf-8?B?aFJhTWgza1FKbFVsU296eXdLVDN1WjFPdTdFc2l6YnlzQkcweFZKVjhLU29P?=
 =?utf-8?B?TXpwQmlEd2EzUUdKWE9JdldRUUd3ZkZuWHA1d0tqMmxUWFZaK0lEWTN4VXdy?=
 =?utf-8?B?cm52OThSZzROZHhmbHhVclBlVFV1Y2tKSktsY0FnUlFidE8wNXphVnZEcFU5?=
 =?utf-8?B?RmtDQnlMT2lrdTRXWEI2RUw1RW9NS0VXcHhGaEJqTlVkT21ERnFQdjFSaUFP?=
 =?utf-8?B?WGw4Mm5BSEZhcUlLdWVlVHF6VXlTQ0pCdG4wenBueDlLZ29oZFFUTkJUdk9E?=
 =?utf-8?B?Wk5FRmNycTQyM2JIekJhcG44aFdwMXI5Y0JSOGRwZ0RyWmp1bE9qOGpoNFM5?=
 =?utf-8?B?ak9ZZ2dsbmNNYkNDMFZhK3MrWDNROUlIT240eGQyOEwvTlVoU0hPdkJGQWJL?=
 =?utf-8?B?bE5nS1pvYm82SzY2NzlEVUxpSWcrWHBrTkE2MHZ6REVnWkIwejFacEN6bG1E?=
 =?utf-8?B?dmE1ZFliWG5MMVhZenNhWmNiVTV5ZEVzWGhZV3plZEdtR2xjZzQ4K21QR2Uw?=
 =?utf-8?B?NmFYUEttQ2szSjVGQjNtU00wSTJCa1pVZE9PVkZCazJSQ3Q2YnVTY0xFV2hm?=
 =?utf-8?B?cTVKZEJLbCtheWZETlhyNHB1K0tRbGhBVEt1YTVMMWVlVW1WeXk2VUxlSzBv?=
 =?utf-8?B?MUxzY1VIVkpZVnRtRE5sL0ZMZ1JzNHpXUjlYQkhHZGZ4dlRLVkNTKzhLUkp6?=
 =?utf-8?B?Njh1S2RuRHU0MVpQd2s4Tk9SblJibE9mRDRNdU9NakJaUVNwTW5CVEdBTHVj?=
 =?utf-8?B?NmRLOHJFUmZIVmRGRkdvWUxjQmtCbjVSdmgwV1JuWDl4WUlRdGR5SzN4Tm8x?=
 =?utf-8?B?UHpHaFVWR0tTbHgwb0paWTVGZjVNYUhQenpTa0VWRm5SWVZFenA2cUN5bG1I?=
 =?utf-8?B?dFp2Y0lvU01BOXNWRDFha2dTQzBpRmtwZ2ZXMVczcUJ2RG5MckZsMVIycndm?=
 =?utf-8?B?Sk1HQnFCYUtybFEwSk9sUEhGMDFKYlNPajlqQmNCT1hJUXdUaWM0ZURDTjlG?=
 =?utf-8?B?czg2RFVjVUo1d2dqN3kxVnFQcXpqRGkwdktWMmkzbzdxWC83amlpakdrYVFR?=
 =?utf-8?B?K0V5TWVBd2hzOGxxYStteXhTeWlvWC9LMStLUnJQR1JJRzdxdkZxYiszckFB?=
 =?utf-8?B?WXl1MnlTUVBPUHpnTFdoOEs5SjJ5VHM5cHVWR3VRa3o2by93bzNCUHROT3ZV?=
 =?utf-8?B?ZUQ4MGthbkI0SUlETkpWVXNzTklWRjlybktEell6RTVhUUxZRGJUalhJZ3lL?=
 =?utf-8?B?K3JxR0pWMkhKK2ZKWjJ5bVBSN2NnSWgwUUtpcUtreE91THUzNWw2cHQ0RWE3?=
 =?utf-8?B?djR6VW5CSkpIVE9kYWM3UkJQV056UWJvM0NwbTVpUkN0ajM0VkFHYVhpb1Ro?=
 =?utf-8?B?elVQMmUyZ1RDanBaRUFhdUNTNjhNNWhkY0pSVnUwc21kMTlPZy94aHVORlM4?=
 =?utf-8?B?MEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEwweUVSNEZaNllaM28rVXU1WUs1dkpIVzUyWnpXdUVQUDdTZlBqTVIxbnps?=
 =?utf-8?B?QjlnS2RDRWdDc3ZVZ2hmbXRTNUllOHpKSkJBOWpDOU0za0xvOWhaSDRYei9D?=
 =?utf-8?B?azgvcHhSc2RjL1BrdWcyaXVWaDlCMlliaWh3SGZLdzJraDRSUnRLSWE5emFo?=
 =?utf-8?B?QllVWXBIems5RHdlNWVkaEZKVHBRaVozaHBneUV2K3czZXRpYldwZHpkeWc4?=
 =?utf-8?B?cldxT3E2eXVQZDJuZDV3VHBGeEE4cnVrV1NzeVRSQTMyNTlYekUzNFdZRXhJ?=
 =?utf-8?B?REZnd2xXNDY0K1hJTVAxVi9zc0lLUVBuS2J6azBGSWwyTEIwNWZtQ2RPTE5l?=
 =?utf-8?B?eW5pRnBNNkcwT3NsUGxWbDhLV1Z3Z3BaZ05BZHB6YzFtektmbjd2UldWcXRO?=
 =?utf-8?B?YmlCaUFZVnlZYkVxVno5U05CcVpYN25YTVI3aGoyNFlZWEhhR3V0R1duSmxO?=
 =?utf-8?B?R3hXVUp5amxZSTNYQzhRWVRhcE0rSFhRbTVCUlFwdUs4bnJkeVZRRDdvR3U3?=
 =?utf-8?B?S1pwWStlWm9sUXl2aERicFFEMEdrWE1lVkdZRHovYWRyV1UwVi9qTnVFTlll?=
 =?utf-8?B?ZHhscXJuN0djend2bWxCcW42L1JJWWUvRUw5WkFiTWlrUmx5Mk9QN2xIOENl?=
 =?utf-8?B?VUliUW9EeXlxRDRsbk5RRUtBVitzYTZrN0NLZzRXN0tqUTV1TUFyaUs2T3Ix?=
 =?utf-8?B?dnh1aERCRmMyRVNNM3pLT0dRVXl6aXFqNkFiMSs5WkUveXMvQTZJc3pYV3dQ?=
 =?utf-8?B?M0RjWk0zTTE4YlhUWlVKbVFSeTRYQjYvL255WXJhRURRWDdqeUd3QlcrR1lx?=
 =?utf-8?B?MFhWTzhuZFZlK0c4b1NMK1hpRWRrOUxNUC9BMHRrY21vQ2xyajVLMlpZVlR0?=
 =?utf-8?B?NGNYdWg2L0MxenVUQVVLWEVyMFJ3RU16cHpOd2xXWjRYbTFNdEZTUThZZGxJ?=
 =?utf-8?B?M0NDcmJYdzd3VkpKbXZaWTdkZ1MzZkxxM05iSXNjMnBqS3VnT243RG9oeFdt?=
 =?utf-8?B?WGJkWm00ZnUyd1hLelBRazVxeTB6Qi8zZ3Y4d0wyMG54Ym11NE1kaXFwUzFQ?=
 =?utf-8?B?TnQzMHh6YXRncGdMRmgrOEpSS3NDR3dFQ2tYSjJpUURHY1BSbHd5T25OSkZp?=
 =?utf-8?B?YmQ0RnpkS0NITHZHQXNDaldWVFlBRkdpRVNDYVVIZE5PdDJDVWRpcjRjSUw0?=
 =?utf-8?B?R3lUK1VTaXUyTlNLNzBmU296SmxtdjZFSlpkK0hKd2t2a1RQZlh3QnVSSXU0?=
 =?utf-8?B?TVVHSmQ0VU8wK3Q2V25HRXdIU09qKzBVK2UxV0xZY2RITERCeDBKV1RPTnZ3?=
 =?utf-8?B?eGU0M3lYblh5RGlndnkxc2VpMEZQdFBlV25jM0J5Zm42aERqajlEMHduNFI1?=
 =?utf-8?B?aGJVR0J2YnphOEdnclVXdFVrOGgvUlR6SGd1Z2xuOGdlRytwaVdsbFB0RStx?=
 =?utf-8?B?NzV3K1dNUkdRYi9vQ3EyNjIxOTNYSXMwSklIMHJ5ZWRuTUpKVG8raE5oUHA4?=
 =?utf-8?B?TWNtR1Y3TURMdnhtRExyY1FJWE1sZk1KWklIOW9LQitWZXo5NDJZcWxWMG5D?=
 =?utf-8?B?aEJuTU83VG91MEJlY3lCaWUvbXQrRXU5aUgvbk1OUTFwWnBEc3Jtem9FL2hB?=
 =?utf-8?B?WXozd0hYNjJ5SHRwWDJpK0hKcExTMTNRclN0QWxPenVtRHlhZ0hBQnRDNmxC?=
 =?utf-8?B?KzVpVDRuWkcyYUxuR0FiWFpUWmVyWHVkazRMcERVZEFwYW1BS2hpV1JEMi9R?=
 =?utf-8?B?RXdvQWliUERsQlowdm9MS1hGMWFTQ0FvK2tpejdicU41NzRwYWdFWnFTbXFs?=
 =?utf-8?B?bjNjVmVVY0FTS21OQzgyTHd5d0tPYWhUR3RYdE1wR0hTNDcvMjU4bUliaXpU?=
 =?utf-8?B?S2FSQ0I1NDN6WnZQK2JzQ2pqcStSRU5RY3RSdDlKWTh4ZUNHdkE1WThnV3Vl?=
 =?utf-8?B?dUtUclFuMm1EUU5WSnRaSkI4RmZjVHpkdUp2TDhtdTdCRnRpdWFtZE5udHhy?=
 =?utf-8?B?eWpRSzJRV2M2WWRRQnAwUTVMVm8raks5bHRudG5IQ2YxU2JTLzF5N085MGpU?=
 =?utf-8?B?bjI3K2ViVUwwdVowdXdWZjd4eVpDN2Vlb0R6b0xXeEhJdlB1M25zWnJ0ZUVi?=
 =?utf-8?B?eDZITFJhVGFUZDZRZHI0aC9rbHg5VHhUa2V5eXdqRHNTcFV6Nzdla1AyQnAz?=
 =?utf-8?B?L0FrTGJSb3RRN1JhZTYzaDl1bCsrWEhkUnF6aTlCWXAzNFUyeTk5c01kWURz?=
 =?utf-8?B?L3dEU0ZkemkwZU1nR1p2WUoxeXlhT3ZxSWRtMHYrVUZaRWlINHdVMFZQOGh2?=
 =?utf-8?B?aWJhVVM2eURGZkhkUVBvYy80OTBQTytMYXVRSm5JcHBxN1VPcGoxY3hacWJM?=
 =?utf-8?Q?iBfhKF+IPIHD00tusL/ouSEeV3O8PGmqN9cmg9ew9fRrh?=
X-MS-Exchange-AntiSpam-MessageData-1: HIUCBkwPP/MkXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263763b8-b76e-4533-fd57-08de5cdee3f6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:29:11.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHDN51sYHLmO9g6cAuoFjWb3J/p9fjeRrDL85T/weWIkZS7njUo/V88XzkzFb2kpk+aLI245eDEWim9+g6TwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    1 +
 rust/kernel/io/register.rs | 1234 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1235 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fcd1b156a14a..26d091df4991 100644
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
index 000000000000..3745763aa034
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1234 @@
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
+//! return an error if a field's value is invalid.
+//!
+//! [`register!`]: kernel::register!
+
+use core::ops::Deref;
+
+use crate::io::{
+    IoCapable,
+    IoKnownSize, //
+};
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
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>;
+
+    /// Write a value to the given offset in the I/O region.
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>;
+}
+
+impl RegisterIo for u8 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read8(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write8(self, offset)
+    }
+}
+
+impl RegisterIo for u16 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read16(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write16(self, offset)
+    }
+}
+
+impl RegisterIo for u32 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read32(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write32(self, offset)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl RegisterIo for u64 {
+    #[inline(always)]
+    fn read<T, I>(io: &T, offset: usize) -> Self
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.read64(offset)
+    }
+
+    #[inline(always)]
+    fn write<T, I>(self, io: &T, offset: usize)
+    where
+        T: Deref<Target = I>,
+        I: IoKnownSize + IoCapable<Self>,
+    {
+        io.write64(self, offset)
+    }
+}
+
+/// Defines a dedicated type for a register, including getter and setter methods for its fields and
+/// methods to read and write it from an [`Io`] region.
+///
+/// Example:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Basic revision information about the chip.
+///     pub BOOT_0(u32) @ 0x00000100 {
+///         /// Major revision of the chip.
+///         7:4 major_revision;
+///         /// Minor revision of the chip.
+///         3:0 minor_revision;
+///     }
+/// }
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
+/// # register! {
+/// #     pub BOOT_0(u32) @ 0x00000100 {
+/// #         7:4 major_revision;
+/// #         3:0 minor_revision;
+/// #     }
+/// # }
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T) {
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
+/// attribute is automatically added since register names typically use SCREAMING_CASE.
+///
+/// Note that multiple registers can be defined in a single `register!` invocation. This can be
+/// useful to group related registers together.
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub BOOT_0(u8) @ 0x00000100 {
+///         7:4 major_revision;
+///         3:0 minor_revision;
+///     }
+///
+///     pub BOOT_1(u8) @ 0x00000101 {
+///         7:5 num_threads;
+///         4:0 num_cores;
+///     }
+/// };
+/// ```
+///
+/// It is possible to create an alias of an existing register with new field definitions by using
+/// the `=> ALIAS` syntax. This is useful for cases where a register's interpretation depends on
+/// the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Scratch register.
+///     pub SCRATCH(u32) @ 0x00000200 {
+///         /// Raw value.
+///         31:0 value;
+///     }
+///
+///     /// Boot status of the firmware.
+///     pub SCRATCH_BOOT_STATUS(u32) => SCRATCH {
+///         /// Whether the firmware has completed booting.
+///         0:0 completed;
+///     }
+/// }
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
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register! {
+///     /// CPU core control.
+///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
+///         /// Start the CPU core.
+///         0:0 start;
+///     }
+/// }
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
+/// register! {
+///     /// Alias to CPU core control.
+///     pub CPU_CTL_ALIAS(u32) => CpuCtlBase + CPU_CTL {
+///         /// Start the aliased CPU core.
+///         1:1 alias_start;
+///     }
+/// }
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
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register! {
+///     /// Scratch registers.
+///     pub SCRATCH(u32)[64] @ 0x00000080 {
+///         31:0 value;
+///     }
+/// }
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
+/// register! {
+///     /// Firmware exit status code.
+///     pub FIRMWARE_STATUS(u32) => SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let status = FIRMWARE_STATUS::read(&bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ 0x000000c0 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ 0x000000c4 {
+///         31:0 value;
+///     }
+/// }
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
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: &T)
+/// #     -> Result<(), Error>{
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
+/// register! {
+///     /// Per-CPU scratch registers.
+///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
+///         31:0 value;
+///     }
+/// }
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
+/// register! {
+///     /// Per-CPU firmware exit status code.
+///     pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase + CPU_SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ CpuCtlBase + 0x00000d00 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ CpuCtlBase + 0x00000d04 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+/// [`Io`]: kernel::io::Io
+#[macro_export]
+macro_rules! register {
+    // Entry point for the macro, allowing multiple registers to be defined in one call.
+    // It matches all possible register declaration patterns to dispatch them to corresponding
+    // `@reg` rule that defines a single register.
+    (
+        $(
+            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+                $([ $size:expr $(; $stride:expr)? ])? $(@ $offset:literal)?
+                $(@ $base:ident + $base_offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            { $($fields:tt)* }
+        )*
+    ) => {
+        $(
+        ::kernel::register!(
+            @reg $(#[$attr])* $vis $name ($storage) $([$size $(; $stride)?])?
+                $(@ $offset)?
+                $(@ $base + $base_offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            { $($fields)* }
+        );
+        )*
+    };
+
+    // All the rules below are private helpers.
+
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET);
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base + $offset );
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ident + $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base + $alias::OFFSET );
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr ; $stride:expr ] @ $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_array $name($storage) [ $size ; $stride ] @ $offset);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ] @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::size_of::<$storage>() ]
+                @ $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET + $idx * $alias::STRIDE);
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ; $stride:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative_array $name($storage) [ $size ; $stride ] @ $base + $offset
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::size_of::<$storage>() ]
+                @ $base + $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative $name($storage) @ $base + $alias::OFFSET + $idx * $alias::STRIDE
+        );
+    };
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use SCREAMING_CASE.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
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
+            pub fn read<T, I>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+            {
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, $offset))
+            }
+
+            /// Write the value contained in `self` to the register address in `io`.
+            #[inline(always)]
+            pub fn write<T, I>(self, io: &T) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn update<T, I, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Generates the IO accessors for a relative offset register.
+    (@io_relative $name:ident ($storage:ty) @ $base:ident + $offset:expr ) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
+            #[inline(always)]
+            pub fn read<T, I, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn write<T, I, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+    (@io_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ] @ $offset:literal) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+            pub const SIZE: usize = $size;
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub fn read<T, I>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn write<T, I>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn update<T, I, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_read<T, I>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_write<T, I>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_update<T, I, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+        @io_relative_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ]
+            @ $base:ident + $offset:literal
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
+            pub fn read<T, I, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn write<T, I, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_read<T, I, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_write<T, I, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+            pub fn try_update<T, I, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = I>,
+                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$storage>,
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
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name($storage);
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
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
+    // and `Debug` implementation.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        ::kernel::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        ::kernel::register!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        ::kernel::register!(@debug $name { $($field;)* });
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
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
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
+        $(#[doc = $doc])*
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
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
+        $(#[doc = $doc])*
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
+}

-- 
2.52.0

