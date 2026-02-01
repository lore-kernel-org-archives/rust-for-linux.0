Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C54A3C;
	Sun,  1 Feb 2026 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769974659; cv=none; b=mOGY0bOPJZN5dPE+TFzR0wffk9Jc/dpdnNcg4xojo56tqRP47cSm7wfvRYaaNfrETnTbcRiQPsv1Bp6hWKDAOnPcz1F0+GcBVTuiNYUMr1I6NB9vYKxJoWY1phZERMsdvWnGOL3w9mWnlmFB3wZXP8XTXmi3FclWjW2vR3hw/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769974659; c=relaxed/simple;
	bh=5Ks+ASkivo5Tvya5nJCbPfSxOCic+pOY7dPYnc9yDfM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYKhKsSanndi03cX3qzxnoA+W3Y3tsSDHTwfzpnyPQmF6R+IekAneLEAk4vNNCAzhdkSnc/EEt7BfgQquNWRxuYFatkZB2tjgClesHgWhM/aanc10n/Iy5iH7mXb4vpyK+sv+STxAulJK74bMa/SWw1SQBz38arXyWmHCD/f3fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 2C3831B11BB;
	Sun,  1 Feb 2026 19:37:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id EC4AE6000A;
	Sun,  1 Feb 2026 19:37:27 +0000 (UTC)
Message-ID: <d290de0964c8f0dd3e039a4b892b8171520bf503.camel@perches.com>
Subject: Re: [PATCH v2] scripts: checkpatch: warn on Rust panicking methods
From: Joe Perches <joe@perches.com>
To: Jason Hall <jason.kei.hall@gmail.com>, charmitro@posteo.net
Cc: apw@canonical.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 01 Feb 2026 11:37:26 -0800
In-Reply-To: <20260201183005.1681807-1-jason.kei.hall@gmail.com>
References: <875x8gqt3y.fsf@posteo.net>
	 <20260201183005.1681807-1-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: c9wz1zsqqzhmupppakt8cyegapfj7r6o
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: EC4AE6000A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+MkrVOkM+UekWXSxmB+McJKQdrsNa90zU=
X-HE-Tag: 1769974647-147849
X-HE-Meta: U2FsdGVkX18r6DxPHm9jt/BKPXpYGIdOWlXsqZc569dGOPkODxlZOIgW7JrngqQoF6JKpmzK2RYsB4Y4xa6coQ0fsowsIna1GYxpdl/fFW1ajNxcgBrvtW2X8V3snCPGlAmHrdwrsxq8VuEWfkm8By/mUGMGeMi1kZzBKGo5hzVCWXlTBk8+rnSLyURH7Y4e/PHmP25VYCLC1DBnIFpZeiLEPDBiGsPTZ/3aEpJC3liqGQcJB+Wr0vCD+grYLzSYGgtZojgqsz+ti73eSDIahIX02A6+0oVMJ93u1n6J3cSkCSWTEZ1foJwaY4fIgMQOErFa8ZhiTXi/4ilCImUsvVY6yKpLMCTu88RZ6SUFEFujwxWQYUHjuw==

On Sun, 2026-02-01 at 11:30 -0700, Jason Hall wrote:
> Added regex check in checkpatch.pl for common Rust panicking methods
> like unwrap() and expect().
>=20
> Allowed an exception if the line contains a '// PANIC:' comment.

There's some desire to add rust comment checking.

https://lore.kernel.org/lkml/20260113211025.637889-1-foster.ryan.r@gmail.co=
m/

Maybe this could be coordinated.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3834,6 +3834,17 @@ sub process {
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
> =20
> +# check for Rust unwrap/expect
> +		if ($realfile =3D~ /\.rs$/ && $line =3D~ /^\+/) {
> +			if ($line =3D~ /(\.|::)(unwrap|expect)\s*\(/ &&

Please use (?: to avoid capture groups

> +				$rawline !~ /\/\/\s*PANIC:/ &&
> +				$line !~ /^\+\s*\/\// &&
> +				$line !~ /^\+\s*assert/) {
> +				WARN("RUST_UNWRAP",
> +					"Avoid unwrap() or expect() in Rust code; use proper error handling=
 (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
> +			}
> +		}

