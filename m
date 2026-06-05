Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7F3FE37C
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 05:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637019; cv=none; b=Jt0bFSEKLFcFP0g7oGpfzsy2FcKh+0AptCOr+j/L16dPMsKA1PI4cxU+sqzUEU9GhXzZQOtNmh1E5jJ0gjV3XIWJljK8JuH+g5G6BCFdn1bNGzO9/QbwRpZ6iOkWKVj1jQmAQ4gNgYd1s8u54Wzfdi1E+x8LdAet5qYwgCTG8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637019; c=relaxed/simple;
	bh=ZdlYGJumHKoZOKGiksSHjcAcW9MAjRFhtKO147bVRyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvqZhX8+qvWpwUEsvlYPkNDEAhCd23SDt+/Zg+aK6t7cVuUJL8lvTmklQ7/F7voGi3z/J91iy+58A0B/weCI9QyfA6Kqm5VrtVVgNU0UfR32LZUb3jnmxDF2OAKthsvb8v83Rzy/BpdpA5EPieeHsMDEjBPwHVVoJaamwfiexhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBkTDa5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBkTDa5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5341F0089B;
	Fri,  5 Jun 2026 05:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780637017;
	bh=bUCZYh/PbQjpqPeDUpUQn+REiFWUHye81F7h68C0d38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dBkTDa5/7344NY19ZKUNs7ar4PL6Ozyqn19PU/dnB4e5lHcSEFA74lp0NKX966Nne
	 lR5YMLpHdFwR4pJC8+9KWixOxKoi+NwCYZIPdZSSU7T+VF2NMTAGrwE7BzP6dCy7Ot
	 QZfBzwCIGN29DlQGGgJalbNTdGbNWaYvKBRXJbth00kguyI1cIs0eCtbFZToy11aaN
	 BK99Clkk5kurDWMjR539oZ0GVwA0PJyXC4PCz02xuDAEHNvShaAWzEudTgBkxfTLOK
	 6I1JOZu7A7/4tHNBjSfOtEj6/5aksdwvhPSMUwLj1ew6fKTQxn4U/mBj47uE8qL6Yt
	 W4NOv4LhjEINQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D404DF40089;
	Fri,  5 Jun 2026 01:23:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 05 Jun 2026 01:23:36 -0400
X-ME-Sender: <xms:WF0iahmOfCbXtw8Ce9v4X-sqvbM4_r_wRtNULFr0xxJ8lCaEMxgyhQ>
    <xme:WF0iauON2Vmo2fPnJ3HYm0Yy4xqLZI9x0mK1t0boVo9iTxw7BQyYW5iEUIC9zU7KF
    4L6pEvNDwonoqnzmmiLst8eWsprypEupjMg_qHv7GvQUSsvwxUb>
X-ME-Received: <xmr:WF0iag4bFvomrvkX-AZajAzG4P8Qy66IiI_xL46VVbc0Ol_kty8LqwQslzM>
X-ME-Proxy-Cause: dmFkZTEINg2JP7CC2j0uBv3bctD9XT1AD//I24n4hb8wNfR2zWW5EP4mYWbXjwlnvmgVEn
    uUi4+SVc9+eENn4WTaIHLH14cpiyAqUMgMfNeLxqJhx/vSeQGl9wVCrWfYH0ZeMxFiCKKY
    pHrUEp4aShf5PVH3J0duQMDB+J8l58PbIT7EsIc5P47XdYwqAcuBZaHsosv1a2GdUqlY0C
    CVZt7Rf0NvXC49fQuRW7COFntIRj5z6n+HUUe13FJ4mz/fSBa4zmRP8wuBRfyHYGXA1Ztc
    epz2yU5SSxVBzkL+028bVaCdwWiqveGk59hEnvMqSVPdJlNgtaScwJXDgjegXjDQd7c1aF
    VtRXfTaqdVZX0+UYEnk+JStR6p+37cnrZc7/Bv8CPxZ2V3uQa/gOsbzC7HS9jcGz4+ChZv
    8y24EJAh6vYJxX2tGil0MC5fMUoPDwsEKAKn/J9QB05VBLHTG+dhJnkidhG7MemCCaz1od
    Ogj7mYpHsf98y98Iladid3vDbbUUv0QJI/00ggF60NrhA5n4RnFSEKC8NuEJZ4HYapQ2e4
    6V9WTOr3H/PnrRX19+ALn7jE29ANlxXawn6drjRhSCOu3eilu5y4CangzYdEmwS7qlHLxN
    Jl7EiGnxTax0F5HnbmhUGIHvwWvQYDjdsVkBVOWJLE3+qaAhE9eJbf9RriHQ
X-ME-Proxy: <xmx:WF0iap3PlnAlT7jSY9gTPqKcVWfrsng60tSDySz_1rNhtu4Aph4pQw>
    <xmx:WF0iamp9Hw_ES9mGOcAZWwIvZIpIzAO8wNjVjblA_1K9O3R5PsWaEw>
    <xmx:WF0iarn_sFkmlwGRuceleTmouhyWlfnjs2m_v5NuA2WXyQ1bsScM8Q>
    <xmx:WF0iagRqmBS7Q572uThovAGc8lAT9m5knV8DQuUQrAnERN-bONCRJg>
    <xmx:WF0iatDzigwY1Y2uLhkA76mOLdrE_7zJPf1ReiBNrCe9sZRqdDL3cC0S>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 01:23:36 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH 2/3] locking/lockdep: Replace snprintf with strscpy in seq_stats
Date: Thu,  4 Jun 2026 22:23:30 -0700
Message-ID: <20260605052331.1628-3-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605052331.1628-1-boqun@kernel.org>
References: <20260605052331.1628-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thorsten Blum <thorsten.blum@linux.dev>

Replace snprintf("%s", ...) with the faster and more direct strscpy().

Reviewed-by: Waiman Long <longman@redhat.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Acked-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260318001426.2664-3-thorsten.blum@linux.dev
---
 kernel/locking/lockdep_proc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 1916db9aa46b..e458fa258d05 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -19,6 +19,7 @@
 #include <linux/debug_locks.h>
 #include <linux/vmalloc.h>
 #include <linux/sort.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <asm/div64.h>
 
@@ -488,9 +489,9 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 		const char *key_name;
 
 		key_name = __get_key_name(ckey, str);
-		snprintf(name, namelen, "%s", key_name);
+		strscpy(name, key_name, namelen);
 	} else {
-		snprintf(name, namelen, "%s", cname);
+		strscpy(name, cname, namelen);
 	}
 	rcu_read_unlock_sched();
 
-- 
2.51.0

