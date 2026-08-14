Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1B258CE7;
	Fri, 14 Aug 2026 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670326; cv=fail; b=DDHfYPngzwPvNJnGUaWQSM/qJCR44o3oDE7OZnXzm03JwBS4NGk8zqXhzmzLUmh7hldq6OtWfGMOWLv/8OgmFBwPyzDSTkmsG2FEqE/TM5T5sjOB9KBOaUHl3J9GOlPFBXZkTYD+YDQy8E+ux6hw3A9NkfEediPCQSgQH/Sitpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670326; c=relaxed/simple;
	bh=6j5hNDdadp6U2jKEBJaHBxdeAFx4zPs//CZP1x6N6wU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=pvWKpzX0ycYFuWwlPAW0ldoKhdokW/Nrqjak8HKsVDG+zu9TguFkYrM3EOyKUznA/A13uSAPQVJpBnEH22AYqnpFMgKlM78yHChd+1OgX6vmgdUXN0o7j1KTs/JfNwIMuecz/f+eJvHuK+aLDgc28nOUM6w/9TWzMUTqZjSMu3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kBxEF3aE; arc=fail smtp.client-ip=52.101.57.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kBxEF3aE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljf76qnjI/b/Lfc9V1lD/M4Z3i1NCeHmKreCqOAgp8OKVIw4ewLAt1/t4aJOvAe6r3xOjYgJt3Z3ZxkkLDcQYhLlsqDFLFYI712bDLV2unHp4MAvz3o7ZvnfjrO3XzML2LkNW7yMVxg3qYIuohaaWzytQNn+q7O0/vi2GCDRslZmLDifatB9K4VRvwB0/5RgzX5f2m7GOj0NdvRTeyv+SCbvy1jHjXtpBmI7AXBE59AzC14NEdNyRrffNJoUFqp757b4yNQTOfYu+qSWifGSVcuSlZcafqDUISJ8U2Pex/7VzM0vL4TOf+X+zZqpFe8dehPRQzYEC8SBqxD/yu9Rmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j5hNDdadp6U2jKEBJaHBxdeAFx4zPs//CZP1x6N6wU=;
 b=qIP2ZVb56tGjyp36rkOsuO6RgAAB0+bsKeOevnkXWJ7K0hxxoeXxEHMHhOcvabU9wW3s4EnudSP7azd/bY3LSAnr2MS3iR/PJB6vroMtcsAMzWBe3n7EE9AixleVcVQoAwaWT2SNUZX8bn+hFciLZav7NCOvel18ESdUiqHLz332A91mq07gu6fuO6roQON/Tg10JrO3H7PEtnS26oqHrohpcoFvJpVazUhSOlfC7hLBdfWq8BXWx64GgaQCGKrxLD5oKSBBAiQpbs2Xzq/bo3f0kbXvCEZ8r/dR0ckcSBlF5Sg6mK2MQzhQli9RT98f7HZkactdIAOTpmtwYq8leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6j5hNDdadp6U2jKEBJaHBxdeAFx4zPs//CZP1x6N6wU=;
 b=kBxEF3aEiTUnuhcNq8ZtDoWf41j9EBHysA4cjP5ZQlKbVSOqOmaSYS/PHOt/IzD0MzSQ4PWSKZ2ClXddsJyY4GyynNI3QICpDUIV1892tOB78ZElAFCzSP1tRwys6KdW2hcoKhZGmUIG/kVSEgnEvEM6TxHqombAr2KSp2cx2yT2F4Z3wWbx1myvRXX/kU7OJdDsV6cEpqrZ92QbwKD3Bb7HhASNl6OQbd1cBCRettAJVt6t3LfvA1LX5qwFofSwo4Vny0xh/sTgD8tWTQrpJy7g4fMz0+QdLjcZVZ9fpIiSqwgjhq4bspLhFfkwtso9wWAt8B2Zqwa1DdxcHQ5+Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7502.namprd12.prod.outlook.com (2603:10b6:8:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 01:18:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0315.008; Fri, 14 Aug 2026
 01:18:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 10:18:28 +0900
Message-Id: <DKO9RKJUQ9TL.2G456IBUVV64E@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
 <saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
In-Reply-To: <20260813152312.1311142-2-zhiw@nvidia.com>
X-ClientProxiedBy: OS0P286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0f7090-ad96-4ef9-580e-08def9a1f797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|23010399003|376014|366016|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	m+wEfP2J8XvyPOxwYEY8cusAnYQJD0b4blrhtqTPRQPUJg2wEkOvbFuKCID3Xba12B5OBH+k413AjzjHb/AfRqb9QJItbeC3No0TXlqGqwh04Ms66XenFKj2wHjXowxfFmp9qwMGKnAA9BRAvasYuvE2KM0hnmN1p/JgTPo1kLvRir1gspTAJHoZ9yZHlEf63nLIb22ia8lUcFV6tv5sJ0LL7QW0G01mqpqN/WJSlXfmT+5PXOvkydxn3yCmjI9ohu+J8qpme1QrUTJPzFDUsqdYtWUsF1jPRPPjh2xZoqsAvyS+KUs70AOC/sMCx4T82L+xBwrtxytwtWaC51+vC4sgJGabzrxiRaYf2/3kwvkhwk5rWwoZjqjXbqZpmntPg7PXDLHzp3rZk4N/Tn4S5mFtQEBDB4Yi6tYatZ7+1ZJX/zrItPomJWoU2pXM4jYCXcCgyc3cKXnSpXaf7sdU57vSE9aAii8K6SA1qLyJQ7DxT0gF+M0494oxYcvlZ91mna1494VLYM1r+lLqY4k3l1i3x/zQhdKK4ejaB6X5VqOG9vLAt8lLvA7toT1uZja8rpGL0iIT/N8ghFOjvzo16jR83bkmrKkDWE493W3+mPNNbsSFNiBfuZ1rJUF2wgIi2xkAY3v+Lf/feVD+0+VpmPw8E0mI9WcGh6UCV7aGc4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(23010399003)(376014)(366016)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0NMT3N3c0plZnZ4OTZFeTJzbEhrblBqVEg3dGc0RGdjUU80ckw4RDdPRmpt?=
 =?utf-8?B?YWJ3aktoUGR5KzBCWnZncEw4Z1pQclFEaThNTFlUdmRUY1JiVTZOVzJ2UUFY?=
 =?utf-8?B?bWc2TFlCS1RhUjc0RU5LTzZsQ0NvMWNoendkVWtDN3E4YlJScXZNM1JLa09i?=
 =?utf-8?B?bmYySjNDSkZMeFM0VlB0aFV1MEVKZm9RS3VSSmhVMlFyT3ZjOTQyT2lMT3Ew?=
 =?utf-8?B?MjE5N0xML2s2V0ZXNkcxY2xkZGhuNk1QNnIzd2d2dHRQRmtPSU5WQ0JVdEx1?=
 =?utf-8?B?a2RzTmlNYXg2dWxBQnJYYThDaFl6aElKaGR6d1RyV2xKYWcrRUZ6YUlLc29C?=
 =?utf-8?B?cytxVkxLWThyN3k0eVJ2ZE5TZEN5dnFoUjFiU2x5ZzRUMDBiTlZlcW5EdjhX?=
 =?utf-8?B?UCtJY0dQazJxay9SY0hsUTlYa3Baa0lBcGZWb1NJMzRrZXJTSzJuVGtYeWc5?=
 =?utf-8?B?OElGZnBMb2s5Y0tWMjBFTXNzUXlhN29FckJyT3N4MFF3KzhRRFdSR0kyNm92?=
 =?utf-8?B?L0Q3ZUU2WWIxeDI4K2ZqcVdBZDE1bXRhRlhZMUVxVlBVYlhGaFBtRFJrY1lJ?=
 =?utf-8?B?UW5GNVVkTkdYdGYveUZzeFpnSkRubDdEdXZpM3NOdnB3dHY4T1BzaHBvYXY1?=
 =?utf-8?B?V3BOVW5PNm1XVnN1eWRvL3R1K0ZodGtGLy9icnQ5aUtvdm9xVVF6cDc5REhI?=
 =?utf-8?B?WGo0MDhud2RTNU8vUEZaL2kvOWtkU2txMTFpV3Jud05QTHcwcGhNNDVpVkxY?=
 =?utf-8?B?cHdwNS96WDNwaERkeUdRYWZuNENaL2FRNk15d2xJZjNseEk2SDMvSHNhc05Q?=
 =?utf-8?B?L2lieVBBQXNOcjBZd3djS3EraDRUSTcvTXd4TUg4cDNCZnJXZzdVeVF2eFZ2?=
 =?utf-8?B?VGt5T3MvdkM2WTc3UjB2QUFVcUd6aEVsc1hnWVIwdHdDSVdLWGRMWmE3QWpF?=
 =?utf-8?B?dkNKNlZua3dUSzNpR29Lb0xhME8wN3lXWkRpOWtqUzU5QTZwUEdOdzBtdko4?=
 =?utf-8?B?aWFRZms5VFNtRWVPU09vZXhoKytxOFkyMHRoRE1GeFVUbURKb2IwK0pQbEFY?=
 =?utf-8?B?cXduZEZCcFZPYXhGakg5aXk1NUpEK3pjOXhpZ3NNeUdWMjBzMVdQM3B1c1cr?=
 =?utf-8?B?ZVA2SnBsVFNhNGZFNjl5eUlrNTQ4bFJlMHptRDYyaHNDdCtZUFAya1VodjJY?=
 =?utf-8?B?NXRVdDNuT3BaaFZUazA4Y0VtTkJpWFZEOUNDNUo5ODJibldzSHplWC9iNlV6?=
 =?utf-8?B?d2czV3ZTVjZpQUpXaXUxZmF0WE5RbkUxZHIvN0JUZk55UzByMFBiNW80WndM?=
 =?utf-8?B?U2RkR3JHakYzbSt3Z2JpWi9URFU5OTNoaVAxckIxNkhLU2ltM25qQmszeWlw?=
 =?utf-8?B?L2Iwd1EzamdkV1VXMytteTVBbXJuNll6OHFPT01aeHNTcjMzS1pvNUFSSnBD?=
 =?utf-8?B?TWdLaVBwVHNyU0NYVDVNdjR3UWxSMXFpd0t2T1dOZzZhcGlrb05qbGtDd0Nu?=
 =?utf-8?B?V1EycTAxK1BFblN0MWpLcXo4R2pSUzI3YkYxdGZKK1M1d2duVGZCaTR5RzBv?=
 =?utf-8?B?eHdiZFJ1a25tSEQ4NE9sOVQrbGp1czVqeTcxQlVqRVpqem9EOWtielpvVXJx?=
 =?utf-8?B?OUlJbTRnckUvMzEyOUhwY3FnNHlZS3QwbGpoUmlUYWtadjlzTDM1Nzg1L0ds?=
 =?utf-8?B?N0Z1bk5rQUFMRFZKcHZtL1FPeFpxVHJVMG1CMUtEejJiQXBCSVJJVXB4VGYv?=
 =?utf-8?B?RVovVHJLMkpRQ09paDNQUEFLTDEzKzhSclNTUXJ2ZjhpU2owUG54dkx3d01I?=
 =?utf-8?B?c2lmRG9sYnYvenpkMWNPY1hyUWE0RzJmekxQa1VwYU52Ym4vQUEvMGdRaTF6?=
 =?utf-8?B?Q3lvMmNmTHJGdHcvRjVLNnlPMkpVTUxqR0ozUkNhMS9CZXppNGxnZnBFL0hU?=
 =?utf-8?B?T0pjTThkYkxGTlR3aWZKemwrdEdXaTlCeFZKZ2xvMDF4Y28zTi82MWkwUWd0?=
 =?utf-8?B?UlJFaDZycCt0VHdzQzY0VGF6NGhxT29rZzhhS3pNKzMrdE9KNEs5RHNOakVo?=
 =?utf-8?B?dlJzUGpkUzJNQlBlQk1EeS9oR2l5bUhqMGk5cVlaVDhBMkRCMWlwV3dIMmxr?=
 =?utf-8?B?Y2ttR3RLd2QzMVJZU0ZRc3pKTjJjWXNPRW5jVVVTYmtjb05McS8wSmI2NGVy?=
 =?utf-8?B?WWpGdlpYQTFMWVpkaDlaaEF2enRLdjlrQkdKTGhzZTJuNkh1eWNYRUN6YUo3?=
 =?utf-8?B?a1lqSWNsZmN2UjBLQTUydXZCZlRPMUtmWGU3YUMvYlZkUjl1MzlLZnYyZEox?=
 =?utf-8?B?SU82b0R2enQ4MlhleUtWUG9kZEkzdWUrRHRDRkU2UTN4UWZyc1dpRjdkZGlC?=
 =?utf-8?Q?ttWh+rKq3sxU/WU1XKAy7tWkT7jS+M1Xg7Nwd5c2WJqI3?=
X-MS-Exchange-AntiSpam-MessageData-1: 3ZhI7PrDybz5uQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0f7090-ad96-4ef9-580e-08def9a1f797
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 01:18:37.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 161q8Zpm0sEExhKp+rEMHsoqOWkDCLWxEBuRdijUIfyslXVjewBE8taPjo6/Xej9JawD/15v0W/huGvoCfid/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7502

On Fri Aug 14, 2026 at 12:23 AM JST, Zhi Wang wrote:
> Introduce safe Rust wrappers around struct fwctl_device and
> struct fwctl_uctx. This lets Rust drivers register fwctl devices and
> implement firmware RPC callbacks through a typed trait interface.
>
> The abstraction keeps lifetime and reference-count handling inside the
> wrapper, exposes pinned per-FD user contexts to drivers, and validates th=
e
> layout assumptions required by the C fwctl allocation model. Allocation
> sizes are padded so the kmalloc-backed C allocations also satisfy Rust
> alignment requirements.
>
> Registration owns driver private data with a lifetime tied to the bound
> parent device and verifies the parent identity before registration.
> Callbacks access that data through a higher-ranked closure, preventing it=
s
> erased lifetime from escaping, while Device remains only the refcounted
> fwctl object. This avoids requiring Rust drop glue from the fwctl_device
> release path after unregister or module teardown.
>
> RPC callbacks receive typed scope information, a mutable request/response
> buffer, and the userspace output-buffer size. Response pointer conversion=
,
> length validation, and raw output-length handling remain inside the
> abstraction.
>
> Add the Rust sources to the FWCTL MAINTAINERS entry and add myself as the
> maintainer for the Rust abstractions.
>
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks for this great work!
