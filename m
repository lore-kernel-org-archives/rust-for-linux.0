Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55C175A95;
	Sat,  9 May 2026 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778349249; cv=none; b=PEsiGqhvNb740owsoTD8iAx2WOXykdnoL6J8c4prBI+df+ebLhiin2Xa0xQyeJLeiJLU3JrpnrXFSstKXhzqPw+UrXwvuWoSqWRI2n4dVzH7GXWJZviHfgJSAsMexd2F2tIbW1ha5lVqUmujRtrtHZloClsGV/yWhzutXkEBog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778349249; c=relaxed/simple;
	bh=Jg4Vzdh3WC0PBHRv+xPu1VBKqkNn3CBcsVX9iz0++R0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jmc6DJoWd+UHCkEPW9QDYDZj8zSlDApaQF9SIAf8TzVN1IXuSVvQf1dpavXO3oYkn35COXiwoEGnkRk/m/W29b+uLRA8tjO9r+kv4btkAw/vezIb7AvtnHGuS837C68aw1CXekyskQXVJrrm+NyghbDXQ33i9if2GM/5XzOKuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 5A8F11C00F9;
	Sat,  9 May 2026 17:54:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 7461630;
	Sat,  9 May 2026 17:53:55 +0000 (UTC)
Message-ID: <863d3c57dd748bbad25e9c5b7a4fa710e16c6df1.camel@perches.com>
Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
From: Joe Perches <joe@perches.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
	 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda
	 <ojeda@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>,  Gary Guo
 <gary@garyguo.net>, Matteo Croce <technoboy85@gmail.com>, Shuah Khan	
 <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Date: Sat, 09 May 2026 10:53:54 -0700
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: hrc1q7gjow5xrie88r4c98wywqccijw6
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7461630
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18Wc5FBJ2qw2F56aPUrkhd44M4hxzgJ6mU=
X-HE-Tag: 1778349235-666253
X-HE-Meta: U2FsdGVkX1+T+JkWvcDKIbZh2OBWR3H80StHcKEDyCLoSOwJpAZ/a1w0B8Xv4piA/QsD+aWUTkIkW/+L+YCWL1ozXD7RuO9albFGxlA4n2qPijW+OEDAWAw2gk2e7G3hYXL8nsqHjbIp0wAMBzMizN6uzS9B5duo+LvarMm60CFE3Q3T05XYJxDQ3a4N3USfbVb+t4V0qpjgGaFyzNPLpkt4tsnqnV53KfSxZqCkMQBigQUaafOhm/r7mn+bKfAqNHgZPWnKx1M0Ehp5H3mRvuG2kdbZPcpGsOrXfSVGKyrXmxhyXvJNO4VptM2Nv8XM

On Sat, 2026-05-09 at 08:56 +0200, Mauro Carvalho Chehab wrote:
> This series improve the output at process/maintainers: instead of a
> pure enriched text, the maintainer's file content is now converted
> to a table, and has gained a javascript to allow filtering entries.
[]
> (*) Currently, MAINTAINERS file has several entries not sorted.
>     One has to run:
>=20
> 	 scripts/parse-maintainers.pl --input MAINTAINERS --output MAINTAINERS.n=
ew

Maybe add --order
