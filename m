Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A6306483;
	Wed, 21 Jan 2026 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975068; cv=fail; b=IAkB9VQ+xf2syci79V/D6KeHmB+Icn6EFMjhmCd0IdGPrKGo9PvYzM8eC44CoROj8ndcWuwqCfh6/CZL96v0euE+bYJpcxuqQWtnGqk3YRN3/yxbD5RVX4Ev9zDBEhhQGNIJbV/b3bOGg/4PimIbpfWtIBqYuL9bIm4VSdopgxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975068; c=relaxed/simple;
	bh=yJrIS+RzX74E3HtYhUhU8QFHimEVhZlNMvaUTz25DXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q2wXxglRuVlunFy7zcnmueq4+0QrIgSyTBFNJ8JD6YnT19iM1d46atI0lwB9+41cPRabMLlZ/iI6FaWu2fwcfuncjIWUjXwCarWJd+hZmT64dxYeBr45XWl5tNO4OcDTdw6SVcafgqoKaB/C1NIjmWwIl2UgfLuTJPHNcGuhnbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZX0EdN+c; arc=fail smtp.client-ip=40.107.200.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZX0EdN+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmegX9PEvZEE1EBg0sg2IA9pW2YmXl8qweMwmE107xi+LqtBNbADmBlcAxCk5eI6Jr0ZkPP2zXIr9SSOWFeK1G65egyt0qxHZqGzNQfSXoEM0BEheGuM9mBVnrp2leh7aeX5qc+LHoGy5SVh/teKmZ33UmKnV49em6yXdwNmRnH8sPeTzfR72tReZnf6J2avhfhg1jqklIi5MH52Rqt7aji7J/6GhvQnK2f2rxGIHZklwtCy8QxLEYx9NtZyCL4ybVcC0jJ4d1dV2XKcSahAqzKMtdUK4MURU0/h/76rswlHbH5U5FtntMal8Q87oDTej7YyP1Z7VdJwD/tlAfHOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKcLJKZfpysgu4hbcOAZIqrefcqe2LnvgB1Et63YHZg=;
 b=oG8X2+8j6GxTxvg7tmyd1UM9u9kqCKmq0OBXHN5cbQvOOECjrGQrxWkoSnqFiBN9AITzLis90PNOAmhlYKcO4xlXGg9wa/vvKhjwjyCxFjq7b6YvBoNANh/auzim62Lkdoi+3v7vz13B65/HV/lr29unKw/gJGTWfWSVuOS50ZhcOhnB6chp/3blCzc/o0ZOnwa7kjNJslOQWdI7Ai3zC29V997xK5noAE0gBRHvq3ulBAuoB6HEYkOJv9iwTG1ls/KLdNfuWuYR9y0Vdx8RxepAKOxry7fkZshQqOfO0Lf+nU9r70/vqP2rL+RQf3jkhKJNeGpYvMs6GHfDr4EW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKcLJKZfpysgu4hbcOAZIqrefcqe2LnvgB1Et63YHZg=;
 b=ZX0EdN+cLt1TLzOF4bpWY7TKOHI7l96jhcozb6wh5tx5cBD1djuPW68BehhLuiVCKT8n3wa2URKUnXws0v6YUBYifNWC9CUpt81f40ElUNfe6Hd+ovoELleQzHfbkmPH+CbhNGK1ipoepYPxIGsRO6Whpettm35s1ira24wJCGgVLMTpPA37EE4dxq3ZemnBxVPY/TvxA2IvHolKF0eXLimUMtvKnkKj13QRmlKGoLbcWSaJX6jzfBthzyJ35gOXNqqB/Gr/qAePL7QmM0Dm+Ov4g6R4bLKDsezv2EHbf0lnz3IG1s6PCguOiuNyvObLttMAUB5DzwDi7+w1Zxp3rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 05:57:43 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 05:57:43 +0000
Date: Wed, 21 Jan 2026 00:57:41 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Message-ID: <aXBq1TUBKWHVmg8S@yury>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
 <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
 <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
 <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
 <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>
 <DFTOMX7KEFXK.3A9467KZ5GGAG@kernel.org>
 <CANiq72nRJzBm0KuGwoUV2kOk_t3VLy7FP+H2m16VAQVKAp1j1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nRJzBm0KuGwoUV2kOk_t3VLy7FP+H2m16VAQVKAp1j1w@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:408:fc::11) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aeb624b-984c-4ee1-9f17-08de58b1fe83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUttd2dQNlVWY0tLNHZFV2tmRDdiaTlidDljQWg0Wk04Z0p3ZWo0VGxsdGZu?=
 =?utf-8?B?dWhrMlJ1UHNNOTJXelBCTkFhY05CckxuOGs0R1ovcExrc0NmYzF0b290cDM3?=
 =?utf-8?B?a09ZTDc4VnZCa1ZDRUtsNUVhR1JaVTluaW9SSWZHVE96M0dhM2NRaFBVMVND?=
 =?utf-8?B?OFFTanhCcmFMTUV2cHNmQU9iZXhGaUhBMVNheER2NTNFblpBa05ab3FGVnJH?=
 =?utf-8?B?ck8yNlRhaFN3ZVpBQUpydW1YL0svVGRYSTl6WU1hMFpqR3BiaVRTQ0lINFEw?=
 =?utf-8?B?cm00anlERUNtVG1sdk95cXVZMUMvWlVpQSs5Unh2UGxJMENkbFV2S3k2T0hU?=
 =?utf-8?B?MGhhSkNDWDQvS09IYnBKeTFNajZCbG44RmpWbU5qVTh3QlkzcG1kdkMvcjZy?=
 =?utf-8?B?RlN0ckNUQjRMWDZJY2ROSi9QN3BXMExTSUJmU0U2Rjc3YWMrNG1PZDUyVlI5?=
 =?utf-8?B?ZEQ3YzlLa1p5TllHcWdtTkRWb1dKbitZU3hmR3pPMGxHMGFXRlBsODh4OGRx?=
 =?utf-8?B?ZU80YktSbDBqaE83OUdIMG1CV1ZwVGFYUHZkNVF4UkpMaXpyYkZDQ0FMVEVD?=
 =?utf-8?B?OFZYUmdJeTIwMnh1UU5CMGt3aDgxUHFDTkM2cmJmU2RYc3pZaHBid3kwT1dP?=
 =?utf-8?B?SnlxbThYV3FrL1VDTEJ4UG0wV0dJVnE3VzVROE42dGprWFBDczlBc1o2dm1X?=
 =?utf-8?B?ZUFiQmJEZzVQcDNNeUpTbGdveWVEQlRhL0t2ZlpHbGlPN00yQy9tam9vckhx?=
 =?utf-8?B?SmtidkhVb3IvNjVMTTIwQ2VVUng5NUFaTHdHNlAzSTd6R0lqQWtEd3cvQnBh?=
 =?utf-8?B?aWpsSUNoNGhCUDFQMk9xNDJxYnlVRWdHbzZxOUY2UlBXMTBEVkUrV0lDK3Jy?=
 =?utf-8?B?bEowR2JIb3JNcnVvc1N5aWZTTlBQV3hnWERlM1RoTWFFMmJRd1o5TFZmdy9N?=
 =?utf-8?B?cnU4S2o3R2kyZHYyaXNJVm1KRGpaLzFTcGRNeXV4bmVGMVRIb1BObld3ZUo3?=
 =?utf-8?B?WjNWb3NIY3JqdVFWNFQrMjZyazMvZGlwcnNrZXVnMFI1MjJkbEhsV2xYekRT?=
 =?utf-8?B?TTllSjhYc0xmVzZLVUdRanhjSFZ0eHM1Sis5UHdPWWZ5dXdKSnFTQW5mNmJC?=
 =?utf-8?B?aEpPNHdMQ2pTODIrQ3V3VEl0Vm0vdzJLV1gvd3FHUXNENlFnYjUxbDR0U0Za?=
 =?utf-8?B?d1hNUHNBUHVwWkdXNnczYURSVnFDeGpianBjMk1uTVQ4bnZuaFJkd3dxWERR?=
 =?utf-8?B?YlY4dW5UZUhZOGFuTlpwZGFEK2UvOHlvUHRhcDc4b3NSTWtSL2QzZnZxcDI1?=
 =?utf-8?B?bWZtWFRqNG9sNVBoTldibCtWazRTcmZHTERNbmVlbjIxVWRFN1NhWTA4ZWdN?=
 =?utf-8?B?Ui8yQTArNTIzVVhNVENzMm0vVkgrcCtSdDFSUWw2UnNRdnJGTlJjK2o0eG80?=
 =?utf-8?B?RUdxWVhLM2lrUUdmTW42ayttTjBrSEh5a0VXekVuNWVxV2JhUTZpc25uamo3?=
 =?utf-8?B?WlFhckwxYlhQb3dhbmJDYUFtMTBvWE1rNWdlSm5SQk9TTjBzNUxZTzVIcW96?=
 =?utf-8?B?R1RXVVc1VTBVOFN2QXo2dzM5eXlCMnUyQitHbWRlMVRRZE1vV0lPQnFEU3hL?=
 =?utf-8?B?RVBUOFJLNW9LY08yTWVST0VPTFNCaldZeE8yb0xnUzZ6bWpMZnd0QWY1YU96?=
 =?utf-8?B?VHJFY0xsc0JuVnZGQmFtaWRLQTV0bGxNQnpYalhBRWdCQ1Y1akxXMWZ4Ykdm?=
 =?utf-8?B?dFNOSklPSjAzNjRyWlFNcHI1T01uNFVCczRDazRXSmFDT0JjVFVUYnZRU1ZJ?=
 =?utf-8?B?MUgvdTJ4cU1JdU5IQXR2NTJVNjc0OHlyUmE0UWdpdVZMMGg5R3JDSGJobDZY?=
 =?utf-8?B?bmZWczdiNGJoSkNsbWNaY003eU53cVQ3V21oUzBmSlRmZ1NqNHlXVmNDaFBt?=
 =?utf-8?B?Wjg0cnM1WjVHS09JL2dmSEpRL3BOaWFkNjVuR3BvanRFbmZvTy9IUS9DeHBY?=
 =?utf-8?B?b1AvbFFLM2RCalNNRFZmM2h4YmxyOEFUUXNPWkRIMzR5V1haeU9nUXh0dVFP?=
 =?utf-8?B?MmFVM1J6VkZwWEtYRXIxcFc3ZHU4Z3JFLzI2NVNVcUp4djVvS2lLYlAybThr?=
 =?utf-8?Q?A90g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9YOU9YNXN6ckJmUmk2czNjOWZzekYvQVMwK0wxcVQwWWNENWJoN0puSGdJ?=
 =?utf-8?B?dFhXellBTURuTXgzR1hOS09Mam1JTkJvcW5yVUQyWmZ1ckZwQno1RE53ZGpn?=
 =?utf-8?B?U3FVM0IrMHVEcnpqVllTdTlMUSt3Q1d2MHdWM0JGOEppeWoxTDlDRDAzQm9t?=
 =?utf-8?B?WkdHaGVhTFFzUXFPbDdzYnJ3NUxMY2prcEszMmRTZVgvK1ZRTVA0MmJqVTFk?=
 =?utf-8?B?Q0trZTdYUm0yUWtzOHdIYzU1VkVENUthemFzQTRjK3FnNjhEN0NpNld5cW80?=
 =?utf-8?B?Q1hFTzZtU2xURTUxYmY2RUVpdUo2VEJMZFJkTjhyeFNVZFd2NFFRWWtENDFM?=
 =?utf-8?B?R3k5UnpyTlJaM3FJTFhicm93YUdFT0FjenVuY0VnZGViamwzLzd4dnhJYWFm?=
 =?utf-8?B?VU42WkdmeFlnTVI1amFnOGVRMjFZVlhUWkNRK0pNa0twR2xlV1dFbVBYd1Mw?=
 =?utf-8?B?cm9NM0ZqVTZLQllOTnEwYmd3L2grYi94WFdHc2hJVUUyRU9FS3hnaG0zVFMx?=
 =?utf-8?B?ZTNJc2VVM1dZZFRJR0JtdERJdEMwNTJ5aGZVdnRFSWZlN3g2WWRzZkxlTlRZ?=
 =?utf-8?B?SWI4Qm9nYi9OemhYSzRjRGZrNVVqSTVJS21GUlBtR21KMzEydUdITFlIMmhi?=
 =?utf-8?B?aWNpUHRXSTdNRUhuTEJ1ZVUwckhaUm1qeG1DWDd5Z1ZlNzFWeDdwUzBxbUs1?=
 =?utf-8?B?SmgrNUM5YUEwcVBYQnlqOSs4TXFaNUlQcms5MnBZMnpQQ05uWGxDSVRIUk50?=
 =?utf-8?B?U29TRVBGWDIrcHF6aUljOXU1TnJhZTREREFWRUZCWFFiMFpQRjNXUDNmMW1M?=
 =?utf-8?B?U2tkY0pHcm5wQndyVWNkVkMwTnlmUVMrTkRnU0lWbnlBNGNpRW9wbE5rU25X?=
 =?utf-8?B?NmdJVU1OVnlLL3QvM2llQVBZZVlHNDIvZ05nQ2d5emRmb1NlU1BSWXArTFBo?=
 =?utf-8?B?UGZGYmwyc1NOeHA1bTlyZ2VKQkNPVURub2tFbHVhNHpsZE1XVFAxYU5ibEls?=
 =?utf-8?B?VDBmS3UzYjZsZDVNNzk1aTVsRWZLWWczcEs2Sk9NYVRyYndUM0lTeVZJUWFt?=
 =?utf-8?B?TVJKQjhReXNYV3lsaHAwaHZFZEJwcnVjOUNCQkRkUklqUGlDclovcDZvQ1hq?=
 =?utf-8?B?TGQvV00vWnlwTkRMK0JSWmpvTURJYTdHOFNRTTV2dlhaMHBvZjgxUzNtWG9I?=
 =?utf-8?B?aDBCWTlDQXNzUUxkNCt0aG4zZWJVc3YzR3l1ZGFCMTEvY3h0OWFFU2FuVU9Q?=
 =?utf-8?B?L0hyUlRYQ0hmalhVNmd5TEpVVFhsa2JseUE3L3B5anMyWDRZVVoxVGgzUWxM?=
 =?utf-8?B?aW5LOHllSzhjRlovdUNKREsxVUFJNUp3MXNJR0cxVVgvTTNBc2h0M01BbTMw?=
 =?utf-8?B?K1duVmM1WEo1YkEwKy93NVd0YmZENDZHaVdOOXRheHpVK3pvNWR2RldnUFNC?=
 =?utf-8?B?MnJjV2YvK1k1eUM5a2dXNCtnYXdMek8zUjZlelRRKzcvNlYybVNUR3RENXFX?=
 =?utf-8?B?YWdDdElMTGF0R0dXU2VFZTZ5ajRZMlFsYVRQMER5TDA5bDVrUmlFZVBtSURr?=
 =?utf-8?B?c3Fmc3hwd291S0ZRVVBhYUtKYjJIL1pWR0NveUFLS1RsR2JtcHVCWDBrL0JR?=
 =?utf-8?B?LzlyRDhWTU9mNjJhTWxQYUhWaGkzbFM2M2x3dW9vc3AxSDR3aFc5NlQxdTJq?=
 =?utf-8?B?bW1SaXdacFpvaW5HcEdUenJEMzJvemtKK1QxS3F5MXkrajJ1V2hkUVhvWXpi?=
 =?utf-8?B?ajE2YzFiNFc3WXZUM01YMkRxWHZZUVc1ZFU1Nk03aUY5YkFnYVFOOGFUOVZ3?=
 =?utf-8?B?MzBRcStxRGRZZ1dIQ2t6LzdOWG9qVkFsbWZvNVgwV1VsMXI2Z2RTb1VrMVRp?=
 =?utf-8?B?WXVKMWFxU1FDU3NUa3hZUEcvZm44ejdtWGttVUd0L3FXb09NcHV2OXdVc0hH?=
 =?utf-8?B?djhCRGdQRUhOM3BZQ1NZdHF3dTFBemZNM3htUm9qY2ZpRG1ZcVFnME9TVjZN?=
 =?utf-8?B?ZjkvbFNRb3JlbjlqMmQxdEs2ZzQzK3I4Rlg0Qnc2QVduQUJ0dXQ1M1FtN3U2?=
 =?utf-8?B?QW5sV2ZwS2taZGt2a3VSRmJ2a00wRFdxc0JlYUFBMFhGZ1VweUt6Z3BGL3kw?=
 =?utf-8?B?RHBRc3llR1NQdDdnVCtHYTBYeHBvU3h3V1p2SFBLL2tVNU4rNk1vcXFpRFJ0?=
 =?utf-8?B?REVDNkNETndlNHdXei93enMxTm5vVzVpOWJqK04vQ1VKei9JSEx3UC9KY1Nh?=
 =?utf-8?B?N1R3Ym5TSmV3R1JrclA1VmFnVzRmbFF3NzN4RHMzd1lqbGlnKzBDclZhd0xX?=
 =?utf-8?B?M09FOVRRd3VPT2l6cGtFS3psYUdnWXo2R3cvYkRFZStWc2xweWxodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aeb624b-984c-4ee1-9f17-08de58b1fe83
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:57:43.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJM8UJSJbs4UpAortclAOmYdUgdbO6UN7WFelKddRKiBiBAFFhAn9edx/s4A3nlUUx1ToDH9rAA9h1BDGS58HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685

On Tue, Jan 20, 2026 at 09:31:14PM +0100, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 9:01 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > I think it's rather unlikely to land bitfields this cycle. I think Yury
> > explicitly requested more discussion on bitfields and also encouraged the "two
> > stage" approach [1] moving register!() first and then extract bitfields
> > subsequently.
> 
> Does Yury want to maintain it? From his messages back then I am not
> sure if he does or not (he suggested "some non-rust person from a
> related kernel subsystem", not sure if that meant himself in this case
> too).

I can become a reviewer or maintainer, assuming Alex will become the first
maintainer as the main developer. I can also move it with my branch if you
prefer, guys. In this case it's better to make me a maintainer. 

> At least, he suggested adding a `MAINTAINERS` entry, which I agreed it
> was a good idea (by the way, this patch series should add it, or at
> least the eventual one that adds `bitfield!`).

Yes it is. Alexandre, can you please add a maintenance section(s) for
all new files?
 
> In any case, it has been a while since those discussions. It would be
> nice to know what people think nowadays about the macro here etc.
> 
> But yeah, from my side, no rush. And if Alexandre wants to maintain
> the new file and he wants a tree, I am happy to set it one more up.
> 
> Thanks!
> 
> Cheers,
> Miguel
