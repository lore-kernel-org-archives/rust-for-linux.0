Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D1303C86;
	Tue, 10 Mar 2026 01:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107877; cv=fail; b=Z16Y50RbrdtqlwnOyHQYkidHqhlAehCP5mCCD+/C6dWK7lgH6Dx0RjQZNjka9HyeB13S+IpIU4cUNypUaQSi60g8VsZNrUPsTbaTr6H5xmOqFew2VdSv6IiAYdSRjZ45EUSBOyme4bmehN2y3/CnDNbJDN7592+t3KW/8olT3jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107877; c=relaxed/simple;
	bh=G5PrtrTct6cgOpOws7I2vIqRZhy/2ygKvOXWec9q0so=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FB8Hf5y3DfVvK4FEpK970AzBUwlAIoMMu94ATh6Rf440CljrrjHKWNThsmqyZISxrx0GBYAhRJalx9rdtQxXRgBKuOnwSs0Mmeby46/9d7ttpGqVjOi+gHjiVdwmpwHmtx8Qx9dUXUJJPPaZO76gjzp5gHSaItldP1LYs8CbYfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PGmNgSGO; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PGmNgSGO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LStsbD5z/qOx+p4dyimtlAywNPeUHfoB7gcgLaIZG7OCr/0Zw6twogra//NGa1Uo4KaPgb5QP30/LqHXswc03vVLGzSW5z9m1z19f1cRET5ToSnUFJxtz1gH7vVo2jDVK1EowFpYlaC08zRF423Yg0YV9qkdWflzOaPsz09v2lYj16xSkYHgqvxmnU3SL868IlHhyKozMjUrzW2RRBRi+baMp6lCTRKpfU3ZonkbrSL54VMEW+Xq7ikhegHw5dQkSxNPxt84UhmAljs9K55RtVG3VAhT43v8XD3MWzeyU7urV+b9PiVFmOcSf8jUx8RpT8X4z2coifBQMKivZNdOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzzhXYzZMMRnD/HTE9pYysHt8dFKXYLv42KXCjpZdE0=;
 b=r5mwcz3yD6LdbGpogDrjqyzL9rYxEVYnghPZ5TdsSFW3iazDaU4EhGhBpOStrlY2EeTLmnpyMUvEJ/IxP/LVYKRa3a1gKBqpttGpjF+QWA5d/FcFmhHFL6B1+DYnyB2c96vz0z8miV9XPqJE1Gn96TM6oPam9forC+dzA53TtRePFdrJEfZ+5AE/Vc3ePu9xqEHln3SBZ6WdevqE9OwG2ChhEwGKaSjcS0hN/fsNhF+bs0HcXzMYNkIRCTN5LlRhf/EYKY0tdDgqCFQ13t+yWJkQ8fCcrLv1sI2j/jyV3dwsCMaCJ2LchhQ+MnZ2utgxGsYSHL+G5Ym26LNli4SdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzzhXYzZMMRnD/HTE9pYysHt8dFKXYLv42KXCjpZdE0=;
 b=PGmNgSGOsPYBTOUc4F/GOxxkAMzOehfHFzl/GaFYIMAyVmKjdPpcSUD8LpItOMBRGpE0Qqjb140kVUxOIUydrxvGp0iEOlGr/X00OTcJHrgL6/reEdhsxbzIa38cS3jNIq6/Kb2glKhEdcl0BXWIQHe1QnqDQhU0il/ezB30YxPepoifL/ROidSSXCeZTdELFXlGHWkaaA03kChlLlDjgcBc8vhpcYSBNWXOFhrCVKWSYeUTouk4EIiunDjdwScurG/JcfyTdM+Ui8ITvaoutLGuDkqAJMFEY5suxJhkhq6gUesUijitS93jL8Ln65RvemavtZvDGj8Asowd85kloA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Tue, 10 Mar
 2026 01:57:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 01:57:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 10:57:41 +0900
Message-Id: <DGYQA2AH0NDH.2VNSFLDEJGXYT@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-6-424f80dd43bc@nvidia.com>
 <DGYCWW4AUI1Y.29UXVO4XOFCOA@garyguo.net>
In-Reply-To: <DGYCWW4AUI1Y.29UXVO4XOFCOA@garyguo.net>
X-ClientProxiedBy: TY4P286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e30ae00-11a1-4bef-d396-08de7e486bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	8WXzPWkzGlqryIvGy9QEgOHKYhn9l3WGVfFSFucAtgcIIXo4HFLg/wWc2FbKWFbsl+oB384enDKpj8b81Cj7C+5GDC2BB8O3CTm6r9wlJiL7qUoYolxvdNX39sFbcKrpfeaq5U+XSkGNVPVqd+9Y9wzeLmXqjXZfnqwregLLBdMdiKf98aEvKkm6cs1LNaiRqhAQMiL7GiEtsa+Z3/x0dMxc8BU1xDihLCAlNeVLyZ/Kin5KO/BjfY9jbXqcj70HzKKe9YAmigFh0cWeVsfSVaCd4N3y9SQLlVd8/tGLmh/2sUec8Lq4jY4SO6WiUncejtl/ekZ2u/NDMcDmuETMj3gPA+SoXLxgLg+8AVVXfzAetJyMP9l9/h/HOTVMweWclIIsOJpiZI0JV2CI23neo+1RQ7ZSvj0uPntUEOBThW89Q7cn1SCVowI6fS+0nNjna8/W1wYOsw4Td7sa9OzVT3hcP4jn/CGhn09Ngmf7nnNnm//OpfjeBcUnWVGrq6Ga0Qmht1ikP7kPDSDCi+IxVkaE2/uA+l2cti3OKETZQecxH7oV9S6k3g2m1fKUnbQjAFe0tLw1uqDzsk2pTSd2V9tfhmEh6x3YUBtH4akfgR+wwq4K7bhzusTFz8ttYgM1ivDXFGoTj4Rd67hoQgXzVeDsUyJ9zbbKGyyBH+wNK9zWBQZ+zR4dGl+nTY+ny6WwXPROFUiuXrLqOvT9rIUO9KEkPhJQXOmXy/N5EdqaqxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWZJYjU3eVRyNlJuWFpnSXUxaG9lOGlrRjF1QVgrUTRmUjg0TTVDYzBlMU9R?=
 =?utf-8?B?VEdvekJmSnhqeWZyRS9ST0xQTXdmTDRGMDJrNjh1UEt6bXNyVU0wQkdkZEtj?=
 =?utf-8?B?QmVTOFdFZXl3MWE4YzRPbHN5MUYxditTazJ4Yko3VU5iWlowYjB3THBweWZN?=
 =?utf-8?B?YTU4a1ZSQzlrZWIyL0R4NEVWNFlQK1VPekxqU1RXd0NPMkZGMVdBVy9Tamd1?=
 =?utf-8?B?eDZpbTR0WHBhaDRzbjZwb3Urd25ibEEwWGVza2twNTFzcXFFY0NuOFUrVVQ0?=
 =?utf-8?B?NDFmZ3Voa3UvRUE0RC9ESXlPNXVWYjNtRTlXeXlaYlJCTHYvejE3Mjdnb3ZU?=
 =?utf-8?B?NGlCTnRPc01maFM0akdYOUZvdC9SM1dFZ2xWd014NFprUEEwOEtHZjl3VS9q?=
 =?utf-8?B?YnlVZ1Q3aDZRK2t6WUs0WHBaaG9lMmhXL1hGbjRLaEhuNW1xVWUyWTFNOG1u?=
 =?utf-8?B?YVk3bU92Umo4MVY1SmtSTVlQMVJFWlhCM0wzK085MzZpKzNhSmlic21lZ3Nt?=
 =?utf-8?B?cGtUMVZ5UGN3b2RWSmdLSUtMaW5VM3FyMTViY0RzaEt3WFgyZmp2akRUeVg5?=
 =?utf-8?B?YXN0emVPWDBPYlV0ZWZHVFZ4UGFjT0ZIeGxTbHRhVCt6VzhGRDk0WU15Smlo?=
 =?utf-8?B?S0lZSjhaYUxTa2h5QVF2R2E5aDJFRDJtQW9GcnJCeVMzcGFoRmNkT0VwQ2Zm?=
 =?utf-8?B?aVRleHlmbkpZTldKbzhtVjUrdWVPdHhpekh3RUpwZitrejRRZjN3UUFMNE9k?=
 =?utf-8?B?cjkrV0hlMzVrUVdtWklIcVZIZ0J6OThsOThPSWZhSXlWZTZOcjdTTW9GN2tu?=
 =?utf-8?B?S09RN3FWdEVsQW9kaGg2TFhIY2VHWUE3SGxwekRmQ0pydFUzaHBkcE54VDlx?=
 =?utf-8?B?UW9VOXlCTkhTS1NTRXNUc3phNVVKdlZuS3JEaDRtVnd0RDZpOFBUQXpuellW?=
 =?utf-8?B?MGNUYUxWWUc3dGdWd1NjYjh4S25RMDlxM2I5VlNhaC8rS3BNQTVSYWh0OENk?=
 =?utf-8?B?dy9lc1cyZWhVc0IvbmwrbHhOMksvSVR6Zk1idkUycjg4NU5EZGtGWkg1cFow?=
 =?utf-8?B?S2RIUUZvaTVIMXVIeEwrTnRjbHp0QjJrUHpRU1dqMmZuR3BxQ0J3MWd2VUFr?=
 =?utf-8?B?eUh2ejNQYW9yNmFCaHNHclhpak94b0xVQzhxcVY1SitPYjlmalI0OHBOSFNm?=
 =?utf-8?B?cUlZVUVQRHA2bVRoZDJqTUtDSGptM1l2MDJ2VEc1aE0zSGtUZzQ2cldlYVpF?=
 =?utf-8?B?b0o0ekNxd3NwUUpGYUthaVlEU0tBbVl1WU5WWmJseTBxRUE5aFNTSWJFTTNE?=
 =?utf-8?B?b3E2aElRbStoRGVZaHJJM1FkOE5XYTlmakdRWXpRenBEUGlBdVJOS1dsL1h2?=
 =?utf-8?B?U0tZak82bjBxVStEeTJvNXc0c3dQWUgwQVFpSitxZnNadFVDeGxYQ2NKdWlz?=
 =?utf-8?B?eXlZQUs1RzhUckw2dW4zK3E5WDA0RWJrZnB6YXl5VlhmOUhTTE93RWJUMkhm?=
 =?utf-8?B?dGlDNDRhZUlVTkZsTk9BOG53bmpDdXhRREJhR1A1di9LbFk3dXRERDBhQTlo?=
 =?utf-8?B?cThsYldYTG1BQW1vd2drNEdjaE55S2VFNHlYelhDYlFNbUxNSlVXYnEvdERX?=
 =?utf-8?B?QkxUd1RWaUpvOGhLek9UMVA5NXdTRjVsSDNLVU1KRkR0VEVpSU9ZK3hjSHMr?=
 =?utf-8?B?ZEM4NXRQV0FDemNNMzVOTk1STTdQcEZPN2dSV0d4Rjl0QmlaS2YxTFYyWm0r?=
 =?utf-8?B?WnhKSFBLU2prbnQ0QUlKL01XQ0h2N1Q4c3lQdE9NcDErN1lHTk5YTk9MaHVx?=
 =?utf-8?B?dmJEOW90aW1JODY0cVFHbnlLNitkWWkwVDdJOGJWVUVoMTIrNFlhS0QyOWsv?=
 =?utf-8?B?c0luMCtrTWppWE9SY3ZvYjVsMkMycCtqSk1qYmZoQWNUdW16blBxRzdub1RZ?=
 =?utf-8?B?UHVPUTI0NHpvOVdqWmRidis1c3k1OFRFSnI5RkZqVVA4Nk9xdnhYL3Q0UUdK?=
 =?utf-8?B?VDdKcWZYL2NoUFVhZzY1WkZ4a21ZTC9XeFJ0UUN0RG1SNFIvck5nT2ZnR2Fr?=
 =?utf-8?B?TG55YnVJU3JHaUw4VWhTQTUycXpBUTFDd0s3SllzM3BMektUZmZUT28vNW82?=
 =?utf-8?B?TXQ3YzlicllKTzR1STJzT1Q0QkQ5UXg2cU5ydlcyR2RPcG5GN2NjbmJTbG00?=
 =?utf-8?B?NVlRWld3NUxxeGpLenJ0NmRrek5leDB1eENKVHRNZVRxR3BVcGYvUlBnZ0hB?=
 =?utf-8?B?UjYwdnpOYnNpMGRjaU9VNmduNy9jRUc0RkIrVmtRMVB1akoxdUVtcWpFcmE5?=
 =?utf-8?B?c0tBT1pDbmxNSTNTQWMxYXZSaDNudmFxK01PMWFxRWNpUzlNWTJRS0hIVGpH?=
 =?utf-8?Q?e60OCGT1nAvgQO6P+lRHUn+dPuC7RvgpfSSQC/JQGKdS4?=
X-MS-Exchange-AntiSpam-MessageData-1: yPevkqeXe8WFEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e30ae00-11a1-4bef-d396-08de7e486bc2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:57:44.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxF2t0E8ukxVghzzJz4R9LlENXyV3vx/0VQRNYHRH+cRfqgdQYiPzDBxUqmkUe9gkYLSC9ON4t9uISYIWuNngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536

On Tue Mar 10, 2026 at 12:29 AM JST, Gary Guo wrote:
> On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
>> By providing the required `IoLoc` implementations on `usize`, we can
>> leverage the generic accessors and reduce the number of unsafe blocks in
>> the module.
>>
>> This also allows us to directly call the generic `read/write/update`
>> methods with primitive types, so add examples illustrating this.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs | 199 +++++++++++++++++++++++++++++++++++------------=
-------
>>  1 file changed, 131 insertions(+), 68 deletions(-)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index 1db6572f4a42..ed6fab001a39 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -197,6 +197,25 @@ pub trait IoLoc<T> {
>>      fn offset(&self) -> usize;
>>  }
>> =20
>> +/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` as=
 a parameter of
>> +/// [`Io::read`] and [`Io::write`].
>> +macro_rules! impl_usize_ioloc {
>> +    ($($ty:ty),*) =3D> {
>> +        $(
>> +            impl IoLoc<$ty> for usize {
>> +                type IoType =3D $ty;
>> +
>
> #[inline(always)]
>
> the fact that this is a pointer is somewhat uneasy to me. I wonder if Cli=
ppy
> with its inlining tweak would cause optimisation failure here.
>
> Could this be just `fn offset(self)`?

Yes, this was a remnant from a previous design where I needed to either
make `IoLoc` require `Copy` or use a reference here, so I opted for the
latter.

With the current code though we are using `IoLoc`s exactly one time, so
we can consume `self` without requiring `Copy`.
