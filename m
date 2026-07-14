Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513DD4483AB
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031945; cv=none; b=oWTosfyMk+JVp4Dj6kpyYMyhGszkZ+YI38f7rrRqNmEWRY7v2/ZACsGjJCfl2QFbwAhBn2kMhsF0eAyKWRYV3eHJP1foIAcotlmiyMo37UnZKUswNz0QwDgexmlsbVSlimO1Fg9yjyIjyiwQbkCnSEAo6jUbMslHX7DlgChObFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031945; c=relaxed/simple;
	bh=J6NlgFsAKVrRbc9Bh9K1zEA5jJs7eG1zbZHbBQ6rkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wq5x2dKisPSj2pwnYxXG0k3N6hxKvTh9cV9ZFmMaRRNTfPrdWkALoMW7wgsxUzLo3rJkrzI5qDmhBizKfB72UXjSS0WtTpU4cTFrc3PHPNs0iWoN3ZtLEeLQ8BkacMDuP2DstdpeOmb9rNQGd89WmxuxN7yRfAunOUtSz8RsBHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huMDaOTL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huMDaOTL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720f3bf164so453457f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784031929; x=1784636729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ncG6NWUejHTeECNrJBlBEYBi8S2JGts4XbtecPD+Mg=;
        b=huMDaOTL1YTn7uHZUwoZFpnn6KrohmwK+rpKzhrCxoOj2zVCQZJRFQGsLGRE4Zk2rD
         7IBWcW/ul4sie0aFzqYuHJav5kDWYVf/zzfX76exbXPJwUQhshrWPxAMZyYgcJROESWN
         rid1n0DKxw0PLgHb87vewmfEshavGS1etEQCFpoUGwHkQPrqXcPoFeTUITDy7yDuarJW
         ZB0EiIUq/buk8mUamT6tDvOZ+Tbk3wFX0vCZtOhtEFkCRMIq+zMj9JL/GdfBxFi0EQJo
         w50s0OB4tUgk7xaHY1Uzbkim22HgGzR3cUz5z8/p2jpnS1zWz42Ff0I1RfcUYNAC0Vo8
         jUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031929; x=1784636729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ncG6NWUejHTeECNrJBlBEYBi8S2JGts4XbtecPD+Mg=;
        b=nnWYHPypOeVQRWtf767UGR1vTU+ofPcMHEIsFH5P1cSuk6ZrxcpHPsbNPeyUAzusDo
         PYF4HKUtaJYhdmBc2wkQc5Ceg5DQght+g1KYZ8mrjqWSfK0F0NCl0sfvkgwywBqTmwZU
         ch/J02Je4HHNywnkvEs/exMmteIKQILA62vanD17TwjMvvwqbpT8cqHYlK4VWBTb+aKu
         lt81v+OzD2I7eSCeqqr+Av8TRQwCDjzVItyg6VOxIMvmqXDsG+ERm3aQp/pRmRp2glfx
         qEvWOeS5RuHgCXUDrtiiKK8tzhLsq59pvuZjI2gcPhJOiNsv+z5jD0YY68loIo4o4up2
         9fYA==
X-Gm-Message-State: AOJu0YwVDA6WchwG1w1AXURfH85V5sOuprdve8neXCWvXSpsuqX6gq5U
	/RnehMKwxTZS/Vnrf84QCsPas/H0EmQzSvQ4Y5XKzJCWHD60iZU68po2
X-Gm-Gg: AfdE7cmR+drtajlDYb4uAjEdip+Tu/RK32sy9evUYaS7NG/hUceqMgtB9jfS1hOxk4Y
	ojPUPy4d1kEv0xuuSlz9CDNjwkhC+4150Q7U9bXLW/S2k81acA+RBu7Ut64cXY200loxz+0SmPJ
	ncznmC6rVaftXkYHoKPNnoc0kDhfNllmc5kTPsPOCpvReh3pTYSBjP2UWEajUFCtwMUTeEHOnV2
	pEisSKsqMyFB58p5FCjcNY864rSoTba91bjNkIyUk6ZcpsTeipW1/SAvN6OrbD+3+fZqwDAWQ7O
	57Fnytybd1ILMbIPsUav8hYM2HUmTfcSzqnK/JoKVIrzvTJQlsMinbsTpY8ckm1Z3whvKypRMnq
	QyZqZjGS9Ak4RavQWarSa+lcTF1PkJmnRskqC5xNlWdUyNrT2MkSksPvbx60uR0sv5it7GFtTxe
	kgY3QjLFoS0Z+iIG9IwXiP0e49LljfPsgalw==
X-Received: by 2002:a05:6000:2f86:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-47eee0b8778mr21935039f8f.0.1784031928859;
        Tue, 14 Jul 2026 05:25:28 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635ac2esm8026897f8f.13.2026.07.14.05.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:25:26 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	nsc@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v3] scripts/tags.sh: Add support for rust source files
Date: Tue, 14 Jul 2026 14:24:41 +0200
Message-ID: <20260714122441.78158-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
References: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

To fix this, modify the functions `find_arch_sources()`,
`find_arch_include_sources()`, `find_include_sources()`, and
`find_other_sources()` so that they can accept an unlimited number of filename
patterns as parameters for the search. Add the `setup_name_pattern()` function
to convert these filename pattern parameters into a list of parameters that can
be passed to the `find` utility via the new `pattern` variable.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc:	Boqun Feng <boqun@kernel.org>
Cc:	Gary Guo <gary@garyguo.net>
Cc:	Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc:	Benno Lossin <lossin@kernel.org>
Cc:	Andreas Hindborg <a.hindborg@kernel.org>
Cc:	Alice Ryhl <aliceryhl@google.com>
Cc:	Trevor Gross <tmgross@umich.edu>
Cc:	Danilo Krummrich <dakr@kernel.org>
Cc:	Daniel Almeida <daniel.almeida@collabora.com>
Cc:	Tamir Duberstein <tamird@kernel.org>
Cc:	Alexandre Courbot <acourbot@nvidia.com>
Cc:	Onur Özkan <work@onurozkan.dev>
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V2:
https://lore.kernel.org/lkml/20260714083709.69517-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com/

- Remove "Cc: stable@vger.kernel.org" tag, because this commit introduces a new
feature.
---
 scripts/tags.sh | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index c9dc2763a505..41e38df96984 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -46,13 +46,31 @@ elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
 	ALLSOURCE_ARCHS=$(find ${tree}arch/ -mindepth 1 -maxdepth 1 -type d -printf '%f ')
 fi
 
+setup_name_pattern()
+{
+	pattern=()
+	for ext; do
+		if [ ${#pattern[@]} -gt 0 ]; then
+			pattern+=("-o" "-name" "$ext")
+		else
+			pattern+=("(" "-name" "$ext")
+		fi
+	done
+	if [ ${#pattern[@]} -gt 0 ]; then
+		pattern+=(")")
+	fi
+}
+
 # find sources in arch/$1
 find_arch_sources()
 {
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	local src=${tree}arch/$1
+	shift
+	setup_name_pattern "$@"
+	find $src $ignore $prune "${pattern[@]}" -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +79,17 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		shift
+		setup_name_pattern "$@"
+		find $include $ignore "${pattern[@]}" -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	setup_name_pattern "$@"
+	find ${tree}include $ignore -name config -prune -o "${pattern[@]}" \
 		-not -type l -print;
 }
 
@@ -76,23 +97,24 @@ find_include_sources()
 # we could benefit from a list of dirs to search in here
 find_other_sources()
 {
+	setup_name_pattern "$@"
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       "${pattern[@]}" -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '*.[chS]' '*.rs'
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude '*.[chS]' '*.rs'
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources '*.[chS]' '*.rs'
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch '*.[chS]' '*.rs'
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources '*.[chS]' '*.rs'
 }
 
 all_compiled_sources()
-- 
2.55.0

