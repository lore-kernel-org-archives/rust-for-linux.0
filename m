Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C137701C
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009487; cv=none; b=oYj3Swz2lnILRfrthDD+GINJRHHsO0799+Nx6OZX06rv4vxp2Mru18/6a8XdLaczMP/tw0xRpiyGZaqisjoSXczJUBYEBv7A1Ac/tozJ19Z+n7TvyJ5TMvmAlXH1/jd3y497ahbrwNLX4NukrUdrlLUNv4GnzrnDyLGqLO0TpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009487; c=relaxed/simple;
	bh=w2CHf/Ruyl0ieMWiVy7QleNiafjxfD+l+EFZ1XXXNB8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=RTBVv+RrZEcVhXjDctZgewopeJLXj5kWV5rP2HNyrpNB97xNshmtgJSt5pDM4SS/Vch1MGkCneu/TA2uRpMoRW4fqDzgBtHBUukSytfWvIYLA6zXXESPY/wo1zBpzzfkQv8enXlmGZojdgvdhrO7lhkiz1HylcAjwoOjmOywEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir4gbnxE; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir4gbnxE"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so48117a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009484; x=1791614284; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=ir4gbnxEYnj8MisDdoh2wYz7JDHlJTCmhf8medao28SMIzq4NAWkf0ReXrErcyRePu
         KYL62hbQCDuBRabP53yqOzo21q9Z1Qu3JS02vsmrsF8lbmufMc4VpPVBKi79MTCXIo33
         8wUcc7BS5tppb1lzOCyUW7Pbd4tZpmLBF0s9MhdUEdgZxxOIoFlh8nRqh77cIJ+d1Kom
         XVc+9Py5vO/ZY7NNBhTjHYlKbzBd2zgUgxGmrTTjIPGnpaerNNgFmzGLOupGDtJvz9op
         e7c8gqGeTkF4yGlIJr6T4txba4hezFKH+14YeDOtMxg+o3hzr8eeMmp1c+W9zjWzOzVO
         MJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009484; x=1791614284;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=y5CI4o5c2N0Z3HftQPtX5RIcINnF3M0uz/zb2RuMrd20f9Jjzal23+hgFZOFJNyYA9
         INfimVZFogf//CWx/uwSs8aumzqLM71SlhA+LAR0SZ8QBap0KelrOskDgkG/8DNYtAbN
         KLulBYsBXp4skbZkaoVIxzfiCh9Qe1p26ZMWwiiPNewdlqaGvoLSIOOWKrR1Dth1FPA1
         BA/MXHwoRy1uyy4Q4f1yP1e4EHzfwEv3IBfmwN22Rf3+Agr4RLLSWLM3ErTB6oElgLol
         hW4G9rVBbDWq3nMCpxX/jplKiqeyQYjZdDisFbgZAThIMeXmbyb0n86gCsec5tuJNv4/
         oaLg==
X-Forwarded-Encrypted: i=1; AKwUvBx8umhfmVY1xEmCVnAp6fYhhmg1unLcFyTUAftivzdhHz6GelBBtkUKSuMjomdsfT9M+9cKzN8kRZ1fUtRwFA==@vger.kernel.org
X-Gm-Message-State: AFuF++mu9MI/fGvc4VTzwzHykjUBg/eLvpKTAS3pf3oHWZDdH/UaIXA0
	EfYot0ljcVp+bk24iA0lfjQXl1M5FpUf9o5MBaHQei097gPbkSmaXxcN
X-Gm-Gg: AYBFou07Y4RId5V4vVs52mQL89ltRlBJLtenW49YssM+Zvjjnk0wI8CGVwZQ28PmP3S
	/RssXorZ+9qgx4AwQNbal1Ch4l8lXgs6LjEaxgLd9PlSVlhMSnLcwhFWcIRs6jfD1OFyEVfzzKu
	P4Q9IlzeWnEmxNK9bduRswO3Cturtn9A3MEpb/EQcWCuMoVCnlcD/tpNpMfixnyD4J2xM5GA7l2
	aekfxnthmL93FE6PytzijAKqwsNZcwVaci6Osz8sqtNOHFoFsDjMQ7e6XgathkGuoSd6+EWrfoG
	uqmDfJfH3cK/1fLBe1YCBfpMymponWW9oOkDm6F6q8JTIpThF3RDpSLyYFShkgzEvu7OsvIEICr
	Ez/F7cAxNVidg6C949+c13CoqFqE6SOg1lUDpQGOAtBZ/PQWVl5r7E63W7SokbS1/HWKf/IP4i7
	3WA9abDm1Dul5JQX/WrBKgoFQ5+oeRuUoGlQxnF2wcOnEJpBI3qTPR7kiIzpFySrVROXjxU6mwr
	FKaU6TZfx3AHjQLSsa7CZw0AKr1nLbFHj7CB7DYUPlFLL0sulPC7xVJjAZe2D5Egrny9zatFBfa
	Fqc=
X-Received: by 2002:a05:6a20:7495:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e0bd4bff2bmr4998287637.83.1791009484332;
        Fri, 02 Oct 2026 23:38:04 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm1809155a12.17.2026.10.02.23.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:38:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:38:02 +0000
Message-Id: <DLUZVHOLSN1B.115EUX4KJBEA3@gmail.com>
Cc: <alan.maguire@oracle.com>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <qmo@kernel.org>,
 <nathan@kernel.org>, <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux@weissschuh.net>, <christian@heusel.eu>, <mcgrof@kernel.org>,
 <petr.pavlu@suse.com>, <samitolvanen@google.com>,
 <linux-modules@vger.kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <acme@kernel.org>,
 <namhyung@kernel.org>, <irogers@google.com>,
 <linux-perf-users@vger.kernel.org>, <jikos@kernel.org>,
 <bentiss@kernel.org>, <linux-input@vger.kernel.org>, <tj@kernel.org>,
 <void@manifault.com>, <arighi@nvidia.com>, <changwoo@igalia.com>,
 <sched-ext@lists.linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <arnd@arndb.de>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v4 00/12] bpf: make the vmlinux BTF an
 on-demand loadable module (CONFIG_DEBUG_INFO_BTF=m) to save ~5.4 MB memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Jay Wang"
 <wanjay@amazon.com>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
In-Reply-To: <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
References: <596bfb65-db2d-413b-8039-c921031b50fd@linux.dev> <20261002073422.14253-1-wanjay@amazon.com> <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 01:58 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>      Keep zstd-compressed blob in the kernel image and decompress and
>      parse it synchronously on first use.

imo this is the only one of the three worth considering.
