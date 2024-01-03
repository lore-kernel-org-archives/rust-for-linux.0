Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF41399
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oX8dysJw"
Date: Wed, 3 Jan 2024 14:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704309619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=2n5Wy+0viuq0l7mbBSr2M1+NxmxpTM07JKuAnoLaX5o=;
	b=oX8dysJwTTozy/JbAOkFMwRn9dNwVbBwHd6oIJt5Qo5cUlxmx3ESl40X+Z9zRL0pR1OkGE
	eJzCu0wlN+w7rq+LfVtfTkscl0WsPY4KPHxd7gl/Vrx+ylkC7vBDEKoi4ETGgXf9zpIRqR
	Oje3KNATC+NqIqFJtOOweEzF+YK9i8o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: rust-for-linux@vger.kernel.org
Subject: mixed C/Rust module?
Message-ID: <jz4dal5qawwz6i4hle7v5emgvyvc742fshnebnkufk5ywcg236@fcotiyv4bbdn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Has the build support for this landed? I'm not seeing any examples in
the kernel source tree yet :)
