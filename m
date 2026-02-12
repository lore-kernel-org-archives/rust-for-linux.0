Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7813246BA7;
	Thu, 12 Feb 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890775; cv=none; b=PZ37iKjZNHoeFnuMISWnedyHdvlpSXkGtN+eo2GyRUPHiuOBM8hS/V5Fcd18Ggxuuojmp1gJnuHv1cOj+fq8n1z63b1kEgDhnEooSyQHIhgR5TmsoA7BA29n9lL4hxXlbZJ9f9hPOvI+D/ic5jEmf55ceAFGDQRUQpkqPrbcl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890775; c=relaxed/simple;
	bh=vjtwD7ev6GdoZJamjKxNDWS6gGcK9BJQlzax4zWWwHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g3BrVz44A9shpPQg+xuG9nZvlUanEkHhOf4Oob7jn+zg4rp5waRwjuKn1GBYVrFJoSPBc6m0J3ExHEO/0zBL9qO0xRXZYAa9RqFAeYej2tJQvw+52VXqu+JVKeJqsNES2CD+RSWR15Y75mSCq+NnNh8My5fM/DhCsI4bXJmKhFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=ociVI7so; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ociVI7so"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id D48C7C00A5;
	Thu, 12 Feb 2026 13:06:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id d5RU869G5W20-aR99l8st;
	Thu, 12 Feb 2026 13:06:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770890764;
	bh=Q1Uxz3qdI5DYZbxwCOrlky4H0PgOY4+4wHp6bfHqcIw=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ociVI7so0a3pU/ge/sfVnrryfnx+jx6+RqUb7BMsBdaa+jfRE9V5nRJnXJpcoo8Wu
	 +YIzem3Kl7YA1kftoza01RXgvGPz+UBUKpGjcRM93IMuDxCEIZaYkG9NLM6vLmOfyX
	 wx2o3+UYAZ5rfr6V1G/pgAss8Dfplez3bD8xiDqk=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] drm/tyr: make SRAM supply optional like panthor
Date: Thu, 12 Feb 2026 13:05:37 +0300
Message-ID: <20260212100538.170445-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
- Add rust_helper_regulator_get_optional() to fix CONFIG_REGULATOR=n
  builds where `regulator_get_optional()` may be only a static inline.
- Update Regulator invariants documentation to mention both regulator_get()
  and regulator_get_optional().

Onur Özkan (1):
  drm/tyr: make SRAM supply optional like panthor

 drivers/gpu/drm/tyr/driver.rs |  5 ++--
 rust/helpers/regulator.c      |  5 ++++
 rust/kernel/regulator.rs      | 45 +++++++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 4 deletions(-)

-- 
2.51.2
