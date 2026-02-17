Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC5A1C69D;
	Tue, 17 Feb 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316147; cv=fail; b=QJ0gO7R8+it7ch4Movp0ndR57+vA+y58O4OyuMyHJ04CnxIalLjr0nXv9gylSLhh4Fc8EHs3Opz9gzPenm/qXjkdrWGghzaoXWyFeT5ZZeNRV+hrjaJK3nW+5cL/vlB45MroEY/aE1kvfnPXcPrfNYkeXZD6qqZUB9U9l8q+m7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316147; c=relaxed/simple;
	bh=og/oVP+u6M3b0IkGVBcki7jl43X8ex0nijVlg/XuNSg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Xk7IDHdyg6PlQe4AS5OOLlVWn2O1c9+BQJlTSofVmzonphK6vqH2U4TBkT70VOT6P4Wb/5g1Pr6K5AyagaIvo+hSEacK0kcYZv87kTI+JS0vz3WSqpF5rT3EVoI+jFHWrdnWQqgqh9txUj0gFiOwOY+1yt/tsK/dmWlZXGZYDaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MH1dXdYk; arc=fail smtp.client-ip=52.101.193.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MH1dXdYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9aROMIBkbY/z7i/SYQ9XjENSGGwZlE4hzuXDRlTu3zsUtMEG14+OmpcEmzg0awcJ+2YmpGWPd+1z/XKTm5ZFj3IUXpFWP0+tcAs+yEC2VP/bXgZ7vRI3c6KCW6VV0/0kw0OzkUHZXWGOz7YH8HmXcDMKM4f6JqrHhqwTTkKgV2xpmfVpljyARDhEEorQL2wKoaj8MOlFasxZrJC8NCKzfZysiBcgFy+P0pdRGNcKiHIVT3Rx5LNBw8nRVR1mn/FMb/0yv7Bnp0/DHBgAnrS7GLAV5e1vswClN2hp16TaOj3wuxdrzes7OHLMxruiOXZdloveQWzjyfFA/0DtSONHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRNeT+J5Al9t6K9TXYcYhMww+ZU2jr8Zl/z+6L+BN8I=;
 b=qHBo1rVFQopGhJY56mfaSUoEeWe170NB8/0GMTsPaq0XW3Lv8qM0ZNVpOQc09vtTtevRrUqL3pZbJWr0i/i9UKDuXCwpempUbXGnv5WTbX1d3uNtBxVQ+BMLk1YyQiITFPJlVHwQmSE4lsOUxhUTD0pTUWpVEMZXMmRFVOthGuXMRdUBC5GM6R9EzUPgRfEkerkFUiftsKX66XJsvu42MC6cPO/So7G6eIRa2P2hqt+JTk2Oywaax73ca98r+j4oST+3zOKYhI3C22xftjsssp6Re8YU5gzaPbxaJlNvbtk53NOurzyhQi4pLOy7J0g9AEr4ivWS0+3x9EOhodEw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRNeT+J5Al9t6K9TXYcYhMww+ZU2jr8Zl/z+6L+BN8I=;
 b=MH1dXdYkgiJj1K6Dv1izqBK53yK8BdF3YGFUQoMVGb8+u4gGglLUOh3sFJ2EA4WF7+yaAE9euZjN+yWROQtfNYOQ8fEcNDH12RqzE87/dx7/6DZ8Tu+C9ZMzvBrUa8uCUW+jTC77zztowi+D3ueq8vJ/EcfrmxFnPTTLcmrttZ42txWPScCThnZfDtllS1lnI6I7MGGouhIyGdfDRHXvRf8+Kj74JjDvt8vr3tblc9o7xDaJDII3GhBuGBLWqnKBvO8dZO38OL3p/6NNLY1B6Y9WHk9RICVmXdvm+fpm8O8BMniX289stBaaYNWZcyCW0/DbpkTtoudiJ+CVWMrcaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 08:15:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 08:15:38 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:15:31 +0900
Message-Id: <DGH35X9GCFYO.EBY01G1C6XQM@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Maneet Singh" <mmaneetsingh@nvidia.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: fix GSP RPC send sequence numbers
 to match Open RM
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260211000451.192109-1-jhubbard@nvidia.com>
 <20260211000451.192109-2-jhubbard@nvidia.com>
In-Reply-To: <20260211000451.192109-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e95cc0f-5213-4fb5-d2d2-08de6dfcbb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkR4RXc2SFhjR1BTWnZzWDU3ZHdxdGNGN0VKaVl6c3VZV0hhYVU0OExRYWVy?=
 =?utf-8?B?VTg4bjlvcjJ3R083VXZucmxybzU1QjJWeGVpbG9yamZlanNNY3ZTVG43UlI1?=
 =?utf-8?B?ZThBemY2UmNmMnh1WUpJL3lpdHNtMmFCWC81ZnlPR0VWdHFzTXdyZGl4YUpJ?=
 =?utf-8?B?dld0czVUY3VJeDdZbWNUMEp3RWhIK2FjSEFPZFpYOEdsSUhlY0dnNlk3TVkz?=
 =?utf-8?B?M2JYc3dkZHBVYkc0UmU0dlh5K2cxRHl3OVVmY1J5bU1HdWFjS1ZMbWNlRCtv?=
 =?utf-8?B?bVB3TklwRzQ1TWE1c09KTGVFTnU5NldkUFRodUV2dFZ1T01kMnBhSHlmcVIy?=
 =?utf-8?B?Nm5JWTYwZ3ZBMlZ0MDBkRGxBQXpjek50QkRjY2Nxb3UzL1Rta3Rjb0xnUElJ?=
 =?utf-8?B?QTFHKysrSVAzSllEamU5TkR0Z2lScFdMTTdGVVhwYzVJOHFQNjhUTU16VHdJ?=
 =?utf-8?B?Si93ZmN3aHg0M2NPa3A5V0pMU0xNMXJMczhjNEVTMkFJeEcyMGg5bjY0TTdN?=
 =?utf-8?B?dm5DRGg1TXRpNEdjaGhENkxDSjZjRndpTE5oOUFhSllwL2tMeHZ0bzJyVTg3?=
 =?utf-8?B?NEhTeDQ0WU5NTkpUeUJwR0lmbzJVTXJHSGVxVUdMMk1VVXIzWlRVdjVsYUQz?=
 =?utf-8?B?S1hrcVNCUUhtR3BnaHBZRDVVZmE0M1Y0OFl4UlRGZFBEK0h2dGFRRHlmVmli?=
 =?utf-8?B?c1VxT1k2RHdxamJndHNETUNRUjBVQjhjc2FweStJRzV2YVNoWkt0czBtYVhx?=
 =?utf-8?B?cXByaU1VQVJ5dHhjMWRzaEN1cnd0MWJhdFhabjI5ankyS1RzNHJKQkhna1Vk?=
 =?utf-8?B?ZjR5Y3Yxa3FBNndvV0F5blkxQVROeHdrQlRCQnZOM3loUVdyTjJZZ2ZRdVAz?=
 =?utf-8?B?VUNqbHJKZm00dkdPenMwakNqeEVwYjVpcE5hN082ZE0rYXlwdWYvVU5YeGor?=
 =?utf-8?B?b08zbWRyTHljdzQ2NFM2OHlaRkxRQmE1NUNEMmowWjhNc2dKRVBYQVVjelJy?=
 =?utf-8?B?Yk53SmVMUVZ3MTJIamlNVjFNUm5icUc1TmFBOTMyQ0VWVlAvZThDRlRoaTVQ?=
 =?utf-8?B?VXVLVXZBYk1pVUlvRENsNy9GTm9EWkRYQkQ2ZGhYVnFQdFhFdjJNZ2F4UG1w?=
 =?utf-8?B?QVVYSXl4VTZraWZEeVNuTlVPZXlHbnlhZG1oTmR4ZjNIY3A0a0ZDM1pIWHVy?=
 =?utf-8?B?QVhCV1VPUWR3VTU1bys2SjM3ZHJiYXc4akZHakJ1aUFqS1NiZkpwSGpyYitH?=
 =?utf-8?B?WndSc1NvcFFQWVovWUJzaDQ3aEM0VzRmYUd3akNzN0dIMFVvSHhKZjFkZXpq?=
 =?utf-8?B?QVVkZkxMSFBEM2p3WUVwbTROSk9zZDUzOVFSWVovVExKRHl3UldoM0NCbjFu?=
 =?utf-8?B?Y3hwZmVzZVVzcWJ5SG90OTEwWUlkYmZJd3d3NDJwZFRseVRTaU9NNWdqOCtL?=
 =?utf-8?B?VXJoeUtFRDhYa1Q1Q2ZPWUdtVmhZYWhpbDNoUmxqLzBXbGNIemYvZW44QWFM?=
 =?utf-8?B?ZCtFb0NPNXpDTWJmRGV5U0NyeG1ZZzNaS05pMUpsSVBvZ2xvMEdrc0dpd1NE?=
 =?utf-8?B?QU83dU5kbERkY0JHLzVzMkk0dlZMMjBpbzV5Q2NtVVpvb25hTEh2VVdlOHRE?=
 =?utf-8?B?L0ViVUprQjNuUWFGWmZWVFBPSTdzMU43MmtIQVpzTmg5aitkUlczckk3bDFs?=
 =?utf-8?B?SmwyMlZWNC9DYzlLK1dBcEVGSXRjR2N3L1hzSjFCZkZQcjFIdjRoeDEzdHJw?=
 =?utf-8?B?ZjZNellua2tHRWt2QlQ2eEFMVU0yZTE0SG1UZnlLVm1FUUJPMURibEJGN1Nq?=
 =?utf-8?B?MTJKc0g3MUxYeUxYUXFROG5QTmdhMzRDR2RPbm9QdHJkWXd1ck4vZmtaT3Qw?=
 =?utf-8?B?cjJjLzZ1cFFFcmpJeFpLWkhuak8xNW5EQnk4TWpleTYyUGZTQ2cvdVZZZmdq?=
 =?utf-8?B?Y0dZKy90bUpLczZmaVVhU21kTUJIVmZCZWtoRDVRNHVlUjladlpQSStuaTA4?=
 =?utf-8?B?S1NNM25DNlJEbGtlTnJrRStZT3VGRFB0TzVCSkIvMEdhT202TS9tK1BGTEFL?=
 =?utf-8?B?L25KU2huWEpCOTFnUjJPWXIwZ2JySVpYdURtTFd4MGFIcUFyRFdza1FGNDd5?=
 =?utf-8?Q?XjXE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjk5aHZoR2tTS09hNGtQMnhuZGh6ejhMcjNqT0ZUWEhMTTAzelJ3Q2g5RFQw?=
 =?utf-8?B?YlBoNms5Zy9kcVIxbHBRblU1MWQ5M1FrLzVvK2VWVmpZc0lBb245ZE5TRGl3?=
 =?utf-8?B?cStQcUdUdCtnY0ozK2JKM2FhdE9BS2dkbFZLSjVrYmUrdTMwQ3dmR3ArWnpv?=
 =?utf-8?B?Z041dzZPc0F5d01ySjJkYmQyeWYyNnZhYWdZRHd3emUrb293R0JEUHc2RUtG?=
 =?utf-8?B?cnVHL3lNbXNkSmo1cGppUlIyS2V6TTYwQnhLR3BFbGxwUlZqeWUwR1c1blY3?=
 =?utf-8?B?SjRqOUZJNzdWZ1VZeUpTdUdyUHRDcFZCVlFsdldDZ0djQitEUjlwbndYY2hG?=
 =?utf-8?B?TmY2d0xDUTB5dWJRMlQrNmsyNm8rNkZwZElwY2dMWks4WWtFTDd3YjhCdTNm?=
 =?utf-8?B?Nmo4U2Qrd04xM2lzSkZnWFhVdFNycEMvN0pTQ09rOTN4SWt4c0lJK3YrY3JF?=
 =?utf-8?B?djMzeEE5Q2NVU3BxanB3V0o4bGVmK1NjRFpSZWhrSkRaVkFKZTF2QjZnTnRR?=
 =?utf-8?B?bGhNSHVqbkozU1I0WHUwa3crU0cwQ3J2YkF6Sm1oT05adjdXZWdiMVh4L2ZD?=
 =?utf-8?B?UkJEaFhETkFZVi83QXNvU2xOczh2QlVOMnBXYlM0MWxmbmExS1ptcVNaL1Jw?=
 =?utf-8?B?cFVKYlhaY3lUWmYycVpMc0JtUU9FRWFqZ1prUm4rb2JVaEV3Q3Jna2FXMzNs?=
 =?utf-8?B?K1dpd2x0bERnTEc1SStsOFZUOGdsOFBUWDlIMUNScFNGeFZib21VU2JXNmhM?=
 =?utf-8?B?bUxOOHEvaVFHeFdYQWsvaVFyY1ZYb0xnaWpKTGw0SkJ4RXM2cFhvWms1eEtC?=
 =?utf-8?B?OVUxcUNGOW1ITWdFbnE2VGhSQ0xMM0pydVBqVzdmckdZZHlRMmJTT1o2aFlJ?=
 =?utf-8?B?S1FYUEJjR3YxQ3l4UUJNSFNQbURwU053dk5wbmlZWHk1M1ZLellyV1dvTldr?=
 =?utf-8?B?SU9xSWtRUzJBU1FIcFlyQ0lnSmhtTyt5cmVUeHlpcVA0VEhmeUlPc3NQT3hG?=
 =?utf-8?B?R1ZxTEoxY1RLT3VxNjh1bUxWTjhXZDlBU1AwczBXTFF0S0p3VTRoMDdvajda?=
 =?utf-8?B?Qm9CeUV6N3BZNkFoaGNDVjE5cmpkMHN5N0gyOEJWUTgvN0NZcyt6NlVrcGVw?=
 =?utf-8?B?UDFZM3FJcnNVaFlPdHVXOEYySk1sdmdLSWRrZ2VKZlVMYm9QQTJrNTBoWVRm?=
 =?utf-8?B?TmpPU09BdTgzdUdnbnBmQlNDeENSejFKNThtVC9nMkpZMmw2dlRpb0lNWTla?=
 =?utf-8?B?RUk3cUtXWlMzck9nT3VQdjhacEc5WFo3T3VIRXdTeVpiR1MzY25XWVg3UmlK?=
 =?utf-8?B?aTFJVFFzOTVZcSs2WHhvMlJpK2pBeVhNNUdVM1p0cS9HQ1RMczJiR2NsazZI?=
 =?utf-8?B?bUhLOUM4c3FsNDY1T21ybUd2MFpnRWovOUYycWNsR0I0SW1hK051Y1E3V0VG?=
 =?utf-8?B?aEhXNmRhNE5lK3Y3Q1FnR0h4ejZJMXFISlF2c0lHamtCWXlNN1JsSWJNQ1pG?=
 =?utf-8?B?eEx4bFlZcFNPL1RvU2xreTFFaHQ1S1JvYVlLZWgxNUhYZTRPc2IvM01laitY?=
 =?utf-8?B?OHMyYUxtUFVpa080M1hPTDN2d0ZTNDlzRkFwZU5NWEJjYkNmVW14Sm92OXo2?=
 =?utf-8?B?WVZFMGJNZGtzcDJvT1BSWWdiWVZzSzhESjdjY2lYSU9lS3pvbTBzZDFwRzFP?=
 =?utf-8?B?SG9zNHFXTWgxS2lnUXB4ajU0ZFpyRW5EUWV0UnMyaGNFbDErQm1zenU0K2Jt?=
 =?utf-8?B?VGxKeDFSRzJVSUh6Y0dUMFBUUjZST25LYUhGRGFvYW5VSEY2SG44eFNGa1ln?=
 =?utf-8?B?Y1Q5ZnRFcHkvV01KbFBWczBWSW8wYkxUSDBlZDlQeFAvWFZnS3ZnQmJpUXRO?=
 =?utf-8?B?RFZJTGRuelhEOERIWDBOdGlZN1JMcFU5R29GSWdjQlFwZnBQY1RaS21MbXdV?=
 =?utf-8?B?RXlYVTRaQWJMYldsOVUyL01CL1Z5bVhMOHJyZTdiN3BteEQ3dVBoNFFIbDlk?=
 =?utf-8?B?M3ZnZ3lQNEZHUXk0NkorOFJuNXhNTkViT3Y1Yml0RnVsRkloSTA0bHNBTnA0?=
 =?utf-8?B?TmZRUjg5YW8vUlVCVGNqam1aTkkwNStJeHZ6T3BqNzB0cU9aMjBxdldGN1dp?=
 =?utf-8?B?TWpxdTN5aUtQSVlFRnM5Z2ZpaXl6WVovOUcwd0dUTS9VNHN5amw3N0k3b29y?=
 =?utf-8?B?SmltOFdJQWo2eVBsNFR1Q0Z0aENPQzFObDJ2N2pIeUtDVFl4QStteHl0UlVH?=
 =?utf-8?B?SWw4Vmd2RXhHV2diemkvbHlzdmVNYTZXNUtoVlZiMVcrNURnRCtsT3RMT2JG?=
 =?utf-8?B?Z0t0TmZmSU15T29TODk3TllHeGpENWkxdVVTM082djZTM24rdDJWQVlsSHFF?=
 =?utf-8?Q?cs3pTJf9Xe5JkjKzm1wsG4JVtaCihZeN9uapCTEmdAqJq?=
X-MS-Exchange-AntiSpam-MessageData-1: hZ1bmv3llZd7tw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e95cc0f-5213-4fb5-d2d2-08de6dfcbb99
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 08:15:38.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsSkbj2azpOM8GYD8Uww4vJfFAnKrzV0f6OvRc6WHodOHVSfBPr/yvlm4rSC87HpHX6ukziPgSyIVDxXsLa/bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659

On Wed Feb 11, 2026 at 9:04 AM JST, John Hubbard wrote:
> Nova was setting the outer GSP_MSG_QUEUE_ELEMENT.seqNum to an
> incrementing counter for all sends, but leaving the inner
> rpc_message_header_v.sequence at zero for all sends. Open RM sets the
> inner sequence to the counter for sync (command/response) calls and to
> zero for async (fire-and-forget) calls.
>
> Split GspMsgElement::init() into separate transport_seq (outer) and
> rpc_seq (inner) parameters. The outer seqNum always increments as a
> unique transport-level ID for every message. The inner rpc.sequence is
> set to 0 for async commands and to the transport counter for sync
> commands, matching Open RM behavior.
>
> Add an IS_ASYNC const to the CommandToGsp trait and set it to true for
> SetSystemInfo and SetRegistry, the two fire-and-forget RPCs.
>
> Add MsgFunction::is_event() to classify received messages as
> GSP-initiated async events vs command responses. This will be used by
> the next commit to improve debug logging.
>
> GSP does not yet include SetSystemInfo and SetRegistry in its sequence
> counting, but a future GSP firmware update will fold them in. A comment
> is added to note this.
>
> Cc: Maneet Singh <mmaneetsingh@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs     |  6 ++++-
>  drivers/gpu/nova-core/gsp/cmdq.rs     | 17 +++++++++++--
>  drivers/gpu/nova-core/gsp/commands.rs |  2 ++
>  drivers/gpu/nova-core/gsp/fw.rs       | 36 +++++++++++++++++++++++----
>  4 files changed, 53 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 02eec2961b5f..f769e234dae6 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -403,7 +403,11 @@ pub(crate) fn boot(
> =20
>          dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(=
bar));
> =20
> -        // Now that GSP is active, send system info and registry
> +        // Now that GSP is active, send system info and registry.
> +        //
> +        // These are async (fire-and-forget) RPCs: no response comes bac=
k from GSP.
> +        // GSP does not include them in its sequence number counting tod=
ay, but a
> +        // future GSP firmware update will fold them into the normal seq=
uence space.

From the point of view of the caller this is a superfluous
implementation detail. This comment is actually confusing as it mentions
a sequence number that the caller does not need to provide, so I'd just
remove it altogether.

>          self.cmdq
>              .send_command(bar, commands::SetSystemInfo::new(pdev, chipse=
t))?;
>          self.cmdq.send_command(bar, commands::SetRegistry::new())?;
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 16895f5281b7..7d6d7d81287c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -58,6 +58,13 @@ pub(crate) trait CommandToGsp {
>      /// Function identifying this command to the GSP.
>      const FUNCTION: MsgFunction;
> =20
> +    /// Whether this command is async (fire-and-forget), meaning no resp=
onse is expected from GSP.
> +    ///
> +    /// Async commands get inner `rpc.sequence` set to 0. Sync commands =
get inner `rpc.sequence`
> +    /// set to the transport counter, matching Open RM. The outer `seqNu=
m` always increments
> +    /// regardless.

This here is too much detail as well IMHO, even more if you follow the
last suggestion in this review. :)

> +    const IS_ASYNC: bool =3D false;
> +
>      /// Type generated by [`CommandToGsp::init`], to be written into the=
 command queue buffer.
>      type Command: FromBytes + AsBytes;
> =20
> @@ -439,7 +446,8 @@ struct GspMessage<'a> {
>  pub(crate) struct Cmdq {
>      /// Device this command queue belongs to.
>      dev: ARef<device::Device>,
> -    /// Current command sequence number.
> +    /// Transport-level sequence number, incremented for every send. Use=
d for the outer
> +    /// GSP_MSG_QUEUE_ELEMENT.seqNum. Also used as the inner rpc.sequenc=
e for sync commands.

Note that these types (especially `GSP_MSG_QUEUE_ELEMENT`) are never
visible in this module, so mentioning them here is assuming context that
the reader can't easily get.

Instead, how about just "Used for [`GspMsgElement`]'s sequence counter"?

>      seq: u32,
>      /// Memory area shared with the GSP for communicating commands and m=
essages.
>      gsp_mem: DmaGspMem,
> @@ -514,8 +522,13 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>          // Extract area for the command itself.
>          let (cmd, payload_1) =3D M::Command::from_bytes_mut_prefix(dst.c=
ontents.0).ok_or(EIO)?;
> =20
> +        // The outer seqNum always increments (transport-level, unique p=
er message).
> +        // The inner rpc.sequence is 0 for async (fire-and-forget) comma=
nds, or the
> +        // sync counter for command/response pairs, matching Open RM beh=
avior.
> +        let rpc_seq =3D if M::IS_ASYNC { 0 } else { self.seq };
> +
>          // Fill the header and command in-place.
> -        let msg_element =3D GspMsgElement::init(self.seq, command_size, =
M::FUNCTION);
> +        let msg_element =3D GspMsgElement::init(self.seq, rpc_seq, comma=
nd_size, M::FUNCTION);
>          // SAFETY: `msg_header` and `cmd` are valid references, and not =
touched if the initializer
>          // fails.
>          unsafe {
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index e6a9a1fc6296..c8a73bd30051 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -50,6 +50,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>,=
 chipset: Chipset) -> Sel
> =20
>  impl<'a> CommandToGsp for SetSystemInfo<'a> {
>      const FUNCTION: MsgFunction =3D MsgFunction::GspSetSystemInfo;
> +    const IS_ASYNC: bool =3D true;
>      type Command =3D GspSetSystemInfo;
>      type InitError =3D Error;
> =20
> @@ -101,6 +102,7 @@ pub(crate) fn new() -> Self {
> =20
>  impl CommandToGsp for SetRegistry {
>      const FUNCTION: MsgFunction =3D MsgFunction::SetRegistry;
> +    const IS_ASYNC: bool =3D true;
>      type Command =3D PackedRegistryTable;
>      type InitError =3D Infallible;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 927bcee6a5a5..e417ed58419f 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -260,6 +260,26 @@ pub(crate) enum MsgFunction {
>      UcodeLibOsPrint =3D bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>  }
> =20
> +impl MsgFunction {
> +    /// Returns true if this is a GSP-initiated async event (NV_VGPU_MSG=
_EVENT_*), as opposed to
> +    /// a command response (NV_VGPU_MSG_FUNCTION_*).
> +    #[expect(dead_code)]
> +    pub(crate) fn is_event(&self) -> bool {
> +        matches!(
> +            self,
> +            Self::GspInitDone
> +                | Self::GspRunCpuSequencer
> +                | Self::PostEvent
> +                | Self::RcTriggered
> +                | Self::MmuFaultQueued
> +                | Self::OsErrorLog
> +                | Self::GspPostNoCat
> +                | Self::GspLockdownNotice
> +                | Self::UcodeLibOsPrint //
> +        )
> +    }

Mmm using a method for this is quite fragile, as we are always at risk
of forgetting to handle a newly-added function. I wanted to eventually
split `MsgFunction` between its command and events constituants, maybe
that would be a good opportunity to do so.

Also, this is marked with `dead_code`? Looks like it belongs to the next
patch in this case.

> +}
> +
>  impl fmt::Display for MsgFunction {
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          match self {
> @@ -816,7 +836,7 @@ fn new() -> Self {
>  }
> =20
>  impl bindings::rpc_message_header_v {
> -    fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, E=
rror> {
> +    fn init(cmd_size: usize, function: MsgFunction, sequence: u32) -> im=
pl Init<Self, Error> {
>          type RpcMessageHeader =3D bindings::rpc_message_header_v;
> =20
>          try_init!(RpcMessageHeader {
> @@ -829,6 +849,7 @@ fn init(cmd_size: usize, function: MsgFunction) -> im=
pl Init<Self, Error> {
>                  .and_then(|v| v.try_into().map_err(|_| EINVAL))?,
>              rpc_result: 0xffffffff,
>              rpc_result_private: 0xffffffff,
> +            sequence,
>              ..Zeroable::init_zeroed()
>          })
>      }
> @@ -847,26 +868,31 @@ impl GspMsgElement {
>      ///
>      /// # Arguments
>      ///
> -    /// * `sequence` - Sequence number of the message.
> +    /// * `transport_seq` - Transport-level sequence number for the oute=
r message header
> +    ///   (`GSP_MSG_QUEUE_ELEMENT.seqNum`). Must be unique per message.
> +    /// * `rpc_seq` - RPC-level sequence number for the inner RPC header
> +    ///   (`rpc_message_header_v.sequence`). Set to 0 for async (fire-an=
d-forget) commands,
> +    ///   or to the sync counter for command/response pairs.
>      /// * `cmd_size` - Size of the command (not including the message el=
ement), in bytes.
>      /// * `function` - Function of the message.
>      #[allow(non_snake_case)]
>      pub(crate) fn init(
> -        sequence: u32,
> +        transport_seq: u32,
> +        rpc_seq: u32,

The caller site of `init` mentions that `rpc_seq` will always either be
equal to `transport_seq`, or be 0, depending on whether this is an async
command or not, yet this constructor allows any value to be used. I'd
like to enforce this invariant by making it impossible to build invalid
combinations of sequences.

As a matter of fact we already have this information in
`CommandToGsp::IS_ASYNC`, so the simpler way would be to pass *that* as
an extra argument to `init`, and let it handle the sequencing
internally. It also has the benefit of not making this message-layer
detail leak into the command queue code, making the discussion about
this detail even more irrelevant outside of the `fw` module.

An even better solution would be to to pass the `CommandToGsp` as a
generic argument - that way `init` could extract both the `FUNCTION` and
`IS_ASYNC`. Maybe use a public generic proxy method that calls into a
non-generic private one to limit monomorphization.
