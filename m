Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA0D1E98EF;
	Wed, 28 Jan 2026 01:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769563750; cv=fail; b=FTgE7JuypGqQfNby1Q23P4Y7tALa0YvwZ3/TLjTCK1LAid5zsFGmkWLsQ7fr2GMCA4vz6J55hO7np5f5hcUJfMO9f5XFWyCmdxB75WaWGT/oU43zz/gqLSxnyoxLb7c/PwnXB+/lM0vKy/lxepzkuHi/FkrOmgPnlCZU5Zostk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769563750; c=relaxed/simple;
	bh=TFa6A+SfS61IJWPNWzA9u11Bb18CBsAA8N1QvTY7uyM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Wb+/Ns7Y9XR/tBP+Ul0bxDtNf4L/m/WQhFX3QW3M7YPLb/3/YGR9UGbVYE48R1sDcBiHMFdGHwbmU3OGwI4jUX8d9ESXTJkJkJN6WhQ4PXOHtpwWAvgIYwM7aGdEHHzvW+EMyJxHJ24a5X/B2qciBG9MextxKD2gM4fOUyHy1xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ph29KlTv; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ph29KlTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjsGDoUHrpVKB9p+2azhXCyph2m80rpRWDQzWXgovojC6ntePyKU4PdlmvR+0ao/pLgIo7eCmC/GmDrJvXudENdT2GEwYb+3r3TncYHvaficptbpkwWLB/DtZ47OwgvUyAph6x6vnSpRHDFRZDFY3xUJsuHH864G8YS9EVK8MpmEQoHNlr4In5uxJLipZkBiJPyBUzbeSRZM2PaUm82G5eK4g0Fdg54NA3GEiqVSd6cBbv3fGq7ZKDiybiOxqeOPFw0gCikW6/UZoXE+xtVaW4UPpbx+xEubjXENcBJ/qbr3LIpny0p2TSVi+LB4P2xDejrc24RSq+g1GFClpAAIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDoR8qmW3c01zK5spvX1W6VChT18ZKdu7ZSuwhdGLSQ=;
 b=JUS0E49KKmthnBPgsfrWc3R6pncADxp4OFBI/5XwQtBClRKuQ6xQBDcwXk3DUjU0iaJ/a60dBqSJoCxgj443qNWc2wmDCK6P6fS2jHxmFG5NhMPmn97WXwfyNBqMzWMSs+jXHqalTiLMFaI+GRtbT0EAlJCa1fFhwPtWcYhoGtvv1Fwy+o/UgS9wosPg2ivNkiWxs4G/JHHG+xgm+OUIyF9hgAxh8ASnpVYsH0lkeG/qcUIED8HLGb7aWUuThXIpj2wGLnBdoKmTeKkv5ytSP4Knv4JVROazvaFOK3S9t/559hkc6Cp13J8sbXO+EmgJbZoJYzVoNFgeA/a77qEy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDoR8qmW3c01zK5spvX1W6VChT18ZKdu7ZSuwhdGLSQ=;
 b=Ph29KlTvbrlK11drq/k+6nOOIS4IOOXmTLnhEZU3/Lhjg4xTOuleXg2rBEe1WAFlNoyJ29fuNrokH2sXOJCSxSFdVhOmW/LmI7BV0DklhWVT/YNJBjyE1pHLA37NcYKIxojXBIXvMt2CcvCEpPmF8l/tqdOLIZ5tNJJglH+7svxlaqc/fVaw+bgwKaLbsNPzVCC4NnQcfXe592aXWZqaIGhRgDXU/dR3XRWd7jBNbfRV8YZWgSIYjusmsvrElx8SKSBeHl/cZVvRk+dCpXlnhD6PVeIYWPbkVqQK/TUKnVkWS40I4wDQkIRlSpp4BlXxAba9IcmxZtzNqeOklb7s4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 01:29:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 01:28:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 10:28:54 +0900
Message-Id: <DFZTZP38P352.170EYBILZUR92@nvidia.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Yury Norov" <ynorov@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Yury Norov" <yury.norov@gmail.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com> <aXgpKOHAmvZuMVSt@yury>
 <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
 <2c3ddf4f-3085-4447-ab2b-1976ea0a49a2@nvidia.com>
 <DFZOHYP9I47G.14DDKPXUOU4V0@garyguo.net>
In-Reply-To: <DFZOHYP9I47G.14DDKPXUOU4V0@garyguo.net>
X-ClientProxiedBy: OS0P286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ef77df-0fdd-4157-640c-08de5e0c9c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGlXcTZaeGxMb0VpV3BTajNZME12RDY3WVNaS3N3SllzN3VJTzFYbHd4cnF0?=
 =?utf-8?B?RzJnVWVaUGhscWNDNW1iYlRqQTJJc05GOUxkV1BpNkRtdGlWRFVsMDhHWVV2?=
 =?utf-8?B?SWNSN1FJYUFqZ2h3eFFYRnA0czBaR2tteVZUWmlxWDhoU09VbUsvM1lvMWpm?=
 =?utf-8?B?VkNHUDV2MmNDSW9aSE9pZkYyd0MvbVN5aW5ROGZ6ancrelFEQ3hBQnRvNVg5?=
 =?utf-8?B?ZE1mUHZyeG5IUm5LR0l5YlFPdGVrbkRFRXNJcnhjbTc5dU1vSEFaQ3R2RHp6?=
 =?utf-8?B?WE9RRWE4Q3A0WnZVTUoxT1RqcmlaZ01NT1JTQnlheVBxeHVDTTNkUDNQRVI0?=
 =?utf-8?B?Y0JYaTJLTVh1UzUrN3RRUmMvOFVBN1VFMkVwaTNnUzlSVjdHY3ZndE1TeE9O?=
 =?utf-8?B?ekFUamhxSzN3VTBnMVhSOUNRODZUSFFrTHJoV2lzTC9DYndGNE5ROHcwVjNC?=
 =?utf-8?B?WXdsVzd3aGN5aGdidDNpKzl1RGlXanVKS29LWS94UlZKRzgyMmx5KzhHZ1Ji?=
 =?utf-8?B?QW9Ycmp3M1ZnQkNzbjN3MzZ6M1pPYm9uczFaVHEyMEVKeU1ad3VGamtBVnFB?=
 =?utf-8?B?T0ZiTE5HaXdyQlNac2I3c3RnM1cxRlVKb0ZVMVQwVUxiRi9zTkkvbllDZm5I?=
 =?utf-8?B?bnVITHFUd0NjenFSL3ltVVEraGZUZTVaNjRpa1VzOFVWbEtEQVB2Y25Pa0Na?=
 =?utf-8?B?MUU5dEkzZXpMdUhjdS91RXJUOHBXa2xPN2IzRFU5QTF5VWxtTncyZVlHaXZj?=
 =?utf-8?B?MnZCd2w1RmhIWEg5Z3JoSExMek95TFoybUZqUkFlbFE5ejVsYVo5QkNMdGFk?=
 =?utf-8?B?djMzOTQ5dW9hOVdubHNBWUFMR0UxWTR6M2R5Q1dkdGZHODlkR1ZWMmZ2VHhB?=
 =?utf-8?B?VFJWMzc5Wk1ZUEVPdGpBbnJGcmRjY0JBa29CaEZTV2c4ak9icFQ3SGExT3Bj?=
 =?utf-8?B?RzRoUmdiU2NCR0xaa2ZxUitVZS9pcUdNSWVmd0JaU1RlL2MxZTRNS2NJaVE3?=
 =?utf-8?B?MmVMTmNFQ3NpZktubDVhR2dhK2dxbXpCTndrdldNOWUwalNaQkdoNFkyRkph?=
 =?utf-8?B?WXI3eVFITUxNUXdLUHVWdlVWb1p0TlZ2a2NIQnFHTWF4cWFxYUlkOEJMd01k?=
 =?utf-8?B?eVhSOXc5WkVTK3NmWjRKY2Y2SkNQdWg2c1Y4MUwzNFhTWXc3dEUvWk1kcWxF?=
 =?utf-8?B?NVBXc1hsc3lsd0hCZjQ4alhTVW5IRnN6bzNYREpaaUUrZnRvK2Fxa3hiSGxO?=
 =?utf-8?B?dSs4UDJnSS9rVHJXeFNBdFk5Zy9tNEJaY2oyR1NtMHBldE9nays3Zmt3RDh1?=
 =?utf-8?B?b2pVeEN1TXd2NDUyWVhBc0NreDlSaW5VSG10TEtTMnozT0Q3UkVXekJzRXFD?=
 =?utf-8?B?SXF4TURwT0lDcnFGRlNkRjVveUF6OXdXZkNtR0s3V0M3VHJuencwTDQ5Zjh0?=
 =?utf-8?B?aitYd1c1VjFnWmNZbjJVTk5CN3VzWW5jMko1MVZadThoV3lvWk44SGZ3YUxm?=
 =?utf-8?B?aSszYU93ajhxeHkwMmluVnJRYzJhOGcvSjNGcHBpczlESXBCWHM3N0xzb3dt?=
 =?utf-8?B?SnBqUnVYc0wvdGlWY1V6K1lVZkk1eFZRT2kyNXpFTDA4bzQ0eHJGRktlekhR?=
 =?utf-8?B?MitlaW56Szhra2UrUnZtWWRmR1BYb3JKSThjZWZCampqWWhyMGpZL1JXRlF2?=
 =?utf-8?B?R0dzWC9kcjdaRExXckI0L1NMTkJGSi80d1lFaTMvUW9TVU5NRmNRUEhWL2k1?=
 =?utf-8?B?eVFJbmFucUs1WGtJMHJzRkw4dTZ6RG9kTzlNdkh6YmY5VjNPdDV5alB6Z1Fm?=
 =?utf-8?B?YUlvRFQ5T1JIWkdVYTlSbW1KbE5JRVNqcXdpQ1k3Y0gzSkluQ1ZQZGorajQ3?=
 =?utf-8?B?Y3o0dVZQQTlNU0szbU1EZG9sS0FwUUtoYzlSK3ovWnBnR3JidEJkVzVIUVUw?=
 =?utf-8?B?eUxxYjF5MUdqN0hpcGRLWEVYNXVSNTErdms4eG1KZnp6Z0xNTjl4SFVHbFhw?=
 =?utf-8?B?akxkOEU4QjdaNkpTVUpEbHJFOUdwM3hqRENINHM2b0w3UjYvTTdsbzJDRFhW?=
 =?utf-8?B?OHNHN0p2VkNwZ3FzcjQ2ZDdqUkFWdDMrOHp5Q29nVmhQWXBjRVJPL3k2NHgr?=
 =?utf-8?Q?UbYk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFgyZkFsWmNwUEx3MXp5V3I3OVlEWUxsd2FVbzJwaXMvUmdtaHNiUEozRWk3?=
 =?utf-8?B?M0tIVk9Gd0kvWkRMRTVFZWRUS3dISlh4WWNDOXJHWExiUzlwSEVPb0hGbzIy?=
 =?utf-8?B?ejc0VWxaRTlKVHRaV1VrTVcxVENDdW53NmU0Qm90NlVIc1JYREVyVGNkTWVs?=
 =?utf-8?B?QlFEMzgxN0QyMFFvaGFPM2UwcUZTcERFV3pZcEhDMDJEdUpzUmIwUU5jSlpN?=
 =?utf-8?B?REc5MGFwbTRPa0U3em9KcnhkWmVsWHd1djNkdG9jSmRCM3dUZnM0amF0Wjho?=
 =?utf-8?B?N25OOXRwcmNORkU1QVpwQVUzd094eTF2MS84T1Z4V2JXb0JWREdENTcxbnRw?=
 =?utf-8?B?ZWQ2ZmxIMHA3bUVGdGowVVZBcHJ4ZkIrdG5TWVl1QWVBWjdvRXdPd1hKUnY2?=
 =?utf-8?B?MEp4ZnMwcUthUGJkV3J0VTdFLzhlY1hkNEJxMDFVNGt3bjI1ZVhDaG0wdk9M?=
 =?utf-8?B?OHJvTjRwbVJ6M2FobUg4OEUzYldwNE5sWjVMaVp1a2ZVYk9oUFFqNWRFa0o5?=
 =?utf-8?B?eHVpb1REY1Z3R2lzWWIzcUQ5SmVRY3NBdHRYZHJ0Yy9GTEhXQ0R4dVNzZ2Vy?=
 =?utf-8?B?TlZ6QjR0cGhZNExxY1pEbjdWVUNDVW9PYlBzRlo5MmNSWFpkMTRweUJZemt2?=
 =?utf-8?B?QXJwUUFGZklDTGtRVm1Ba1RhYTlxWVo3Y0ZZdXNHRmpzemduc1FOWlEyYTc4?=
 =?utf-8?B?Vy9aU1JWVkdMYmN3MEdQWGQxN0pUMVFQdmZsUTBERGo3L3B5cXphNjdUMjI2?=
 =?utf-8?B?TG9vRGFsYVN3QVFtYjcwYjExdUk2RkpsN0s5ajFJam4wV2VabzlUblhtUHAy?=
 =?utf-8?B?cUtUenRPTXVIWWdxRU9kNkl5NDF1Z0toWlJsNWN1Vlg2VXA5c29YZmQrWlRD?=
 =?utf-8?B?dUUxaWdNV2QrUU9lMnJOdEJLYXFzQ2pnY2hKTXNsKzVBb09mVWZIN2puNjNT?=
 =?utf-8?B?WThxWjBHS0FxMC9pOTVjMGNxU1dxN1ZWWkNQR3F1d2lORFJaMFNIQWZubW0v?=
 =?utf-8?B?bW1zdHcvZVFmNkg4cTZCVCtqMHk3V09URytjQkhNZHNBTTRIWGtDVGlDdjZ5?=
 =?utf-8?B?QzRiODY3Mm9ITHhUdGdBc2Rib0JndVliaTlvdktVdWxmUUtaekxCUS9aU1Zz?=
 =?utf-8?B?T1JzR1A3QmhVR3JFY2xOL3dEdEdodzhLYmtCaXFlOGkxaFkrNmJxYjlyTXNX?=
 =?utf-8?B?UXYxdWRIek01V1RVUnlBSXJiQ2tCamJaTmRtSklIdGJkVm9Ta3V3TWhWQ3NV?=
 =?utf-8?B?VytRS0xIUTFvVXFzWFU3TVFOdkRaMHdHeTd3bG5vdExlT2YyQXQ4c29VNmRF?=
 =?utf-8?B?WTlxTGZyNU1ua3NmV3h4a011YzZiaEY2NUZpbHF6dk0zTDRCRnNqYmVQbFNp?=
 =?utf-8?B?OXZ1UkJ1ZXVnVkZtNFpPK3NaNGVzQ0ZwNk5pZHlZMzFianpSZTZtRVFtdFpX?=
 =?utf-8?B?aFZxMGE5WGZoZit6QmRnbyttM3U4UGNpeFNLcXVEQVQ2S1hjaldkOFZ0cnlQ?=
 =?utf-8?B?Y1FXREhLWElGaFYyb1htWURrVVBOVURmUXkyenZnT2o3RHVOTzl1YlVjRVV4?=
 =?utf-8?B?eUxyUjFLVnBFT3k1NXg1c2hSWDBoSlQ1U3dXRmU4WGtMcExrTExRR3YyTUZv?=
 =?utf-8?B?bngzdzJwRDdxL2ROT0EvVU9RZFFwTTJTS3phVW9NUkUvWHhyYWVJV0xHbGdR?=
 =?utf-8?B?MWFKZlEzdHEvUVFMNXBFSEl3djB5NDhQQkZpaGthNHhIRzNDZXpkRFlkcWVR?=
 =?utf-8?B?QVZXcHNzczkrbUlnZFJER1FaVDR6Qk1tRFNLOTN4VGV3Qm5BeS9TdnBCUWQ1?=
 =?utf-8?B?aWpqUFRMbXVGRjdFRlcxdzA0Y3J4bC90bFY3a3ZPMzdkOGMwSnlXRWFLYUU2?=
 =?utf-8?B?WU52UHh3UC81RFV1L0N4WlVNSHRCNllNd3FFN2lZbWZ1dzJ4Z0ZsTzdyYUZa?=
 =?utf-8?B?R0hlMjIrUDcwWGt1bCtiMnJjc1hhVWx4cm5lVjl5N0xEeG9xdE8vR3VscElF?=
 =?utf-8?B?V2NXTXVuVytFMWpaUGpYZlhwREJwb25DSmFaRHV6S1pWcTFVZXQzaEYzTUVN?=
 =?utf-8?B?NmJCRFBkeUVaSWtMKzllZGdjTFV6SzRDdUMrV250bTBrcTJMZDRBZkpGZTlJ?=
 =?utf-8?B?a3IvU0RxZ2hhS1FRa2h4OWFRQnFDdUFzMXh6N3hQZWZ5emxPbnVuVnh4NExD?=
 =?utf-8?B?UkVralQycUNubUt1REhZRXIxcnlVbTQwWG5OQ2ZtT0xvbmtnSnB6L2ZVUEJF?=
 =?utf-8?B?Si9ScytzR0hkc2lKR3VRbEZyK1NabTk0Y1lqQkZScUJ5UFdtdVFady9MVFlG?=
 =?utf-8?B?TWY4S0t0Y1AydDlST2FiWFB4a0JMd2JkUGt6TW1MSFM1anhRTWg4dGJ6UTlV?=
 =?utf-8?Q?lQoWSjD4HH8zuEyZvslzs9l/uKZXNtS7aLUXVK9mmYZvc?=
X-MS-Exchange-AntiSpam-MessageData-1: oOvGOCD7MQiB9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ef77df-0fdd-4157-640c-08de5e0c9c04
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 01:28:58.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGjSF4Je0s/8j2qgqdhYWpb/X+BDWv3LHrpDQWDROxxSTJkcbXRLwA7tN494TNLhllXCWSshdf1Cw20iLHxT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816

On Wed Jan 28, 2026 at 6:10 AM JST, Gary Guo wrote:
> On Tue Jan 27, 2026 at 9:03 PM GMT, John Hubbard wrote:
>> On 1/27/26 1:57 AM, Alexandre Courbot wrote:
>>> On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
>>> <snip>
>>>=20
>>> So while we cannot achieve exactly the short syntax above (which has it=
s
>>> drawbacks as well, such as the inability to operate in const context),
>>> we can introduce a new setter than works with a const argument and
>>> spares us the need to invoke `Bounded::new` ourselves:
>>>=20
>>>      let color =3D Rgb::default().
>>>              .with_red::<0x10>()
>>>              .with_green::<0x1f>()
>>>              .with_blue::<0x18>()
>>
>> Are we sure that .with_red is a better name than, say, .set_red()?
>>
>> "with" is not so easy to remember, because it is a bit
>> surprising and different, for setting a value.
>>
>> "with" feels like a function call or closure: "sort with
>> qsort", for example. But here we are setting a color
>> component.
>
> `set_foo` implies that the value is mutated in place (and takes `&mut sel=
f`).
> `with_foo` implies that value is returned with the specific thing changed=
. For
> example, `pointer::with_addr`, `Path::with_extension`.
>
> Given the signature in the API I would agree with Yury that `with_` is be=
tter.

Indeed, given the signature of the method `with_` is definitely more
idiomatic. But that is also true for the non-const setter, and they
unfortunately cannot share the same name.

Alternative names I can think of for the non-const / const setters:

- `with_foo`/`with_foo_const`, but that's a bit verbose,
- `with_foo`/`const_foo`, but that's not idiomatic either,
- `with_foo_val`/`with_foo`, but that increases the risk of name
  clashes.

... so unless there are better proposals I guess the
`set_foo`/`with_foo` is at least practical, if a bit unconventional.
