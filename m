Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27A49CF59;
	Mon, 12 Oct 2026 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819299; cv=fail; b=R2tnKsNitPLNdJkhpi35LRJS0OnkLpVlwL+hq5gcap1z2fBFBx57lqgxsA54tN+PCnKUar0U4SlgxahgbXAOg6MUDjOoteNQbAQ3h2lU9ru0v78hO4YTeFVElaUiCOkIzSFHNPb7c2qhb9c+81humJyGwzSbJYGpxcGTvceg+Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819299; c=relaxed/simple;
	bh=mynVtnn4/9yu5bGItBuRbmg1Q3Q3AhK1ywq6+RPDK/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lKNeTVNtS8B6x2oP7wmYUW9pFoKvKhyas0a26oiNhkd89RFeer4wjvXvuVkIID1KGXQJuq04MvveC4AWq2Mw//7wFXptvuN1dQsq8xxgrnmbaQDw9LtmGFNWw2mASkdbc8fGut7MobwyTm/P/iKJhYPWxxdxlKXEpKuaQj6i6PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ihoLRzDt; arc=fail smtp.client-ip=40.93.195.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ihoLRzDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFFIer9rur146Xq3wmhQ5E+vQ5OVzGB/F49GaP8gYIwe3174TcQt2k77ogUKgtMv24/VFf8ydwpw6Ev784GSmORU/rlaVSLaWbRHAImQ2LwHDI5ODpL8yWv+7SfHO8w5HWzNIouUFkMICZYDzCTNo9tcT49fRuE9JVWFDzW06c2jwx/bjzcpxMx0TbX4tYwVABd3hvoGJ7QR7Ykvy+ug87AiVwjVP9teS+tH1gvgo1Jlo8lP+65BMxikSqMTFD5pKbYtR1a1bbrnTyrwxt/rh2LbKW/jX7Zy3Gl9R6ULyVDY+urWHWcYRy2XZLoCGi3gBZp46LA19/mRe3lub7me9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uocpTPN4dBh/T6qWMcfXOD8Gt/9OPAr+Sfip+ANP/0w=;
 b=GheFtnpNbliRMh54M0oggHF47MrPlHlS7hX1085d28lORvaVA8ktZMOubB3KQHhYLof5MkBTlsyzLV7hfYg53Ophf5APerBb4MUd2efl7AXnkimnFS4QaHnJND9APBKJq477novbeMGUn9cU6EaVST0zjJaUjwG2jZccgakrS43YkvXBBa5IF5+YxkPTL56HQcABllz1VywaTGsvZaipwWGZHB0fDO32nByGXE5hpz5a84aloJiYuzUMWjB5KCVtAnjwq7bls8eXzQiyTzvHTpcsnvMEHYzLTBGJSJ1WzrEoIopEOOYImjVuzn0NCasxVjgEPyQEXcxVcX+st8xsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uocpTPN4dBh/T6qWMcfXOD8Gt/9OPAr+Sfip+ANP/0w=;
 b=ihoLRzDt7koWvzEg04zKHiPrNVYH8doL80zvcI68Ar1Ft9ie8GkoXxqit4x1hAysXbPoGntHnHJHUsTXtWqLSBvPR/IU52rmWwUHmIePewAAXvgAVqZu9ZgtTNq1o/+y3CWBiWK7BwT5Fm7e5XCgLPw7yHy61DQBgojjN5X8pWXfxhWWcv7PVrRLvKhUwSPHNsSfnkGFmKOX1g9/3Sziz25nsOb9dL1FiGZLNrrgY7zqbo0+tODOEn/0pQ2PRVNFkWr3qyj4K4TCoXhmJulY0pdHJmR8zBNDdrg1UzJr9HOIWnoMmykZlxzSu1LMAJYjP6ujwIfXSlKgX4iCDjFMIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 15:34:52 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 15:34:51 +0000
Date: Mon, 12 Oct 2026 11:34:50 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Burak Emir <burak.emir@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C
 function
Message-ID: <asz-GkGHJYHdhDLr@yury>
References: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
 <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0922.namprd03.prod.outlook.com
 (2603:10b6:408:107::27) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e53e804-95ca-4993-158d-08df28765b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|23010399003|366016|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cyU4k0X9ztvtNLTwyY9CDgxITjoOmt6/45fuSoo+NvwRmA0CPEvUv7dmhGNWbzJFKxp1oIwiEySVFACYE+gpdcPOF+uWkLtqE2gX3gY5nLgXfhHl6yKNJ8t9SZ1PDztJpax6b6AoIjhsz0iJKjcm0gHkCcDgCW/ck45COL++FTKo1b7xioEz+0BEcVuW8VlFB0RefRrpoAxQgynLqY0dGXsqTzOdsUYim1p1Mj317GNMeeBHDbQDvI9XLDngj7lSSONFSFKyq2oE1UE2miL9rmMCEmqwiglayRkHkjD5GBEkbFDL6r72y3Zf1ZmjL7/5SGhMpMF2W9t8BZuhLQvOPLCHn70Wddz9TzakS3Fw8v6ixzzWqwYqW2JMZY6BxzXKhmW8eg0lH/PSgaVYQMGLIcraDkW4g3hoEH2T91spaX+ri83WOB4sFUUH3/3g7+JfJyayiuU1jJ7GjUOoXXuL2cEUnAcCXyullBl4uBql9L251TkCaGJNSm4zyK8xbP555DrGFZoRdfcZrsrzBkVy1/m6+Lx8vBRj/x7ztXr7kI4YQkwKVldXDdYDH9BbyeZJ8eBrvgWDei9E8viwt7bS2XTTJgaT3prBzr1LfsAqNVJeT551wEyUmuNvS1KX6Nv12lB1cAWiIKXrD41eNxL6gcdwXBXQ1AIn/7UapYpX9b0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2xPdkE2NDl3UUFvTC96cmZxTW9EYjQwSjRYOWxBUTJnclZxQnRFTVJlWDhF?=
 =?utf-8?B?RFFhazZST0JNd3czRXA4bmFVRXg5RDNxUFNoQUVzZmpzQTlVdFp2MUQzSHh3?=
 =?utf-8?B?L3ZWeFEzeit3SlU1bS9hMnE3RXlSUUloSXBaTGlWbVcvUndua1FiOFNVa2xo?=
 =?utf-8?B?aGJPVTBhSCtONklKcmhMZVRXbnpzSUVLbCtXUEhhUmFUSStRMTZacjl2T2RH?=
 =?utf-8?B?NTF4OVk1ZmhUOEU3djZUUithK2o2Y1Z4d0NtaGlBanVZbCttbnRWVmowRkpy?=
 =?utf-8?B?WTlibHZPMng2cGlVcVBacG50aEFxejhqVjBVQUJjNmMyTHNaemRZRTZYdk1W?=
 =?utf-8?B?bUxMc1JpVk9pVkFLK1BjS1NQSmVZM09xV1ZyNGxMelYrQUVmbzFJWjB1RE9v?=
 =?utf-8?B?bDBmcldZandSNHJEMytXSXFXVlp3V25Cdk1ITWZaK0I0VUx0b1N4SUVLbit1?=
 =?utf-8?B?QWcrWjNMVk1UTE5RaHp1NG4wUEFXQU4vcWxhTmNiTkRBUFQzeFBNOG0zR28x?=
 =?utf-8?B?b1BzaWtMem42KzdvOVVmM0xVek9TYnpaT1lMdm1QMEt3NER6S1hoNTVwaEFR?=
 =?utf-8?B?Sk5ZNXRsckRjc3djTlpqbUhJcCsyZ1hwWEtyUXdRUnNYc1h4cEhwdG94NEdW?=
 =?utf-8?B?T3JCU2d0NTBlRlZBY3U3S01UaXhzbnZTR2lDNHV5N0pFWVpLMWF1SG9iZ2p6?=
 =?utf-8?B?OU9La0tsMkJXSDJ6K1c3OWsxMnFPd3hGcHBtVkpoV3AyalFPMUF0eFNVeG1M?=
 =?utf-8?B?bnp3Qm1FOGFmTTM0TUlsOVJGdE94cGNiT1JEZVRBWm5FQ1ZjbHhSUEJOWXRz?=
 =?utf-8?B?YW5ReEdqZnlvc1VQalRJcnlnQWppL0NEMXI4WElidDYwTW84dDN4dC9Zd2Jj?=
 =?utf-8?B?aitITXRscC9JaTlGd203ZzcraE1yVUIrT2o4bktlWXIyT0NwYTJxRmZDWVdS?=
 =?utf-8?B?ZVJ0QlB3a00xWUIwYTBkL0lRV1k5Ym1UVThVL3F5Z3RkVExCK1BBWWZmSm5r?=
 =?utf-8?B?UkhIYittSGh6MklFbURxQnVPY0RhU1RBN1MxWE9rQVBFQWd1N0l2amVPWDNw?=
 =?utf-8?B?T0NFYlo0K3JRaFVzYTNhdG5KNkpVaGVuRStqQzlHREEyNXdVd0o2anUzbDBZ?=
 =?utf-8?B?cVhVWTN1Rm5aVWFVS1ZRbEQvM1AwcWdxUm4wdVZ6M0RVRW1pZmd0cjFYRkRR?=
 =?utf-8?B?cTRqR0laNGRvbUZUcTZKbUpFN2JsY2s5dnRkQWIzenltTWQ2bktibm9wMjBV?=
 =?utf-8?B?VTVDYmZVeUdyWndMSG0rRU14OXNueVd3SGtCdEJzYlArek9tVCtNUzF4VG9D?=
 =?utf-8?B?OElxbjVyOEoySjFNb1RReENOaEtWdWQwVENOSlRTUzRkc0tYRXJBSUo4NWEx?=
 =?utf-8?B?RVNZeDQyQ0EvM09ORGZtRU5FWmNRYWJwbVBsRnJIRkNJMFVDS1VDYy9qc0Fh?=
 =?utf-8?B?L21xWE4zYmVDeGdYMXpFeENxbUUvOG9DdmpVMmlvSk9HVFJva1ZYWkZQN2pw?=
 =?utf-8?B?c3lsYXh6RC9lb0VpKzhjTFFFMmJncjNDdHV5VkcxNEQyQ0RScDc2dTlaZE4y?=
 =?utf-8?B?MW85aGhHeFRSM0tyWm8yTXVtdlc5WWp1K25nalVMN1prVDdDV21mRkozTlFX?=
 =?utf-8?B?eXpTU0lTZGFIRHRKYzREajdrdHNPYmxUZ0NCRDdEQmJIOStiUFVYcDBsWE1N?=
 =?utf-8?B?Z2JnQzduWktuU0xqdGIzSmpCTTR2Z1ZNeSs4b3ZJbXJoMjFWZVc5b2pacXZW?=
 =?utf-8?B?Y09aazZNcDNrY1FrY1NTVk5tZDVpbEJoYkltYjJCQUpVd3JDL292ZytjMUNT?=
 =?utf-8?B?Tm9NaStNMVI1NjNLRWlVMjlza2tYL3RMWE9RaWlxTnVXMUZzMGpOc3U4MjlK?=
 =?utf-8?B?NldCT1N6cFRsS2NMd3lyWVhwZnNJZjFDREFMTXpUUkxTN3RjOVRDcnZGc3Fo?=
 =?utf-8?B?RHUyOTRXT2NqbUx4cUxBNHBLUGxvMGNFeXBDSk10RWRENEZuR0lVM1l2NWlq?=
 =?utf-8?B?TUhvMGhwOWR2SS90eUpYTkpTcU40NTZhNG9jZmY1Y0VCTnpZN3FQUzBsdG16?=
 =?utf-8?B?VWtMNWxXOXFXOHFTTVQ1aG1MQ3Y2eVIvWWR1M21JZmFOWWR5ZWtZWlFUN1R2?=
 =?utf-8?B?WDA2b0QyU2wzL0dPdmRQUkNZeWtxRER4b1dXWC9KL0pLellsSVBoc3NjbGFk?=
 =?utf-8?B?MlE0dFMxZ1FVMzhST0JTQWg5SVliQnc4RFhWL1JXRmR1Z2gwbU5kUWl3aFpn?=
 =?utf-8?B?d0FCd0QxbWRmbnpsazcyQUFmUGdLODUxYWpiemprQ20wTnNmV0NocFJ0SWQw?=
 =?utf-8?B?S0RyOGkyOU1lYjlzaUlKYlFVWEhVOUlEcVpIUW9XaUpxTFB5VmpMcjREaGxL?=
 =?utf-8?Q?uPO8dGrYwy0ASycwTls3FiotzDDrNNsDB0qYy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e53e804-95ca-4993-158d-08df28765b6a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:34:51.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLB7CmaheNLXODRTS1lYTiTLn39daM30Zu2g3HJGQYe8aqg1IWbtkAAK4K51kMR7GABlnn1Vq7sij+APZPyzTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

On Fri, Oct 02, 2026 at 11:07:00AM +0200, Miguel Ojeda wrote:
> On Fri, Oct 2, 2026 at 10:33 AM Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >
> > I don't think we need to split the helper C files by the headers they
> > are defined in. We can include multiple headers in a C file that
> > logically lumps things together. If you are worried about finding things
> > becoming difficult because they are not in the file one expect, I do not
> > share the concern. I usually just grep in the directory through my
> > editor.
> 
> Of course, it doesn't need to be a strict split. But, where possible,
> I think it is better to match the C side for the helpers, because they
> are thin wrappers that need to be updated and maintained at the same
> time as the C side.

Yes, that's correct. This should mirror the kernel file structure
unless there's a strong reason to change that.

Andreas, can you put this into rust/helpers/cpumask.c, and please have
the __rust helper thing on a separate line for better greppability.

This patch creates a new file without a maintenance entry, which is a
no-go anyways, so we need v4.
 
> In any case, I mentioned it especially because `cpumask.h` already
> exists and because it avoids an extra `#include` as I mentioned.
> 
> > I don't think we need that kind of granularity at the moment. If things
> > become messy, we can just refactor.
> 
> Just in case: `cpumask.rs` already exists, i.e. we are not adding new
> granularity (or what do you mean by "at the moment" otherwise?)
> 
> Cheers,
> Miguel
