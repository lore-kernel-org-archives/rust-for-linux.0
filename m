Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021099.outbound.protection.outlook.com [52.101.95.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FA4DB57D;
	Thu,  3 Sep 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448926; cv=fail; b=at33WUNmbFmQet88imdLVoOGDplGXfnXTSoRqCzkMGjgHo/wnUuge3qPtZ80jpz/XKX+ktainONGFT1vICv3RJ99MHLtmw6AflOM+9rZ8HPn0lsNr24Bm6J3DuHBDJDEs0eaf0rHt6QZvaO/xDn9LhsoJRF7ETpwD+umJQQduyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448926; c=relaxed/simple;
	bh=ld88+TwEzz6ifrptJbLdLm+gCvGBdOfcOKGiUojmDVg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Gz4KYyGnvLeKAcettdDP5GqEHDRQ8wvYTeyjBYjTzVykVb3aaQVD4C9Yt7UwAnAUMpEmpgd3GMvpJqxTiQN+lbBVrbXONh+VFQjxWPXXBtRTrUyIUtAuPg8tIu/Q2XRVZdjKR8EkBhTAVlDbbbwWaGij+y/oLB+FIGfmxP4izN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eNt5OpR5; arc=fail smtp.client-ip=52.101.95.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eNt5OpR5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al7XEnJjxtY4EsOOYJQ6rO3PYyTTmfwLjgCgBmPfyRJScQ/nT2+1xuB2VVa8UpL+p5uIwGPQ6f4Py6fNar08soOzR1C4ApnzlhOMgmDOf7+GZgfkb3IiHw0KlKSZgj+rnvnL1I7WbRYSmOoFtev4EUMeXkcPGcJUambyS6yvZ+ZHv3lTsPSyZ6iFHRLuYFfzYUNIrn9q6RR3BhECv/g9KEAxKeo4TsQq6/SIigRFC/0K2eIJ/pk/Q/iy0LgmXsFghozsFtv1a/3xxUHRcO3qCoG9pWwHDzuVwjyMqgu7mLgM+wYo40+RUO0ykkxWnov1A2A9047lMvb14cynaePY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEeAo9V8mMUe682uUKY9CKyUoIiqcDQxjgJ5pvO5T8Q=;
 b=Ay05MYOgq0646KGxr9YRdwkd8TOj6eHil2JxQVXVQvpnO7C2omuc0iAMxgARrFqDP+mgoKiUYrvu5UEkX4lHKjsJHcjaP2LuNeAgOYPOxbDuSv8h3m75e9OHp9cwOmk+tDd5sP5BuhR5A+A/SQvqY5qDqQrha+GVt0I3jRBc9pwbIxuQ5wttSGcS/18osjumC6gUGobs08oylTQ6mwG26fKN0oU2atBEP2jh8DBmCAIPCw/8EsMldFKSEauQU1lehq+l4NJfB9/USMOruTjSh/AcHWzT5zvvhEN7/kD6dtY7HYk0kVvV9bvFbtIncamVRURwWc4RY7QwF3HFwMJsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEeAo9V8mMUe682uUKY9CKyUoIiqcDQxjgJ5pvO5T8Q=;
 b=eNt5OpR55iZPKVDhlcwiiir2mXSpLizgPVzE9MjtFJIITTxSTZi97d0WniOpxHizox23mcl8K6GVAq5rORiEkfbe4tNcl2exGPEV/fci2CjnnY8GLE8Jb4N3TIhmSpXpvGwYzlfrptu86chKcGcL+qAe+fQ0lHp5bvnx5GJhj/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2223.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:21:56 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:21:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 03 Sep 2026 16:21:46 +0100
Subject: [PATCH v2 3/3] rust: str: convert `as_char_ptr` to work with
 `const_call!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-cv-v2-3-e93b1613e40c@garyguo.net>
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
In-Reply-To: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
To: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788448914; l=8213;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ld88+TwEzz6ifrptJbLdLm+gCvGBdOfcOKGiUojmDVg=;
 b=O4aFFvwKiG1c87iLgoKW2O2106Tye/J5I1a6LB07OMVuNtVdEZr/G1EkFLeFdQ2/u8Pmk9Vg8
 PdnQ+PH7PoRBoT5K+9p8/417DggKPwcmAtNd+XYvBFCzL+rBW0HRS4d
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2223:EE_
X-MS-Office365-Filtering-Correlation-Id: ca15efcf-63d4-45f5-4b07-08df09cf1723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|23010399003|366016|921020|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nr4VR529miLAyUrUo5l1XXfWK9HEx1X4U9EsahcA5thqfHOfAfHkK+kFZ/jb2MsjtWDurddJWJm2cV/5sgmJYz676iXi77aQWDeo7OWiTFFN6Gfeq4k9t1k8ZTVAGhEpnJ2cj4HqAyXi41OQ6B5vpIBPXVorJ2omEFXmUiDhXs57s3H31XId2VVHFsacUCo0KFrVzR8F55kfHEMa8MKhr0HQ4WTRCvFQES+MqGQ8OeAL5olO01OKntBXVAQ6BnBfeiHHBv98lUHDT96u4YobpJU//7eGF7Ko6j2AM7LnBCcXUkHkP+GiQ+OUN8UiBb14JKIF5TYUtnFLnhVYX9gOTX28LXasrHv+2Ytl/JiiYddnkBrOlsn0fXVxw5rcZCu9R9XKMgZjgpZmnE/U+ZqBCDn+uaxYk8d/5iLg3e+gJmxZ4HzSQ5ezhsZDtI1j0D9LR08hO+hvjitRnOuopm8sp6d6TFl5Er2Egsjupk9ylo94K91io8fUZTHYHBJaIVwmwrl181LgxIiD6WFNPJRTy7ELylNsEu8T2hxLhoMHjraGt78Qgp1heNeXa5+XkLQ+36jT8kte4dwsrl5UZOIKwgJuY7lJPJ8L16t+7IhImkCjca+LJa3Kot/SQwaOTsMEbai9km0wQacZ2XSRnmGIWeH0GY7dKIee2EoD+LtkNz7PyiWSbpqbepMO3ZtdkJbPoS+SKag4qnD7twIjF20WRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(23010399003)(366016)(921020)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2tHaHF3YTB2TU51Vktra085MjBxVmhrZTUzUURXMnRTQUtqNGI1NWxIMWVD?=
 =?utf-8?B?eWUrS1pHZ1JUdWlHN2dBdDd0WEFIeGlwL0E4MHhnZFQzSmRFKytXNmNvM0or?=
 =?utf-8?B?dG96c29VejhWWTkvM2FYUEplcXh3d0wzL2V1WWNhTHZFanlRcnBwczlDVEp1?=
 =?utf-8?B?L3lSL1RmcmU3aXRVMFVjQU13TXp0N0s3bWk2RENIdUZRV29hTHJCSlgwclRh?=
 =?utf-8?B?NEVHcndpUnBBTEF2Y3gwQzdGRzZQS2xkV0xYYUN6VCt3dlJ6UFV5ZlJ5OVB3?=
 =?utf-8?B?YjI4R2Z2YzQxS2tPRFJGRGJ0bVZIVlV2a2pkRmZoOHdySG1SMStOTWRqOVN3?=
 =?utf-8?B?VjNtYnlSVm9YOElKakladWRvVWhSdVpqN2k4cHBNQUpvcnpFbk1IR09qTmZp?=
 =?utf-8?B?UjIwZHY2NkcwdzdRdFVDL2EzaTBRTE8xWWt4OW5ocG9TcUg1YjFHZS9BVUU1?=
 =?utf-8?B?aCtiMmFwNDc5bG5JdDBONGxMMUVROGZGVFkraGJJVnBKMTFqZFJKYnNDUkly?=
 =?utf-8?B?RjZsNG8xRkx6VlhSNFlabjhrV0E3MWJxZW5NQkFzN2EzMUVYekJpUm92VEdm?=
 =?utf-8?B?cnVDS1RzdXFQTlN1NWZ2SDFMQStncDRobk5nZWtDbnc3WUE0WmVwQUJrVWVr?=
 =?utf-8?B?MkR6TThKOVR0RmZScnYrMEJmbUM1SDdrVGp1TGJjdHFyK08vZW1JYk5TNzJX?=
 =?utf-8?B?MEg5aDhPTHg2MEU1dnJSeUJwMHBENzNMeFF4djVmcWJUaTBuZjdDRzlmZ1I1?=
 =?utf-8?B?MFVseTVST1RkWUM4S2U4S1JCZWNVV2t3aEw0TzFuYm5Zc0dyTXpkRGtHZ3NW?=
 =?utf-8?B?WmFNVTN3Y1lVTi82QURTN3I3bkYvR1Jab0V6WFd5Tk80cTNJR0RlWkZXVzU0?=
 =?utf-8?B?R1I0QVpUbmNlbkVOVzNjVm1kZlFiMzh1UXB0dEJISVhOMWpRdzFKQTJ3elp1?=
 =?utf-8?B?ajZNV1Q5VENTZWxQZ0JZZTZ0TGs4c0xKaFlpYnllSTRWT0ZmNkRRN1MyVjhD?=
 =?utf-8?B?L1g0QjFtS2RtQWtSSE8yQ3R6d2dqU1B1ZFJLODk1K2wxcUxnSG53VmxCcXp2?=
 =?utf-8?B?d1Nib3hIcndYbjZpQm1HUXB5SG9DbC92YjZDTi9Yei9uVUxYa1FyZGl1M0xG?=
 =?utf-8?B?Y3JDcVhLYTZabGdjRlpieHdoQUppRnRUM1hXejZma3BvNHVLS3JWY3BjSExP?=
 =?utf-8?B?QzAyYSszcW9OWUs1TkR1L0NIc215b0thWkZ5bTFVY1NUTUc2ZGVJNG9kWTBH?=
 =?utf-8?B?YjkvRmFYN1M0WUQ1eUtzMkRuc2d3UmQvVWNCdXhyS0l1WW16OHp6QldhbVVp?=
 =?utf-8?B?SzhpbTczejBMTjFlOEdoMkg3ck51OEYwQU5SblQvOVF1Sk53UnBZTGRvZVJq?=
 =?utf-8?B?MWpZRU40eFFYbEJVM0RNaDNoR3B4MmdpZ09QeDRLL3RVMDhJU1R6TFJwbE9o?=
 =?utf-8?B?MEFkOVpzOE5IcU9pckFaYlhhUWpiVE0zUXRmdmJtUXV0Y3RJbmlwNjFmdXpV?=
 =?utf-8?B?MzByNFBWNVBrS1Q1S2ZIS1FScmJvL1AyazF4U3ZxSGExaEJHelUzc3RpZHpI?=
 =?utf-8?B?V2xtc3V4bWpuWEFKaklsYTh1Yi9zOGl3RUkyTFRCbUt6dW0vZWN5bmw1c0o5?=
 =?utf-8?B?QTJhRFgydEpkSDJscmNkU3pTWlRpZnljNUhBSUhpS2Znelp6SnFIM1JHNDNk?=
 =?utf-8?B?WHUvNUZwY0ZodTRpUFhaNXJSenhTUVVPQUQ3TGNka08zTUFqOVRSdzlEMVRp?=
 =?utf-8?B?RzBydzFNTURaeFg4amRKbDVDcHNtOEZDOFRUWGRTVW8rd0ducWVxcytEQ1JE?=
 =?utf-8?B?RWVnQ0J6T2t5NkJRMk1pOXFkZ1VuVUY0YW9Ga2RDWmVrS2pLMDNYOEpIZ2lL?=
 =?utf-8?B?cFZTcmN6NzltdWdMNjd2aC95ZFNpWnNtMjM3OGpDYyttV0JndjJRdmVoLzRT?=
 =?utf-8?B?aEMxMWhyVHNDbmtjaGV1NmhQSVJYVjlCMVhqUHdMSHlYQVBUQXZSbzFFeVcw?=
 =?utf-8?B?UlI4SnVFa3djejEzeDViS2ZsNVUrWCs0WENGS3VxMkNHSC94R2gzdDA1WWFM?=
 =?utf-8?B?bjVEYmdDYUFIOTFldEpOZHlEUGJ4SDdqRks3dTdPcUhLYzVEWEpjcTNCYTNG?=
 =?utf-8?B?QWJObUFGTVY4Wlg5OG5oNGlMblhvYWc2Wkk5WmRwbWhRYmtGNmJidEhtR1Yy?=
 =?utf-8?B?c0FlK1RscG5CR2pIRnRhQ2RhMS9OQS9MczN4ZWY2Zk01bXFyU0lFV1VJYzBs?=
 =?utf-8?B?djVwbjJWZVlMWENwa3AxRXMyakZoZlZUMTJVSmlka2x6VGpnVURkdEJpVVlL?=
 =?utf-8?B?TW03eEFrWXJNZmkwWlhxeGdSYkpQdzdQSHJ2SmU5eGFJT1pnWis0Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ca15efcf-63d4-45f5-4b07-08df09cf1723
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:21:56.2140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwwWbXzxP9sTlqfU2UoYC/uAVpt62Q5mDD6v/MQhpCqVmfXvhHONSpACbh98oQqMBgGQysSgrDIMGWxFced89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2223

This allows `const_call!(foo.as_char_ptr())` to be used instead of
`kernel::str::as_char_ptr_in_const_context`.

`Const(foo).as_char_ptr()` is used directly in macros to avoid having to
import `CStrExt`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/configfs.rs   |  2 +-
 rust/kernel/drm/device.rs |  4 ++--
 rust/kernel/drm/ioctl.rs  |  4 ++--
 rust/kernel/kunit.rs      |  6 +++---
 rust/kernel/miscdevice.rs |  2 +-
 rust/kernel/net/phy.rs    |  2 +-
 rust/kernel/str.rs        | 15 +++++++--------
 rust/macros/lib.rs        |  9 +++++++++
 rust/macros/module.rs     |  4 ++--
 9 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index cd082b83e9e7..ece6cb31609f 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -612,7 +612,7 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
     pub const fn new(name: &'static CStr) -> Self {
         Self {
             attribute: Opaque::new(bindings::configfs_attribute {
-                ca_name: crate::str::as_char_ptr_in_const_context(name),
+                ca_name: const_call!(name.as_char_ptr()),
                 ca_owner: core::ptr::null_mut(),
                 ca_mode: 0o660,
                 show: Some(Self::show),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6b88ade28e24..536a0e958c8b 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -186,8 +186,8 @@ const fn compute_features() -> u32 {
         major: T::INFO.major,
         minor: T::INFO.minor,
         patchlevel: T::INFO.patchlevel,
-        name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
-        desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
+        name: const_call!(T::INFO.name.as_char_ptr()).cast_mut(),
+        desc: const_call!(T::INFO.desc.as_char_ptr()).cast_mut(),
 
         driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 64af9eacc306..5bba960504d6 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -206,9 +206,9 @@ macro_rules! declare_drm_ioctls {
                         Some($cmd)
                     },
                     flags: $flags,
-                    name: $crate::str::as_char_ptr_in_const_context(
+                    name: $crate::const_eval::Const(
                         $crate::c_str!(::core::stringify!($cmd)),
-                    ),
+                    ).as_char_ptr(),
                 }
             ),*];
             ioctls
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 91eaff8c186a..034df521b195 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -107,12 +107,12 @@ unsafe impl Sync for Location {}
             unsafe impl Sync for UnaryAssert {}
 
             static LOCATION: Location = Location($crate::bindings::kunit_loc {
-                file: $crate::str::as_char_ptr_in_const_context(FILE),
+                file: $crate::const_eval::Const(FILE).as_char_ptr(),
                 line: LINE,
             });
             static ASSERTION: UnaryAssert = UnaryAssert($crate::bindings::kunit_unary_assert {
                 assert: $crate::bindings::kunit_assert {},
-                condition: $crate::str::as_char_ptr_in_const_context(CONDITION),
+                condition: $crate::const_eval::Const(CONDITION).as_char_ptr(),
                 expected_true: true,
             });
 
@@ -204,7 +204,7 @@ pub const fn kunit_case(
 ) -> kernel::bindings::kunit_case {
     kernel::bindings::kunit_case {
         run_case: Some(run_case),
-        name: kernel::str::as_char_ptr_in_const_context(name),
+        name: const_call!(name.as_char_ptr()),
         attr: kernel::bindings::kunit_attributes {
             speed: kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
         },
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 8d4b719bd83f..02e115ec045d 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -46,7 +46,7 @@ impl MiscDeviceOptions {
     pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         let mut result: bindings::miscdevice = pin_init::zeroed();
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
-        result.name = crate::str::as_char_ptr_in_const_context(self.name);
+        result.name = const_call!(self.name.as_char_ptr());
         result.fops = MiscdeviceVTable::<T>::build();
         result
     }
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 956cda573ddb..28047fc3a876 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -494,7 +494,7 @@ unsafe impl Sync for DriverVTable {}
 pub const fn create_phy_driver<T: Driver>() -> DriverVTable {
     // INVARIANT: All the fields of `struct phy_driver` are initialized properly.
     DriverVTable(Opaque::new(bindings::phy_driver {
-        name: crate::str::as_char_ptr_in_const_context(T::NAME).cast_mut(),
+        name: const_call!(T::NAME.as_char_ptr()).cast_mut(),
         flags: T::FLAGS,
         phy_id: T::PHY_DEVICE_ID.id(),
         phy_id_mask: T::PHY_DEVICE_ID.mask_as_int(),
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b3caa9a1c898..93ae32b42e18 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -197,14 +197,13 @@ macro_rules! b_str {
     }};
 }
 
-/// Returns a C pointer to the string.
-// It is a free function rather than a method on an extension trait because:
-//
-// - error[E0379]: functions in trait impls cannot be declared const
-#[inline]
-#[expect(clippy::disallowed_methods, reason = "internal implementation")]
-pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_char {
-    c_str.as_ptr().cast()
+impl crate::const_eval::Const<&CStr> {
+    /// Returns a C pointer to the string.
+    #[inline]
+    #[expect(clippy::disallowed_methods, reason = "internal implementation")]
+    pub const fn as_char_ptr(self) -> *const c_char {
+        self.0.as_ptr().cast()
+    }
 }
 
 mod private {
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 262539cccf38..f5d8d0706e46 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -343,6 +343,15 @@ pub fn concat_idents(input: TokenStream) -> TokenStream {
 ///
 /// This is a polyfill for Rust's const trait impl feature. Only work for specific methods that have
 /// dedicated const implementation.
+///
+/// # Examples
+///
+/// ```
+/// const fn use_cstr(c: &CStr) {
+///     // This is an extension trait method that is not otherwise callable in const context.
+///     let char_ptr = const_call!((c).as_char_ptr());
+/// }
+/// ```
 #[proc_macro]
 pub fn const_call(input: TokenStream) -> TokenStream {
     const_eval::const_call(parse_macro_input!(input)).into()
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index bc7027f8dbb2..b2c1f118c7e1 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -149,13 +149,13 @@ fn emit_params(&mut self, info: &ModuleInfo) {
                         ::kernel::module_param::KernelParam =
                         ::kernel::module_param::KernelParam::new(
                             ::kernel::bindings::kernel_param {
-                                name: kernel::str::as_char_ptr_in_const_context(
+                                name: ::kernel::const_eval::Const(
                                     if ::core::cfg!(MODULE) {
                                         #param_name_cstr
                                     } else {
                                         #param_name_cstr_with_module
                                     }
-                                ),
+                                ).as_char_ptr(),
                                 // SAFETY: `__this_module` is constructed by the kernel at load
                                 // time and will not be freed until the module is unloaded.
                                 #[cfg(MODULE)]

-- 
2.54.0

