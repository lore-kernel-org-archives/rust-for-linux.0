Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243D3C73D9;
	Wed, 22 Apr 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851366; cv=none; b=KOlA0lmfGud3KM1V06uk3A1CCWgGjeikp8dkvnNDRs83URNQIFg2ciXTCA6QcxLSBK4zoEXSFAYy/MLi+NSYFWJmZjpkTj4vMn6JpPpFx1OFvdfNeJqvIB8DKUJjtebbRcu9w7Tbhlow5LUUPZk5GJ0UvJlUGl91FJPYbr90Cec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851366; c=relaxed/simple;
	bh=Ep6QIT5ucgr5upYbumWW0j4HwLVdmH1vYS1Pt6Gv6zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/tfWArZ+/RwyvB5UCYvbHonSF/DgWkVJ4mSecHi1un0ZzTQZS4vWo8o3+NVoanBN97kE3BxAH7D2m1ogfkjsGFmWzedRIM6gf8Plm9TybQ4c02JEXJKnQJexl6ZEClyuXELXDdZ5WmWND0LQsAwISQmOIo2pvZuGBE9TPLtXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=pC3qnr7Z; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="pC3qnr7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851364; x=1808387364;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=EOPrpwN477o2q/ReoM7iwVtzVbTQQD8orRUi6dSpuPw=;
  b=pC3qnr7ZS/LZoswbPDV10v61l3RfXWkG+TcrjReZ9OuZD69CgUAxl2Yj
   baMXbpEsY/KENKj8v0UG0FRKkJPhtUXBsi0ovnJDN42Q13L3SpqywnKbn
   mcr5lOc9R4ka96pixmkIshDWryQ/MHSA+EwLDHK9lfCdERXW1Xip1tfMe
   ZYQPHi1EpqkogwmfNMBTM7mgTGFdfA/8b1cNlCGQFlHSKchVCUp+IxuEg
   HowvdLmqShTZ/PiZ5MAw2MBRejhKG0sdhcDD7u0W8mU8b94PV63RCo1fM
   WdHvEkYCEFvnxdeiKMYXeMqjfgoqL5DasGvmzW04uH4Jg22jHp+LuCgTc
   A==;
X-CSE-ConnectionGUID: 2eIjFRZgTKmcJ38Lq2covQ==
X-CSE-MsgGUID: rdewHf6ZRWOGRKxqn5RX3g==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:16 +0900
X-CSE-ConnectionGUID: HDWeGh87TYGngXRoL929NA==
X-CSE-MsgGUID: 7gFORB46Sde4hwtBsaBa1A==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446128"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:14 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:03 +0900
Subject: [PATCH v3 1/4] kernel: param: initialize module_kset on-demand
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=3602;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=Ep6QIT5ucgr5upYbumWW0j4HwLVdmH1vYS1Pt6Gv6zc=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM6dzfuk0KHdssl6afcBb7vreN/8eWjKq1OsHBuz/r
 rf2/omFHaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRBQWMDL1xyXY+2Ub9fQZd
 qjp73WJ6dO5Wyz+NUj7787vW13nSSxj+R5nGGMYFd6mwrNkTv25dfXkZm8McGYkGdv53KcxLLL9
 yAAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
of platform drivers register themselves prior to subsys_initcalls. With an
upcoming patch ("driver core: platform: set mod_name in driver registration")
that sets their mod_name in struct device_driver, lookup_or_create_module()
will be called for those drivers, which calls kset_find_object(module_kset, mod_name).
This fails because module_kset isn't alive yet.

Fix this by initializing module_kset on-demand in lookup_or_create_module().
Retain the param_sysfs_init() subsys_initcall to ensure that module_kset is
live after subsys_initcalls (assuming no OOM) for any users who may need it,
on the off chance that it wasn't init'd on-demand because of no
pre-subsys_initcall drivers.

This on-demand path can trigger before subsys_initcall. kset_create_and_add()
be should safe in those contexts because the allocator is up and running by then,
no userspace to start uevent helper or listen to a uevent socket.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

---

Patch 3 depends on this patch.
---
 kernel/params.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..f25d6fda159c 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -745,6 +745,26 @@ void module_param_sysfs_remove(struct module *mod)
 }
 #endif
 
+static int uevent_filter(const struct kobject *kobj)
+{
+	const struct kobj_type *ktype = get_ktype(kobj);
+
+	if (ktype == &module_ktype)
+		return 1;
+	return 0;
+}
+
+static const struct kset_uevent_ops module_uevent_ops = {
+	.filter = uevent_filter,
+};
+
+static struct kset *__init_or_module ensure_module_kset(void)
+{
+	if (!module_kset)
+		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
+	return module_kset;
+}
+
 struct module_kobject * __init_or_module
 lookup_or_create_module_kobject(const char *name)
 {
@@ -752,6 +772,9 @@ lookup_or_create_module_kobject(const char *name)
 	struct kobject *kobj;
 	int err;
 
+	if (!ensure_module_kset())
+		return NULL;
+
 	kobj = kset_find_obj(module_kset, name);
 	if (kobj)
 		return to_module_kobject(kobj);
@@ -911,19 +934,6 @@ static const struct sysfs_ops module_sysfs_ops = {
 	.store = module_attr_store,
 };
 
-static int uevent_filter(const struct kobject *kobj)
-{
-	const struct kobj_type *ktype = get_ktype(kobj);
-
-	if (ktype == &module_ktype)
-		return 1;
-	return 0;
-}
-
-static const struct kset_uevent_ops module_uevent_ops = {
-	.filter = uevent_filter,
-};
-
 struct kset *module_kset;
 
 static void module_kobj_release(struct kobject *kobj)
@@ -940,7 +950,7 @@ const struct kobj_type module_ktype = {
 };
 
 /*
- * param_sysfs_init - create "module" kset
+ * param_sysfs_init - create module_kset if not already done
  *
  * This must be done before the initramfs is unpacked and
  * request_module() thus becomes possible, because otherwise the
@@ -948,8 +958,7 @@ const struct kobj_type module_ktype = {
  */
 static int __init param_sysfs_init(void)
 {
-	module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
-	if (!module_kset) {
+	if (!ensure_module_kset()) {
 		printk(KERN_WARNING "%s (%d): error creating kset\n",
 			__FILE__, __LINE__);
 		return -ENOMEM;

-- 
2.43.0

